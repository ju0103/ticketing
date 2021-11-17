package ticketing.manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import myUtil.HanConv;

public class ManagerDBBean {
	private static ManagerDBBean instance = new ManagerDBBean();
	
	public static ManagerDBBean getInstance() {
		return instance;
	}
	
	// getConnection(): DBCP로부터 커넥션 객체를 얻어내는 메소드
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	// insertManager(): 회원가입을 위한 메소드
		public int insertManager(ManagerBean manager) throws Exception {
			Connection conn = null;
			PreparedStatement pstmt = null;
			String sql = "INSERT INTO MANAGER VALUES(?, ?, ?, ?)";
			int re = -1;
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, manager.getManager_id());
				pstmt.setString(2, manager.getManager_pwd());
				pstmt.setString(3, HanConv.toKorean(manager.getManager_name()));
				pstmt.setTimestamp(4, manager.getManager_regdate());
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
		
		// confirmID(): 회원가입 시 중복 아이디인지 확인하는 메소드
		public int confirmID(String id) throws Exception {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "SELECT manager_id FROM MANAGER WHERE manager_id = ?";
			int re = -1;
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					re = 1; // 중복 아이디 존재
				} else {
					re = -1; // 중복 아이디 없음
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
			return re;
		}
		
		// managerCheck(): 로그인 시 아이디와 비밀번호를 확인하는 메소드
		public int managerCheck(String id, String pwd) throws Exception {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "SELECT manager_pwd FROM MANAGER WHERE manager_id = ?";
			int re = -1;
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				if (rs.next()) { // 아이디와 일치하는 데이터 존재
					if (rs.getString("manager_pwd").equals(pwd)) {
						re = 1; // 로그인 성공
					} else {
						re = 0; // 비밀번호 오류
					}
				} else {
					re = -1; // 해당 아이디 없음
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
			return re;
		}
		
		// getManager(): 아이디가 일치하는 회원의 정보를 얻어오는 메소드
		public ManagerBean getManager(String id) throws Exception {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "SELECT * FROM MANAGER WHERE manager_id = ?";
			ManagerBean manager = null;
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					manager = new ManagerBean();
					manager.setManager_id(rs.getString("manager_id"));
					manager.setManager_pwd(rs.getString("manager_pwd"));
					manager.setManager_name(rs.getString("manager_name"));
					manager.setManager_regdate(rs.getTimestamp("manager_regdate"));
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
			return manager;
		}
		
			//2021-10-22  관리자페이지 회원삭제 메소드
				public int deleteMember(String id) throws Exception {
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = "";
					int re = -1;
					
					try {
						conn = getConnection();
						sql = "SELECT member_pwd FROM MEMBER WHERE member_id = ?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, id);
						rs = pstmt.executeQuery();
						
						if (rs.next()) { // 해당 아이디를 가진 회원 존재
								sql = "DELETE FROM MEMBER WHERE member_id = ?";
								pstmt = conn.prepareStatement(sql);
								pstmt.setString(1, id);
								re = pstmt.executeUpdate();
							} else {
								// 해당 아이디 없음
								re = 0;
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
		
}
