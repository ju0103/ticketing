package ticketing.faq;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import myUtil.HanConv;

public class FaqDBBean {
private static FaqDBBean instance = new FaqDBBean();
	
	public static FaqDBBean getInstance() throws Exception {
		return instance;
	}
	
	// getConnection(): DBCP로부터 커넥션 객체를 얻어내는 메소드
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	// insertFaq(): faq 등록
	public int insertFaq(FaqBean faq) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int faq_code = 1;
		int re = -1;
		
		try {
			conn = getConnection();
			sql = "SELECT MAX(faq_code) FROM FAQ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				faq_code = rs.getInt("MAX(faq_code)") + 1;
			}
			System.out.println("faqCode >> " + faq_code);
			sql = "INSERT INTO FAQ(faq_code, faq_type, faq_quest, faq_answer) VALUES(?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, faq_code);
			pstmt.setString(2, HanConv.toKorean(faq.getFaq_type()));
			pstmt.setString(3, HanConv.toKorean(faq.getFaq_quest()));
			pstmt.setString(4, HanConv.toKorean(faq.getFaq_answer()));
			re = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return re;
	}
	
	// listFaq(): faq 리스트를 리턴하는 메소드
	public ArrayList<FaqBean> listFaq() throws Exception {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<FaqBean> faqList = new ArrayList<FaqBean>();
		
		try {
			conn = getConnection();
			sql = "select * from faq ORDER BY faq_code";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				FaqBean faq = new FaqBean();
				faq.setFaq_code(rs.getInt("faq_code"));
				faq.setFaq_type(rs.getString("faq_type"));
				faq.setFaq_quest(rs.getString("faq_quest"));
				faq.setFaq_answer(rs.getString("faq_answer"));
				faqList.add(faq);
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
		return faqList;
	}
	
	// getFaq(): faq 값 하나를 리턴하는 메소드
	public FaqBean getFaq(int faq_code) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		FaqBean faq = null;
		
		try {
			conn = getConnection();
			sql = "SELECT * FROM FAQ WHERE faq_code = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, faq_code);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				faq = new FaqBean();
				faq.setFaq_type(rs.getString("faq_type"));
				faq.setFaq_quest(rs.getString("faq_quest"));
				faq.setFaq_answer(rs.getString("faq_answer"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return faq;
	}
	
	// updateFaq(): faq 수정
	public int updateFaq(FaqBean faq) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		String faq_type = "";
		int re = -1;
		
		try {
			conn = getConnection();
			sql = "SELECT faq_type FROM FAQ WHERE faq_code = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, faq.getFaq_code());				
			rs = pstmt.executeQuery();
			if (rs.next()) {
				faq_type = rs.getString("faq_type");
			}
			sql = "UPDATE FAQ SET faq_type = ?, faq_quest = ?, faq_answer =? WHERE faq_code = ?";
			pstmt = conn.prepareStatement(sql);
			if (faq.getFaq_type() == null) {
				pstmt.setString(1, faq_type);				
			} else {
				pstmt.setString(1, HanConv.toKorean(faq.getFaq_type()));				
			}
			pstmt.setString(2, HanConv.toKorean(faq.getFaq_quest()));
			pstmt.setString(3, HanConv.toKorean(faq.getFaq_answer()));
			pstmt.setInt(4, faq.getFaq_code());
			re = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return re;
	}
	
	// deleteFaq(): faq 삭제
	public int deleteFaq(int faq_code) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re = -1;
		
		try {
			conn = getConnection();
			sql = "DELETE FAQ WHERE faq_code = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, faq_code);				
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				re = 1;
			} else {
				re = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return re;
	}
}
