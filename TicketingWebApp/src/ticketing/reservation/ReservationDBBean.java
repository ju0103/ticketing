package ticketing.reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReservationDBBean {
	private static ReservationDBBean instance = new ReservationDBBean();
	
	public static ReservationDBBean getInstance() {
		return instance;
	}
	
	// getConnection(): DBCP로부터 커넥션 객체를 얻어내는 메소드
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	// reservePerfor(): reserve performance
	public int reservePerfor(ReservationBean reservation) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re = -1;
		
		try {
			conn = getConnection();
			sql = "INSERT INTO reservation(MEMBER_MEMBER_ID, PERFORMANCE_P_CODE, RESERVE_ID, RESERVE_DATE, RESERVE_SEAT)"
					+ " VALUES(?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reservation.getMember_member_id());
			pstmt.setString(2, reservation.getPerformance_p_code());
			pstmt.setString(3, reservation.getReserve_id());
			pstmt.setTimestamp(4, reservation.getReserve_date());
			pstmt.setString(5, reservation.getReserve_seat());
			re = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}
	
	// checkReservation(): check reservation
	public int checkReservation(String pCode, String memberId) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re = -1;
		
		try {
			conn = getConnection();
			sql = "SELECT performance_p_code FROM reservation WHERE member_member_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				if (rs.getString("performance_p_code").equals(pCode)) { // 해당 공연을 이미 예매하였음.
					re = 1;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}
	
	// checkSeat(): check reserved seat
	public ArrayList<String> checkSeat(String pCode) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<String> seatList = new ArrayList<String>();
		
		try {
			conn = getConnection();
			sql = "SELECT reserve_seat FROM reservation WHERE performance_p_code = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pCode);
			rs = pstmt.executeQuery();
			
			while (rs.next()) { // 예매된 좌석
				String seats = rs.getString("reserve_seat");
				seatList.add(seats);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return seatList;
	}
}
