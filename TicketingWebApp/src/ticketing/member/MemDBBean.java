package ticketing.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import myUtil.HanConv;

public class MemDBBean {
	private static MemDBBean instance = new MemDBBean();
	
	public static MemDBBean getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception { // ȣ���ϴ� ������ ���ܸ� �ѱ�
		// DBCP ����
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public int insertMember(MemBean member) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO mem VALUES (?, ?, ?, ?, ?, ?, ?)";
		int re = -1;
		
		try {
			conn = getConnection(); // DBCP ����
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMem_id());
			pstmt.setString(2, member.getMem_pwd());
			pstmt.setString(3, HanConv.toKorean(member.getMem_name()));
			pstmt.setString(4, member.getMem_phone());
			pstmt.setString(5, member.getMem_email());
			pstmt.setString(6, HanConv.toKorean(member.getMem_address()));
			pstmt.setTimestamp(7, member.getMem_regdate());
			pstmt.executeUpdate();
			re = 1;
			
			pstmt.close();
			conn.close();
			System.out.println("�߰� ����");
		} catch (Exception e) {
			System.out.println("�߰� ����");
			e.printStackTrace();
		}
		return re;
	}
	
	public int confirmID(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "Select mem_id FROM mem WHERE mem_id = ?";
		int re = -1;
		
		try {
			conn = getConnection(); // DBCP ����
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				re = 1;		// id�� �ߺ� O
			} else {
				re = -1;	// id�� �ߺ� X
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}
}
