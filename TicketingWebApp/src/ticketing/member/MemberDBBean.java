package ticketing.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import myUtil.HanConv;

public class MemberDBBean {
	private static MemberDBBean instance = new MemberDBBean();
	
	public static MemberDBBean getInstance() {
		return instance;
	}
	
	// getConnection(): DBCP로부터 커넥션 객체를 얻어내는 메소드
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	// insertMember(): 회원가입을 위한 메소드
	public int insertMember(MemberBean member) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO MEMBER VALUES(?, ?, ?, ?, ?)";
		int re = -1;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMember_id());
			pstmt.setString(2, member.getMember_pwd());
			pstmt.setString(3, HanConv.toKorean(member.getMember_name()));
			pstmt.setString(4, member.getMember_email());
			pstmt.setTimestamp(5, member.getMember_regdate());
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
		String sql = "SELECT member_id FROM MEMBER WHERE member_id = ?";
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
	
	// memberCheck(): 로그인 시 아이디와 비밀번호를 확인하는 메소드
	public int memberCheck(String id, String pwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT member_pwd FROM MEMBER WHERE member_id = ?";
		int re = -1;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) { // 아이디와 일치하는 데이터 존재
				if (rs.getString("member_pwd").equals(pwd)) {
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
	
	// getMember(): 아이디가 일치하는 회원의 정보를 얻어오는 메소드
	public MemberBean getMember(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MEMBER WHERE member_id = ?";
		MemberBean member = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				member = new MemberBean();
				member.setMember_id(rs.getString("member_id"));
				member.setMember_pwd(rs.getString("member_pwd"));
				member.setMember_name(rs.getString("member_name"));
				member.setMember_email(rs.getString("member_email"));
				member.setMember_regdate(rs.getTimestamp("member_regdate"));
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
		return member;
	}
	
	// updateMember(): 회원 정보 수정 시 사용하는 메소드
	public int updateMember(MemberBean member) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE MEMBER SET member_pwd = ?, member_name = ?, member_email = ? WHERE member_id = ?";
		int re = -1;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMember_pwd());
			pstmt.setString(2, member.getMember_name());
			pstmt.setString(3, member.getMember_email());
			pstmt.setString(4, member.getMember_id());
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
	
	// deleteMember(): 회원 탈퇴 시 사용하는 메소드
	public int deleteMember(String id, String pwd) throws Exception {
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
				String deletePwd = rs.getString("member_pwd");
				if (deletePwd.equals(pwd)) {
					sql = "DELETE FROM MEMBER WHERE member_id = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);
					re = pstmt.executeUpdate();
				} else { // 아이디나 비밀번호가 일치하지 않음.
					re = 0;
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
}