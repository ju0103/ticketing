package ticket;

import java.sql.Date;

public class ticketDTO {
	private String user_id;
	private String user_pw;
	
	private int c_id;
	private String c_title;
    private String c_desc;
    private String c_place;
    private int c_price;
	private Date c_date;
	private int c_time;
	private String c_kind;
	private String c_performer;

	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public String getC_title() {
		return c_title;
	}
	public void setC_title(String c_title) {
		this.c_title = c_title;
	}
	public String getC_desc() {
		return c_desc;
	}
	public void setC_desc(String c_desc) {
		this.c_desc = c_desc;
	}
	public String getC_place() {
		return c_place;
	}
	public void setC_place(String c_place) {
		this.c_place = c_place;
	}
	public int getC_price() {
		return c_price;
	}
	public void setC_price(int c_price) {
		this.c_price = c_price;
	}
	public Date getC_date() {
		return c_date;
	}
	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}
	public int getC_time() {
		return c_time;
	}
	public void setC_time(int c_time) {
		this.c_time = c_time;
	}
	public String getC_kind() {
		return c_kind;
	}
	public void setC_kind(String c_kind) {
		this.c_kind = c_kind;
	}
	public String getC_performer() {
		return c_performer;
	}
	public void setC_performer(String c_perfomer) {
		this.c_performer = c_perfomer;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
}
