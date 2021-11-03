package ticketing.inquiry;

import java.sql.Timestamp;

public class InquiryBean {
	private String member_id;
	private String manager_id;
	private int i_id;
	private String i_title;
	private String i_type;
	private String i_quest;
	private String i_ip;
	private int i_ref;
	private Timestamp i_regdate;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
	public int getI_id() {
		return i_id;
	}
	public void setI_id(int i_id) {
		this.i_id = i_id;
	}
	public String getI_title() {
		return i_title;
	}
	public void setI_title(String i_title) {
		this.i_title = i_title;
	}
	public String getI_type() {
		return i_type;
	}
	public void setI_type(String i_type) {
		this.i_type = i_type;
	}
	public String getI_quest() {
		return i_quest;
	}
	public void setI_quest(String i_quest) {
		this.i_quest = i_quest;
	}
	public String getI_ip() {
		return i_ip;
	}
	public void setI_ip(String i_ip) {
		this.i_ip = i_ip;
	}
	public int getI_ref() {
		return i_ref;
	}
	public void setI_ref(int i_ref) {
		this.i_ref = i_ref;
	}
	public Timestamp getI_regdate() {
		return i_regdate;
	}
	public void setI_regdate(Timestamp i_regdate) {
		this.i_regdate = i_regdate;
	}
}
