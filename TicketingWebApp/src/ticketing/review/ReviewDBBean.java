package ticketing.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import myUtil.*;

public class ReviewDBBean {
	private static ReviewDBBean instance = new ReviewDBBean();
	
	public static ReviewDBBean getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public int insertBoard(ReviewBean review, int p_code) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int number = 1;
		int re = -1;

		try {
			conn = getConnection();
			//현재 레코드 중에서 가장 큰 글 번호를 얻어낸다.(번호+1)
			sql = "select max(r_id) from review";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				number = rs.getInt(1) + 1;
			}
			
			sql="insert into review(performance_p_code, r_id, r_name, r_title, r_content, r_date, r_pwd, r_ip, r_fname, r_fsize, r_rfname) "
					+ "values(?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_code);
			pstmt.setInt(2, number);
			pstmt.setString(3, review.getReview_name());
			pstmt.setString(4, review.getReview_title());
			pstmt.setString(5, review.getReview_content());
			pstmt.setTimestamp(6, review.getReview_date());
			pstmt.setString(7, review.getReview_pwd());
			pstmt.setString(8, review.getReview_ip());
			pstmt.setString(9, review.getReview_fname());
			pstmt.setInt(10, review.getReview_fsize());
			pstmt.setString(11, review.getReview_rfname());
			pstmt.executeUpdate();
			
			re=1;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}
	//
	public ArrayList<ReviewBean> listBoard(String pageNumber, int p_code){
		Connection conn = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ResultSet pageSet = null;
		
		ArrayList<ReviewBean> reviewList = new ArrayList<ReviewBean>();
		
		int absolutePage = 1;
		int dbcount = 0;
		
		try {
			conn = getConnection();
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pageSet = stmt.executeQuery("select count(*) from review");
			
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
			String sql="select * from review where performance_p_code=? order by r_id desc";
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pstmt.setInt(1, p_code);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				rs.absolute(absolutePage);
				int count = 0;
				
				while (count < ReviewBean.pageSize) {
					ReviewBean review = new ReviewBean();
					review.setPerform_code(rs.getInt(1));
					review.setReview_id(rs.getInt(2));
					review.setReview_name(rs.getString(3));
					review.setReview_title(rs.getString(4));
					review.setReview_content(rs.getString(5));
					review.setReview_date(rs.getTimestamp(6));
					review.setReview_pwd(rs.getString(7));
					review.setReview_ip(rs.getString(8));
					review.setReview_fname(rs.getString(9));
					review.setReview_fsize(rs.getInt(10));
					review.setReview_rfname(rs.getString(11));
					reviewList.add(review);

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
		return reviewList;
	}
	
	public ReviewBean getBoard(int p_code, int r_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ReviewBean review = null;
		
		try {
			conn = getConnection();
			
			sql="select * from review where performance_p_code=? and r_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_code);
			pstmt.setInt(2, r_id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				review = new ReviewBean();
				review.setPerform_code(rs.getInt(1));
				review.setReview_id(rs.getInt(2));
				review.setReview_name(rs.getString(3));
				review.setReview_title(rs.getString(4));
				review.setReview_content(rs.getString(5));
				review.setReview_date(rs.getTimestamp(6));
				review.setReview_pwd(rs.getString(7));
				review.setReview_ip(rs.getString(8));
				review.setReview_fname(rs.getString(9));
				review.setReview_fsize(rs.getInt(10));
				review.setReview_rfname(rs.getString(11));
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
		
		return review;
	}
	
	public int deleteBoard(int r_id, int p_code, String r_pwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re = -1;
		String pwd = "";
		
		try {
			conn = getConnection();
			sql="select r_pwd from review where r_id=? and performance_p_code=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r_id);
			pstmt.setInt(2, p_code);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				pwd = rs.getString(1);
				
				if (!pwd.equals(r_pwd)) {
					re = 0;
				}else {
					sql="delete review where r_id=? and performance_p_code=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, r_id);
					pstmt.setInt(2, p_code);
					pstmt.executeUpdate();
					re=1;
				}
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
		
		return re;
	}
	
	public int editBoard(ReviewBean review) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re = -1;
		String pwd = "";
		
		try {
			conn = getConnection();
			sql="select r_pwd from review where performance_p_code=? and r_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, review.getPerform_code());
			pstmt.setInt(2, review.getReview_id());
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				pwd = rs.getString(1);
				
				if (!pwd.equals(review.getReview_pwd())) {
					re = 0;
				} else {
					sql="update review set r_title=?, r_content=? where performance_p_code=? and r_id=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, HanConv.toKorean(review.getReview_title()));
					pstmt.setString(2, HanConv.toKorean(review.getReview_content()));
					pstmt.setInt(3, review.getPerform_code());
					pstmt.setInt(4, review.getReview_id());
					pstmt.executeUpdate();
					
					re = 1;
				}
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
		
		return re;
	}
	
	public ReviewBean getFileName(int p_code, int r_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ReviewBean review = null;
		
		try {
			conn = getConnection();
			sql = "select r_fname, r_rfname from review where performance_p_code=? and r_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_code);
			pstmt.setInt(2, r_id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				review = new ReviewBean();
				review.setReview_fname(rs.getString(1));
				review.setReview_rfname(rs.getString(2));;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return review;
	}
	
	public int countBoard(int p_code) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int count = 0;
		
		try {
			conn = getConnection();
			sql="select count(*) from review where performance_p_code=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_code);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				count = rs.getInt(1);
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
		return count;
	}
}
