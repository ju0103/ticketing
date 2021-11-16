package ticketing.notice;

import java.sql.Timestamp;

public class noticeBean {
	private int n_code;
	private String n_title;
	private String n_userID;
	private Timestamp n_date;
	private String n_content;
	
	public static int pageSize = 8;
	public static int pageCount = 1;
	public static int pageNum = 1;
	
	public static String pageNumer(int limit) {
		String str = "";
		int temp = (pageNum - 1) % limit;
		int startPage = pageNum - temp;
		
		if ((startPage - limit) > 0) {
			str = "<a href='notice_List.jsp?pageNum="+(startPage-1)+"'>[이전]</a>&nbsp;&nbsp;";
		}
		
		for (int i = startPage; i < (startPage+limit); i++) {
			if (i == pageNum) {
				str += "["+i+"]&nbsp;&nbsp;";
			}else {
				str += "<a href='notice_List.jsp?pageNum="+i+"'>["+i+"]</a>&nbsp;&nbsp;";
			}
			if (i >= pageCount) {
				break;
			}
		}
		
		if ((startPage + limit) <= pageCount) {
			str += "<a href='notice_List.jsp?pageNum="+(startPage+limit)+"'>[다음]</a>&nbsp;&nbsp;";
		}
		return str;
	}
	
	
	public int getN_code() {
		return n_code;
	}
	public void setN_code(int n_code) {
		this.n_code = n_code;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	
	public String getN_userID() {
		return n_userID;
	}

	public void setN_userID(String n_userID) {
		this.n_userID = n_userID;
	}

	public Timestamp getN_date() {
		return n_date;
	}
	public void setN_date(Timestamp n_date) {
		this.n_date = n_date;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

}
