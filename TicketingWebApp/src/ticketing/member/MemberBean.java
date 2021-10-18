package ticketing.member;

import java.sql.Timestamp;

public class MemberBean {
	private String member_id;
	private String member_pwd;
	private String member_name;
	private String member_email;
	private Timestamp member_regdate;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public Timestamp getMember_regdate() {
		return member_regdate;
	}
	public void setMember_regdate(Timestamp member_regdate) {
		this.member_regdate = member_regdate;
	}
}
