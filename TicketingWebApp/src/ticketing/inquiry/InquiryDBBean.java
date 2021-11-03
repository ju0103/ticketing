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
import ticketing.faq.FaqBean;

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
		
		int id = Integer.parseInt(inquiry.getMember_id());
		int ref = inquiry.getI_ref();
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT MAX(I_ID) FROM INQUIRY");
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				num = rs.getInt("max(i_id)") + 1;
			}
			
			sql = "INSERT INTO INQUIRY(MEMBER_MEMBER_ID, MANAGER_MANAGER_ID, i_id, i_title, i_type, i_quest, i_ip, i_ref, i_regdate) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inquiry.getMember_id());
			pstmt.setString(2, inquiry.getManager_id());
			pstmt.setInt(3, num);
			pstmt.setString(4, HanConv.toKorean(inquiry.getI_title()));
			pstmt.setString(5, HanConv.toKorean(inquiry.getI_type()));
			pstmt.setString(6, HanConv.toKorean(inquiry.getI_quest()));
			pstmt.setString(7, inquiry.getI_ip());
			pstmt.setInt(8, inquiry.getI_ref());
			pstmt.setTimestamp(9, inquiry.getI_regdate());
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
	
	// listInquiries(): return inquiries to manager
	public ArrayList<InquiryBean> listInquiries() throws Exception {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<InquiryBean> inquiryList = new ArrayList<InquiryBean>();
		
		try {
			conn = getConnection();
			sql = "SELECT * FROM INQUIRY ORDER BY I_REGDATE";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				InquiryBean inquiry = new InquiryBean();
				inquiry.setMember_id(rs.getString("member_member_id"));
				inquiry.setManager_id(rs.getString("manager_manager_id"));
				inquiry.setI_id(rs.getInt("i_id"));
				inquiry.setI_title(rs.getString("i_title"));
				inquiry.setI_type(rs.getString("i_type"));
				inquiry.setI_quest(rs.getString("i_quest"));
				inquiry.setI_ip(rs.getString("i_ip"));
				inquiry.setI_ref(rs.getInt("i_ref"));
				inquiry.setI_regdate(rs.getTimestamp("i_regdate"));
				inquiryList.add(inquiry);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return inquiryList;
	}
	
	// getInquiry(): return inquiry to member
	public ArrayList<InquiryBean> getInquiry(String memberId) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<InquiryBean> inquiries = new ArrayList<InquiryBean>();
		
		try {
			conn = getConnection();
			sql = "SELECT * FROM INQUIRY WHERE MEMBER_MEMBER_ID = ? ORDER BY I_REGDATE DESC";
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				InquiryBean inquiry = new InquiryBean();
				inquiry.setMember_id(rs.getString("member_member_id"));
				inquiry.setManager_id(rs.getString("manager_manager_id"));
				inquiry.setI_id(rs.getInt("i_id"));
				inquiry.setI_title(rs.getString("i_title"));
				inquiry.setI_type(rs.getString("i_type"));
				inquiry.setI_quest(rs.getString("i_quest"));
				inquiry.setI_ip(rs.getString("i_ip"));
				inquiry.setI_ref(rs.getInt("i_ref"));
				inquiry.setI_regdate(rs.getTimestamp("i_regdate"));
				inquiries.add(inquiry);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return inquiries;
	}
}
