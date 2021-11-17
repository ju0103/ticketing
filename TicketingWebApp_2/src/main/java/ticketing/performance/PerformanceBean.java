package ticketing.performance;

import java.sql.Date;
import java.sql.Timestamp;

public class PerformanceBean {
	private int p_code;
	private String  p_type;
	private String  p_title;
	private String  p_area;
	private String p_date; //타입 오류로 string 으로 대체 
	private String p_performer;
	private int p_time;
	private int p_price;
	private int p_seat;
	private String p_description;
	private int p_hit;
	private Timestamp p_regdate;
	private int p_rating;
	private String p_fname;
    private int p_fsize;
    private String p_rfname;
    private int p_ref=0;
	private int p_step=0;
	private int p_level=0;
	
	
    public static int pageSize=10;
	public static int pageCount=1;
	public static int pageNum=1;
	
	public static String pageNumer(int limit) {
		String str="";
		int temp=(pageNum - 1) % limit;
		int startPage = pageNum - temp;
		
		if ((startPage - limit) > 0) {
			str = "<a href='perfor_List.jsp?pageNum="+(startPage-1)+"'>[이전]</a>&nbsp;&nbsp;";
		}
		
		for (int i = startPage; i < (startPage+limit); i++) {
			if (i == pageNum) {
				str += "["+i+"]&nbsp;&nbsp;";
			}else {
				str += "<a href='perfor_List.jsp?pageNum="+i+"'>["+i+"]</a>&nbsp;&nbsp;";
			}
			if (i >= pageCount) {
				break;
			}
		}
		
		if ((startPage + limit) <= pageCount) {
			str += "<a href='perfor_List.jsp?pageNum="+(startPage+limit)+"'>[다음]</a>&nbsp;&nbsp;";
		}
		return str;
	}
    
	



	public int getP_ref() {
		return p_ref;
	}

	public void setP_ref(int p_ref) {
		this.p_ref = p_ref;
	}


	public int getP_step() {
		return p_step;
	}


	public void setP_step(int p_step) {
		this.p_step = p_step;
	}


	public int getP_level() {
		return p_level;
	}


	public void setP_level(int p_level) {
		this.p_level = p_level;
	}



	public String getP_date() {
		return p_date;
	}



	public void setP_date(String p_date) {
		this.p_date = p_date;
	}


	public int getP_time() {
		return p_time;
	}





	public void setP_time(int p_time) {
		this.p_time = p_time;
	}





	public String getP_fname() {
		return p_fname;
	}
	public void setP_fname(String p_fname) {
		this.p_fname = p_fname;
	}
	public int getP_fsize() {
		return p_fsize;
	}
	public void setP_fsize(int p_fsize) {
		this.p_fsize = p_fsize;
	}
	public String getP_rfname() {
		return p_rfname;
	}
	public void setP_rfname(String p_rfname) {
		this.p_rfname = p_rfname;
	}
	public int getP_rating() {
		return p_rating;
	}
	public void setP_rating(int p_rating) {
		this.p_rating = p_rating;
	}
	

	public int getP_code() {
		return p_code;
	}

	public void setP_code(int p_code) {
		this.p_code = p_code;
	}

	public String getP_type() {
		return p_type;
	}
	public void setP_type(String p_type) {
		this.p_type = p_type;
	}
	public String getP_title() {
		return p_title;
	}
	public void setP_title(String p_title) {
		this.p_title = p_title;
	}
	public String getP_area() {
		return p_area;
	}
	public void setP_area(String p_area) {
		this.p_area = p_area;
	}

	public String getP_performer() {
		return p_performer;
	}
	public void setP_performer(String p_performer) {
		this.p_performer = p_performer;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	

	public int getP_seat() {
		return p_seat;
	}
	public void setP_seat(int p_seat) {
		this.p_seat = p_seat;
	}
	
	public String getP_description() {
		return p_description;
	}
	public void setP_description(String p_description) {
		this.p_description = p_description;
	}
	public int getP_hit() {
		return p_hit;
	}
	public void setP_hit(int p_hit) {
		this.p_hit = p_hit;
	}
	public Timestamp getP_regdate() {
		return p_regdate;
	}
	public void setP_regdate(Timestamp p_regdate) {
		this.p_regdate = p_regdate;
	}
	
	  
	  
}
