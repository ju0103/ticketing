package ticketing.reservation;

import java.sql.Timestamp;

public class ReservationBean {
	private String member_member_id;
	private String performance_p_code;
	private String reserve_id;
	private Timestamp reserve_date;
	private String reserve_seat;
	
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
