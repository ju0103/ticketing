package ticketing.inquiry;

import java.sql.Timestamp;

public class InquiryBean {
	private String member_id;
	private String manager_id;
	private int i_id;
	private String i_title;
	private String i_type;
	private String i_quest;
	private String i_answer;
	private String mem_ip;
	private String admin_ip;
	private int i_ref;
	private Timestamp mem_regdate;
	private Timestamp admin_regdate;
	
	public static int pageSize=5;
	public static int pageCount=1;
	public static int pageNum=1;
	
	public static String memberPageNumber(int limit) {
		String str="";
		int temp = (pageNum - 1) % limit;
		int startPage = pageNum - temp;
		
		
		if ((startPage - limit) > 0) {
			str = "<a href='member_inquiry_List.jsp?pageNum="+(startPage-1)+"'>[이전]</a>&nbsp;&nbsp;";
		}
		
		for (int i = startPage; i < (startPage + limit); i++) {
			if (i == pageNum) {
				str += "["+i+"]&nbsp;&nbsp;";
			}else {
				str += "<a href='member_inquiry_List.jsp?pageNum="+i+"'>["+i+"]</a>&nbsp;&nbsp;";
			}
			if (i >= pageCount) {
				break;
			}
		}
		
		if ((startPage + limit) <= pageCount) {
			str += "<a href='member_inquiry_List.jsp?pageNum="+(startPage+limit)+"'>[다음]</a>&nbsp;&nbsp;";
		}
		
		return str;
	}
	
	public static String managerPageNumber(int limit) {
		String str="";
		int temp = (pageNum - 1) % limit;
		int startPage = pageNum - temp;
		
		
		if ((startPage - limit) > 0) {
			str = "<a href='manager_inquiry_List.jsp.jsp?pageNum="+(startPage-1)+"'>[이전]</a>&nbsp;&nbsp;";
		}
		
		for (int i = startPage; i < (startPage + limit); i++) {
			if (i == pageNum) {
				str += "["+i+"]&nbsp;&nbsp;";
			}else {
				str += "<a href='manager_inquiry_List.jsp.jsp?pageNum="+i+"'>["+i+"]</a>&nbsp;&nbsp;";
			}
			if (i >= pageCount) {
				break;
			}
		}
		
		if ((startPage + limit) <= pageCount) {
			str += "<a href='manager_inquiry_List.jsp.jsp?pageNum="+(startPage+limit)+"'>[다음]</a>&nbsp;&nbsp;";
		}
		
		return str;
	}
	
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
	public String getI_answer() {
		return i_answer;
	}
	public void setI_answer(String i_answer) {
		this.i_answer = i_answer;
	}
	public String getMem_ip() {
		return mem_ip;
	}
	public void setMem_ip(String mem_ip) {
		this.mem_ip = mem_ip;
	}
	public String getAdmin_ip() {
		return admin_ip;
	}
	public void setAdmin_ip(String admin_ip) {
		this.admin_ip = admin_ip;
	}
	public int getI_ref() {
		return i_ref;
	}
	public void setI_ref(int i_ref) {
		this.i_ref = i_ref;
	}
	public Timestamp getMem_regdate() {
		return mem_regdate;
	}
	public void setMem_regdate(Timestamp mem_regdate) {
		this.mem_regdate = mem_regdate;
	}
	public Timestamp getAdmin_regdate() {
		return admin_regdate;
	}
	public void setAdmin_regdate(Timestamp admin_regdate) {
		this.admin_regdate = admin_regdate;
	}
}
