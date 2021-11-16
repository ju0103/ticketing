package ticketing.notice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.jsp.tagext.TryCatchFinally;
import javax.sql.DataSource;

import ticketing.manager.ManagerDBBean;
import ticketing.review.ReviewBean;

public class noticeDBBean {	
	private static noticeDBBean instance = new noticeDBBean();
	
	public static noticeDBBean getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public String getDate() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "SELECT NOW()";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; //데이터베이스 오류
	}
	public int getNext() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "SELECT n_code FROM NOTICE ORDER BY n_code DESC";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1; //첫번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public int write(String n_title, String uid, String n_content, Timestamp regdate) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String SQL = "INSERT INTO NOTICE VALUES (?, ?, ?, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			System.out.println("@@@###getnext" + getNext()); 
			pstmt.setString(2, n_title);
			pstmt.setString(3, uid);
			pstmt.setTimestamp(4, regdate);
			pstmt.setString(5, n_content);
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
//	public ArrayList<noticeBean> getList(int pageNum){
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		String SQL = "SELECT * FROM NOTICE WHERE n_code < ? AND n_available = 1 ORDER BY n_code DESC LIMIT 10";
//		ArrayList<noticeBean> list = new ArrayList<noticeBean>();
//		try {
//			conn = getConnection();
//			pstmt = conn.prepareStatement(SQL);
//			pstmt.setInt(1, getNext() - (pageNum - 1) * 10);
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				noticeBean nBean = new noticeBean();
//				nBean.setN_code(rs.getInt(1));
//				nBean.setN_title(rs.getString(2));
//				nBean.setUserID(rs.getString(3));
//				nBean.setN_date(new Timestamp(System.currentTimeMillis()));
//				nBean.setN_content(rs.getString(5));
//				nBean.setN_available(rs.getInt(6));
//				list.add(nBean);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return list; 
//	}
	
	public boolean nextPage(int pageNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String SQL = "SELECT * FROM NOTICE WHERE n_code < ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNum - 1) * 10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	// notice_View.jsp 함수
	public noticeBean getNoticeBean(int n_code) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String SQL = "SELECT * FROM NOTICE WHERE n_code = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, n_code);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				noticeBean nBean = new noticeBean();
				nBean.setN_code(rs.getInt(1));
				nBean.setN_title(rs.getString(2));
				nBean.setN_userID(rs.getString(3));
				nBean.setN_date(rs.getTimestamp(4));
				nBean.setN_content(rs.getString(5));
				return nBean;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int delete(int n_code){
		Connection conn=null;
		ResultSet rs=null;
		String SQL = "delete NOTICE WHERE N_CODE = ?";
		try {
			conn = getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, n_code);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int update(int n_code, String n_title, String n_content) {
		Connection conn=null;
		ResultSet rs=null;
		
		String SQL = "UPDATE NOTICE SET n_title=?, n_content=? WHERE n_code=?";
		try {
			conn = getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, n_title);
			pstmt.setString(2, n_content);
			pstmt.setInt(3, n_code);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<noticeBean> listBoard(String pageNumber){
		Connection conn = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ResultSet pageSet = null;
		
		ArrayList<noticeBean> noticeList = new ArrayList<noticeBean>();
		
		int absolutePage = 1;
		int dbcount = 0;
		
		try {
			conn = getConnection();
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pageSet = stmt.executeQuery("select count(*) from notice");
			
			if (pageSet.next()) {
				dbcount = pageSet.getInt(1);
				pageSet.close();
			}
			
			if (dbcount % ReviewBean.pageSize == 0) {
				ReviewBean.pageCount = dbcount / ReviewBean.pageSize;
			} else {
				ReviewBean.pageCount = dbcount / ReviewBean.pageSize + 1;
			}
		
			if (pageNumber != null) {
				ReviewBean.pageNum = Integer.parseInt(pageNumber);
				absolutePage = (ReviewBean.pageNum-1) * ReviewBean.pageSize+1;
			}
			String sql="select * from notice order by n_code desc";
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				rs.absolute(absolutePage);
				int count = 0;
				
				while (count < ReviewBean.pageSize) {
					noticeBean nb = new noticeBean();
					nb.setN_code(rs.getInt(1));
					nb.setN_title(rs.getString(2));
					nb.setN_userID(rs.getString(3));
					nb.setN_date(rs.getTimestamp(4));
					nb.setN_content(rs.getString(5));
					
					noticeList.add(nb);

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
		}finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return noticeList;
	}
	
//	public ReviewBean getBoard(int p_code, int n_code) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		String sql = "";
//		ReviewBean review = null;
//		
//		try {
//			conn = getConnection();
//			
//			sql="select * from review where p_code=? and r_id=?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, p_code);
//			pstmt.setInt(2, r_id);
//			rs = pstmt.executeQuery();
//			
//			if (rs.next()) {
//				review = new ReviewBean();
//				review.setPerform_code(rs.getInt(1));
//				review.setReview_id(rs.getInt(2));
//				review.setReview_name(rs.getString(3));
//				review.setReview_title(rs.getString(4));
//				review.setReview_content(rs.getString(5));
//				review.setReview_date(rs.getTimestamp(6));
//				review.setReview_pwd(rs.getString(7));
//				review.setReview_ip(rs.getString(8));
//				review.setReview_fname(rs.getString(9));
//				review.setReview_fsize(rs.getInt(10));
//				review.setReview_rfname(rs.getString(11));
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}finally {
//			try {
//				if(rs != null) rs.close();
//				if(pstmt != null) pstmt.close();
//				if(conn != null) conn.close();
//			} catch (Exception e2) {
//				e2.printStackTrace();
//			}
//		}
//	}
}

