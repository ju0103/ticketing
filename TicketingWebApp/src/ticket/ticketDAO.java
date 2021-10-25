package ticket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

import javax.naming.Context;
import javax.naming.InitialContext;

public class ticketDAO {
	private static ticketDAO instance = new ticketDAO();
	
	public static ticketDAO getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public int memberRegister(ticketDTO user) {
		Connection con = null;
		PreparedStatement pst = null;
		String sql = "";
		int re = -1;
		
		try {
			con = getConnection();
			sql = "INSERT INTO member (u_id, u_pw) VALUES(?, ?)";
			pst = con.prepareStatement(sql);
			pst.setString(1, user.getUser_id());
			pst.setString(2, user.getUser_pw());
			pst.executeUpdate();
			
			re = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pst != null) {
					pst.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}
	
	public ticketDTO memberLogin(String u_id, String u_pw) {
		Connection con = null;
		PreparedStatement pst = null;
		String sql = "";
		ResultSet rs = null;
		ticketDTO member = null;
		
		try {
			con = getConnection();
			sql = "SELECT * FROM member WHERE u_id=? AND u_pw=?";
			pst = con.prepareStatement(sql);
			pst.setString(1, u_id);
			pst.setString(2, u_pw);
			rs = pst.executeQuery();
			
			if (rs.next()) {
				member = new ticketDTO();
				member.setUser_id(rs.getString(1));
				member.setUser_pw(rs.getString(2));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pst != null) {
					pst.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return member;
	}
	
	public ticketDTO getInfo(int c_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ticketDTO board = null;
		
		try {
			conn = getConnection();
			
			sql = "select * from concert where c_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c_id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				board = new ticketDTO();
				board.setC_id(rs.getInt(1));
				board.setC_title(rs.getString(2));
				board.setC_desc(rs.getString(3));
				board.setC_place(rs.getString(4));
				board.setC_price(rs.getInt(5));
                board.setC_date(rs.getDate(6));
                board.setC_time(rs.getInt(7));
                board.setC_kind(rs.getString(8));
                board.setC_performer(rs.getString(9));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return board;
	}
}
