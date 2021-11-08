package ticketing.inquiry;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import myUtil.HanConv;

public class InquiryDBBean {
private static InquiryDBBean instance = new InquiryDBBean();
	
	public static InquiryDBBean getInstance() {
		return instance;
	}
	
	// getConnection(): DBCP로부터 커넥션 객체를 얻어내는 메소드
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	// insertInquiry(): insert inquiry
	public int insertInquiry(InquiryBean inquiry) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int num = 1;
		int re = -1;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT MAX(I_ID) FROM INQUIRY");
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				num = rs.getInt("max(i_id)") + 1;
			}
			
			sql = "INSERT INTO INQUIRY(MEMBER_MEMBER_ID, MANAGER_MANAGER_ID, i_id, i_title, i_type, i_quest, i_ref, mem_regdate, admin_regdate, mem_ip, admin_ip)"
					+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inquiry.getMember_id());
			pstmt.setString(2, inquiry.getManager_id());
			pstmt.setInt(3, num);
			pstmt.setString(4, HanConv.toKorean(inquiry.getI_title()));
			pstmt.setString(5, HanConv.toKorean(inquiry.getI_type()));
			pstmt.setString(6, HanConv.toKorean(inquiry.getI_quest()));
			pstmt.setInt(7, inquiry.getI_ref());
			pstmt.setTimestamp(8, inquiry.getMem_regdate());
			pstmt.setTimestamp(9, inquiry.getAdmin_regdate());
			pstmt.setString(10, inquiry.getMem_ip());
			pstmt.setString(11, inquiry.getAdmin_ip());
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
	
	// getInquiry(): return inquiry
	public ArrayList<InquiryBean> getInquiry(String memberId, boolean isMember) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<InquiryBean> inquiries = new ArrayList<InquiryBean>();
		
		try {
			conn = getConnection();
			if (isMember) {
				sql = "SELECT * FROM INQUIRY WHERE MEMBER_MEMBER_ID = ? ORDER BY MEM_REGDATE DESC";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memberId);
				rs = pstmt.executeQuery();
			} else {
				sql = "SELECT * FROM INQUIRY ORDER BY MEM_REGDATE";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
			}
			
			while (rs.next()) {
				InquiryBean inquiry = new InquiryBean();
				inquiry.setMember_id(rs.getString("member_member_id"));
				inquiry.setManager_id(rs.getString("manager_manager_id"));
				inquiry.setI_id(rs.getInt("i_id"));
				inquiry.setI_title(rs.getString("i_title"));
				inquiry.setI_type(rs.getString("i_type"));
				inquiry.setI_quest(rs.getString("i_quest"));
				inquiry.setMem_ip(rs.getString("mem_ip"));
				inquiry.setAdmin_ip(rs.getString("admin_ip"));
				inquiry.setI_ref(rs.getInt("i_ref"));
				inquiry.setMem_regdate(rs.getTimestamp("mem_regdate"));
				inquiry.setAdmin_regdate(rs.getTimestamp("admin_regdate"));
				inquiries.add(inquiry);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return inquiries;
	}
	
	// answerInquiry(): answer inquiry
	public int answerInquiry(InquiryBean inquiry) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int re = -1;
		
		try {
			conn = getConnection();
			sql = "UPDATE INQUIRY SET MANAGER_MANAGER_ID = ?, I_QUEST = ?, I_REF = 1, ADMIN_REGDATE = ?, ADMIN_IP = ? WHERE MEMBER_MEMBER_ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inquiry.getManager_id());
			pstmt.setString(2, HanConv.toKorean(inquiry.getI_quest()));
			pstmt.setTimestamp(3, inquiry.getAdmin_regdate());
			pstmt.setString(4, inquiry.getAdmin_ip());
			pstmt.setString(5, inquiry.getMember_id());
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
}
