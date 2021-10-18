package ticketing.manager;

import java.sql.Timestamp;

public class ManagerBean {
	private String manager_id;
	private String manager_pwd;
	private String manager_name;
	private Timestamp manager_regdate;
	
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
	public String getManager_pwd() {
		return manager_pwd;
	}
	public void setManager_pwd(String manager_pwd) {
		this.manager_pwd = manager_pwd;
	}
	public String getManager_name() {
		return manager_name;
	}
	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}
	public Timestamp getManager_regdate() {
		return manager_regdate;
	}
	public void setManager_regdate(Timestamp manager_regdate) {
		this.manager_regdate = manager_regdate;
	}
}
