package ticketing.review;

import java.sql.Timestamp;

public class ReviewBean {
	private int perform_code;
	private int review_id;
	private String review_name;
	private String review_title;
	private String review_content;
	private Timestamp review_date;
	private String review_pwd;
	private String review_ip;
	
	private String review_fname;
	private int review_fsize;
	private String review_rfname;
	
	public static int pageSize = 8;
	public static int pageCount = 1;
	public static int pageNum = 1;
	
	public static String pageNumer(int limit) {
		String str = "";
		int temp = (pageNum - 1) % limit;
		int startPage = pageNum - temp;
		
		if ((startPage - limit) > 0) {
			str = "<a href='review_list.jsp?pageNum="+(startPage-1)+"'>[이전]</a>&nbsp;&nbsp;";
		}
		
		for (int i = startPage; i < (startPage+limit); i++) {
			if (i == pageNum) {
				str += "["+i+"]&nbsp;&nbsp;";
			}else {
				str += "<a href='review_list.jsp?pageNum="+i+"'>["+i+"]</a>&nbsp;&nbsp;";
			}
			if (i >= pageCount) {
				break;
			}
		}
		
		if ((startPage + limit) <= pageCount) {
			str += "<a href='review_list.jsp?pageNum="+(startPage+limit)+"'>[다음]</a>&nbsp;&nbsp;";
		}
		return str;
	}

	public int getPerform_code() {
		return perform_code;
	}

	public void setPerform_code(int perform_code) {
		this.perform_code = perform_code;
	}

	public int getReview_id() {
		return review_id;
	}

	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}

	public String getReview_name() {
		return review_name;
	}

	public void setReview_name(String review_name) {
		this.review_name = review_name;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public Timestamp getReview_date() {
		return review_date;
	}

	public void setReview_date(Timestamp review_date) {
		this.review_date = review_date;
	}

	public String getReview_pwd() {
		return review_pwd;
	}

	public void setReview_pwd(String review_pwd) {
		this.review_pwd = review_pwd;
	}

	public String getReview_ip() {
		return review_ip;
	}

	public void setReview_ip(String review_ip) {
		this.review_ip = review_ip;
	}

	public String getReview_fname() {
		return review_fname;
	}

	public void setReview_fname(String review_fname) {
		this.review_fname = review_fname;
	}

	public int getReview_fsize() {
		return review_fsize;
	}

	public void setReview_fsize(int review_fsize) {
		this.review_fsize = review_fsize;
	}

	public String getReview_rfname() {
		return review_rfname;
	}

	public void setReview_rfname(String review_rfname) {
		this.review_rfname = review_rfname;
	}
}
