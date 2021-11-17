package ticketing.reservation;

import java.sql.Timestamp;

public class ReservationBean {
	private String member_member_id;
	private String performance_p_code;
	private String reserve_id;
	private Timestamp reserve_date;
	private String reserve_seat;
	
	public static int pageSize = 8;
	public static int pageCount = 1;
	public static int pageNum = 1;
	
	public static String pageNumber(int limit) {
		String str = "";
		int temp = (pageNum - 1) % limit;
		int startPage = pageNum - temp;
		
		if ((startPage - limit) > 0) {
			str = "<a href='member_ReservationMGRForm.jsp?pageNum="+(startPage-1)+"'>[이전]</a>&nbsp;&nbsp;";
		}
		
		for (int i = startPage; i < (startPage+limit); i++) {
			if (i == pageNum) {
				str += "["+i+"]&nbsp;&nbsp;";
			}else {
				str += "<a href='member_ReservationMGRForm.jsp?pageNum="+i+"'>["+i+"]</a>&nbsp;&nbsp;";
			}
			if (i >= pageCount) {
				break;
			}
		}
		
		if ((startPage + limit) <= pageCount) {
			str += "<a href='member_ReservationMGRForm.jsp?pageNum="+(startPage+limit)+"'>[다음]</a>&nbsp;&nbsp;";
		}
		return str;
	}
	
	public String getMember_member_id() {
		return member_member_id;
	}
	public void setMember_member_id(String member_member_id) {
		this.member_member_id = member_member_id;
	}
	public String getPerformance_p_code() {
		return performance_p_code;
	}
	public void setPerformance_p_code(String performance_p_code) {
		this.performance_p_code = performance_p_code;
	}
	public String getReserve_id() {
		return reserve_id;
	}
	public void setReserve_id(String reserve_id) {
		this.reserve_id = reserve_id;
	}
	public Timestamp getReserve_date() {
		return reserve_date;
	}
	public void setReserve_date(Timestamp reserve_date) {
		this.reserve_date = reserve_date;
	}
	public String getReserve_seat() {
		return reserve_seat;
	}
	public void setReserve_seat(String reserve_seat) {
		this.reserve_seat = reserve_seat;
	}
}
