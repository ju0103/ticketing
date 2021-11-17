package ticketing.performance;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import myUtil.HanConv;

public class PerformanceDBBean {
	
private static PerformanceDBBean instance=new PerformanceDBBean();
	
	public static PerformanceDBBean getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public int insertBoard(PerformanceBean board) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int number=10000;
		int re=-1;

		try {
			conn = getConnection();
			
			sql = "select max(p_code) from performance";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
					if (rs.getInt(1) != 0) {
						number = rs.getInt(1) +1 ;
				
					}
				}
			
		
		sql="insert into performance(p_code, p_type, p_title, p_area, p_date, p_performer, p_price, p_seat, P_DESCRIPTION, p_regdate, p_rating,"
				+ "p_fname, p_fsize, p_rfname, p_time) "
				+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"; 
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, number);
		pstmt.setString(2, board.getP_type());
		pstmt.setString(3, board.getP_title());
		pstmt.setString(4, board.getP_area());
		pstmt.setString(5, board.getP_date());
		pstmt.setString(6, board.getP_performer());
		pstmt.setInt(7, board.getP_price());
		pstmt.setInt(8, board.getP_seat());
		pstmt.setString(9, board.getP_description());
		pstmt.setTimestamp(10, board.getP_regdate());
		pstmt.setInt(11, board.getP_rating());
		pstmt.setString(12, board.getP_fname());
		pstmt.setInt(13, board.getP_fsize());
		pstmt.setString(14, board.getP_rfname());
		pstmt.setInt(15, board.getP_time());
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
	
	
	
	public ArrayList<PerformanceBean> listBoard(){
		Connection conn=null;
//		PreparedStatement pstmt=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		ArrayList<PerformanceBean> performanceList = new ArrayList<PerformanceBean>();
		
	
		try {
			conn = getConnection();
			
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			
			
			//stmt = conn.createStatement();
			String sql="select * from performance order by p_code";
			rs = stmt.executeQuery(sql);
		
				while (rs.next()) {
					PerformanceBean board=new PerformanceBean();
					board.setP_code(rs.getInt(1));
					board.setP_type(rs.getString(2));
					board.setP_title(rs.getString(3));
					board.setP_area(rs.getString(4));
					board.setP_date(rs.getString(5));
					board.setP_performer(rs.getString(6));
					board.setP_price(rs.getInt(7));
					board.setP_seat(rs.getInt(8));
					board.setP_description(rs.getString(9));
					board.setP_regdate(rs.getTimestamp(10));
					board.setP_rating(rs.getInt(11));
					board.setP_fname(rs.getString(12));
					board.setP_fsize(rs.getInt(13));
					board.setP_rfname(rs.getString(14));
					board.setP_ref(rs.getInt(15));
					board.setP_step(rs.getInt(16));
					board.setP_level(rs.getInt(17));
					board.setP_time(rs.getInt(18));
					
					performanceList.add(board);

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
		
		return performanceList;
	}
	
	// perforListByType
	public ArrayList<PerformanceBean> perforListByType(String pType){
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<PerformanceBean> performanceList = new ArrayList<PerformanceBean>();
		
		try {
			conn = getConnection();
			String sql="select * from performance where p_type = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pType);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				PerformanceBean board=new PerformanceBean();
				board.setP_code(rs.getInt(1));
				board.setP_type(rs.getString(2));
				board.setP_title(rs.getString(3));
				board.setP_area(rs.getString(4));
				board.setP_date(rs.getString(5));
				board.setP_performer(rs.getString(6));
				board.setP_price(rs.getInt(7));
				board.setP_seat(rs.getInt(8));
				board.setP_description(rs.getString(9));
				board.setP_regdate(rs.getTimestamp(10));
				board.setP_rating(rs.getInt(11));
				board.setP_fname(rs.getString(12));
				board.setP_fsize(rs.getInt(13));
				board.setP_rfname(rs.getString(14));
				board.setP_ref(rs.getInt(15));
				board.setP_step(rs.getInt(16));
				board.setP_level(rs.getInt(17));
				board.setP_time(rs.getInt(18));
				
				performanceList.add(board);
				
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
		
		return performanceList;
	}
	
	public PerformanceBean getPerformance(String p_code){
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		PerformanceBean performance = null;
		
		try {
			conn = getConnection();
			String sql="select * from performance where p_code = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p_code);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				performance = new PerformanceBean();
				performance.setP_code(rs.getInt(1));
				performance.setP_type(rs.getString(2));
				performance.setP_title(rs.getString(3));
				performance.setP_area(rs.getString(4));
				performance.setP_date(rs.getString(5));
				performance.setP_performer(rs.getString(6));
				performance.setP_price(rs.getInt(7));
				performance.setP_seat(rs.getInt(8));
				performance.setP_description(rs.getString(9));
				performance.setP_regdate(rs.getTimestamp(10));
				performance.setP_rating(rs.getInt(11));
				performance.setP_fname(rs.getString(12));
				performance.setP_fsize(rs.getInt(13));
				performance.setP_rfname(rs.getString(14));
				performance.setP_ref(rs.getInt(15));
				performance.setP_step(rs.getInt(16));
				performance.setP_level(rs.getInt(17));
				performance.setP_time(rs.getInt(18));
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
		return performance;
	}
	
	public PerformanceBean getBoard(int p_code) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		PerformanceBean board = null;
		
		try {
			conn = getConnection();
			
			
			sql="select * from performance where p_code=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_code);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				board = new PerformanceBean();
				board.setP_code(rs.getInt(1));
				board.setP_type(rs.getString(2));
				board.setP_title(rs.getString(3));
				board.setP_area(rs.getString(4));
				board.setP_date(rs.getString(5));
				board.setP_performer(rs.getString(6));
				board.setP_price(rs.getInt(7));
				board.setP_seat(rs.getInt(8));
				board.setP_description(rs.getString(9));
				board.setP_regdate(rs.getTimestamp(10));
				board.setP_rating(rs.getInt(11));
				board.setP_fname(rs.getString(12));
				board.setP_fsize(rs.getInt(13));
				board.setP_rfname(rs.getString(14));
				board.setP_ref(rs.getInt(15));
				board.setP_step(rs.getInt(16));
				board.setP_level(rs.getInt(17));
				board.setP_time(rs.getInt(18));
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
	
	// delete
	public int deleteBoard(String manager_id, String manager_pwd, int p_code){
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int re= -1; //아이디 없을 시
		String pwd="";
		try {
			conn = getConnection();
			sql="select manager_pwd from manager where manager_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, manager_id);
			rs = pstmt.executeQuery();
			
			//값이 있으면 아이디 존재
			if(rs.next()) {
				pwd = rs.getString(1);
				
				if (!manager_pwd.equals(pwd)) {
					re=0; // 비밀번호틀림
					
				}else { //비밀번호 맞음
					sql = "delete performance where p_code=?"; // MANAGER<->PERFORMANCE FK없음
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, p_code);
					pstmt.executeUpdate();
					re=1;
				}
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
		return re;
	}
	
	public int editBoard(PerformanceBean board ,String id, String pw, int pcode) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int re=-1;
		String check_pwd= "";
		
		try {
			conn = getConnection();
			sql="select manager_pwd from manager where manager_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next())  {
				check_pwd = rs.getString(1); 
				System.out.println("@@### check_pwd "+ check_pwd);
				System.out.println("@@### pwd "+ pw);
				if (!pw.equals(check_pwd)) {
					re=0;
				}else {
					sql="UPDATE PERFORMANCE SET p_type=?, p_title=?, p_performer=?, p_area=?, p_date=?, p_time=?, p_rating=?,"
							+ " p_seat=?, p_price=?, p_description=?, p_fname=? "
							+ "WHERE p_code=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, board.getP_type());
					pstmt.setString(2, board.getP_title());
					pstmt.setString(3, board.getP_performer());
					pstmt.setString(4, board.getP_area());
					pstmt.setString(5, board.getP_date());
					pstmt.setInt(6, board.getP_time());
					pstmt.setInt(7, board.getP_rating());
					pstmt.setInt(8,  board.getP_seat());
					pstmt.setInt(9, board.getP_price());
					pstmt.setString(10, board.getP_description());
					pstmt.setString(11, board.getP_fname());
					pstmt.setInt(12, pcode);
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
}
