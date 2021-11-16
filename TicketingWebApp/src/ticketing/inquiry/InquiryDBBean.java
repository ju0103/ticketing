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
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT MAX(I_ID) FROM INQUIRY");
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				num = rs.getInt("max(i_id)") + 1;
			}
			
			sql = "INSERT INTO INQUIRY(MEMBER_MEMBER_ID, MANAGER_MANAGER_ID, i_id, i_title, i_type, i_quest, i_answer, i_ref, mem_regdate, admin_regdate, mem_ip, admin_ip)"
					+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inquiry.getMember_id());
			pstmt.setString(2, inquiry.getManager_id());
			pstmt.setInt(3, num);
			pstmt.setString(4, HanConv.toKorean(inquiry.getI_title()));
			pstmt.setString(5, HanConv.toKorean(inquiry.getI_type()));
			pstmt.setString(6, HanConv.toKorean(inquiry.getI_quest()));
			pstmt.setString(7, HanConv.toKorean(inquiry.getI_answer()));
			pstmt.setInt(8, inquiry.getI_ref());
			pstmt.setTimestamp(9, inquiry.getMem_regdate());
			pstmt.setTimestamp(10, inquiry.getAdmin_regdate());
			pstmt.setString(11, inquiry.getMem_ip());
			pstmt.setString(12, inquiry.getAdmin_ip());
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
	
	// getInquiry(): return inquiry to member
	public ArrayList<InquiryBean> memGetInquiry(String memberId, String pageNumber) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ResultSet pageSet = null; // 페이지
		String sql = "";
		ArrayList<InquiryBean> inquiries = new ArrayList<InquiryBean>();

		int absolutPage=1; // 첫번째 페이지
		int dbcount=0;
		
		try {
			conn = getConnection();
			sql = "select count(*) from INQUIRY where MEMBER_MEMBER_ID = ?";
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pstmt.setString(1, memberId);
			pageSet = pstmt.executeQuery();
			
			if (pageSet.next()) {
				dbcount = pageSet.getInt(1);
				pageSet.close();
			}
			
			if (dbcount % InquiryBean.pageSize == 0) {
				InquiryBean.pageCount = dbcount / InquiryBean.pageSize;
			} else {
				InquiryBean.pageCount = dbcount / InquiryBean.pageSize+1;
			}
			
			if (pageNumber != null) {
				InquiryBean.pageNum = Integer.parseInt(pageNumber);
				absolutPage = (InquiryBean.pageNum-1) * InquiryBean.pageSize+1;
			}
			
			sql = "SELECT * FROM INQUIRY WHERE MEMBER_MEMBER_ID = ? ORDER BY MEM_REGDATE DESC";
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				rs.absolute(absolutPage);
				int count = 0;
				
				while (count < InquiryBean.pageSize) {
					InquiryBean inquiry = new InquiryBean();
					inquiry.setMember_id(rs.getString("member_member_id"));
					inquiry.setManager_id(rs.getString("manager_manager_id"));
					inquiry.setI_id(rs.getInt("i_id"));
					inquiry.setI_title(rs.getString("i_title"));
					inquiry.setI_type(rs.getString("i_type"));
					inquiry.setI_answer(rs.getString("i_answer"));
					inquiry.setI_quest(rs.getString("i_quest"));
					inquiry.setMem_ip(rs.getString("mem_ip"));
					inquiry.setAdmin_ip(rs.getString("admin_ip"));
					inquiry.setI_ref(rs.getInt("i_ref"));
					inquiry.setMem_regdate(rs.getTimestamp("mem_regdate"));
					inquiry.setAdmin_regdate(rs.getTimestamp("admin_regdate"));
					inquiries.add(inquiry);
					
					if (rs.isLast()) {
						break;
					} else {
						rs.next();
					}
					count++;
				}
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
	
	// adminGetInquiry(): return inquiry to admin
	public ArrayList<InquiryBean> adminGetInquiry(String pageNumber) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ResultSet pageSet = null; // 페이지
		String sql = "";
		ArrayList<InquiryBean> inquiries = new ArrayList<InquiryBean>();
		
		int absolutPage=1; // 첫번째 페이지
		int dbcount=0;
		
		try {
			conn = getConnection();
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pageSet = stmt.executeQuery("select count(*) from INQUIRY");
			
			if (pageSet.next()) {
				dbcount = pageSet.getInt(1);
				pageSet.close();
			}
			
			if (dbcount % InquiryBean.pageSize == 0) {
				InquiryBean.pageCount = dbcount / InquiryBean.pageSize;
			} else {
				InquiryBean.pageCount = dbcount / InquiryBean.pageSize+1;
			}
			
			if (pageNumber != null) {
				InquiryBean.pageNum = Integer.parseInt(pageNumber);
				absolutPage = (InquiryBean.pageNum-1) * InquiryBean.pageSize+1;
			}
			
			sql = "SELECT * FROM INQUIRY ORDER BY MEM_REGDATE";
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				rs.absolute(absolutPage);
				int count = 0;
				
				while (count < InquiryBean.pageSize) {
					InquiryBean inquiry = new InquiryBean();
					inquiry.setMember_id(rs.getString("member_member_id"));
					inquiry.setManager_id(rs.getString("manager_manager_id"));
					inquiry.setI_id(rs.getInt("i_id"));
					inquiry.setI_title(rs.getString("i_title"));
					inquiry.setI_type(rs.getString("i_type"));
					inquiry.setI_quest(rs.getString("i_quest"));
					inquiry.setI_answer(rs.getString("i_answer"));
					inquiry.setMem_ip(rs.getString("mem_ip"));
					inquiry.setAdmin_ip(rs.getString("admin_ip"));
					inquiry.setI_ref(rs.getInt("i_ref"));
					inquiry.setMem_regdate(rs.getTimestamp("mem_regdate"));
					inquiry.setAdmin_regdate(rs.getTimestamp("admin_regdate"));
					inquiries.add(inquiry);
					
					if (rs.isLast()) {
						break;
					}else {
						rs.next();
					}
					count++;
				}
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
			sql = "UPDATE INQUIRY SET MANAGER_MANAGER_ID = ?, I_ANSWER= ?, I_REF = 1, ADMIN_REGDATE = ?, ADMIN_IP = ? WHERE MEMBER_MEMBER_ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inquiry.getManager_id());
			pstmt.setString(2, HanConv.toKorean(inquiry.getI_answer()));
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
