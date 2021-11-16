package ticketing.faq;

public class FaqBean {
	private int faq_code;
	private String faq_type;
	private String faq_quest;
	private String faq_answer;
	
	public static int pageSize=5;
	public static int pageCount=1;
	public static int pageNum=1;
	
	public static String memberPageNumber(int limit) {
		String str="";
		int temp = (pageNum - 1) % limit;
		int startPage = pageNum - temp;
		
		
		if ((startPage - limit) > 0) {
			str = "<a href='member_faq_List.jsp?pageNum="+(startPage-1)+"'>[이전]</a>&nbsp;&nbsp;";
		}
		
		for (int i = startPage; i < (startPage + limit); i++) {
			if (i == pageNum) {
				str += "["+i+"]&nbsp;&nbsp;";
			}else {
				str += "<a href='member_faq_List.jsp?pageNum="+i+"'>["+i+"]</a>&nbsp;&nbsp;";
			}
			if (i >= pageCount) {
				break;
			}
		}
		
		if ((startPage + limit) <= pageCount) {
			str += "<a href='member_faq_List.jsp?pageNum="+(startPage+limit)+"'>[다음]</a>&nbsp;&nbsp;";
		}
		
		return str;
	}
	
	public static String managerPageNumber(int limit) {
		String str="";
		int temp = (pageNum - 1) % limit;
		int startPage = pageNum - temp;
		
		
		if ((startPage - limit) > 0) {
			str = "<a href='manager_faq_List.jsp?pageNum="+(startPage-1)+"'>[이전]</a>&nbsp;&nbsp;";
		}
		
		for (int i = startPage; i < (startPage + limit); i++) {
			if (i == pageNum) {
				str += "["+i+"]&nbsp;&nbsp;";
			}else {
				str += "<a href='manager_faq_List.jsp?pageNum="+i+"'>["+i+"]</a>&nbsp;&nbsp;";
			}
			if (i >= pageCount) {
				break;
			}
		}
		
		if ((startPage + limit) <= pageCount) {
			str += "<a href='manager_faq_List.jsp?pageNum="+(startPage+limit)+"'>[다음]</a>&nbsp;&nbsp;";
		}
		
		return str;
	}
	
	public int getFaq_code() {
		return faq_code;
	}
	public void setFaq_code(int faq_code) {
		this.faq_code = faq_code;
	}
	public String getFaq_type() {
		return faq_type;
	}
	public void setFaq_type(String faq_type) {
		this.faq_type = faq_type;
	}
	public String getFaq_quest() {
		return faq_quest;
	}
	public void setFaq_quest(String faq_quest) {
		this.faq_quest = faq_quest;
	}
	public String getFaq_answer() {
		return faq_answer;
	}
	public void setFaq_answer(String faq_answer) {
		this.faq_answer = faq_answer;
	}
}
