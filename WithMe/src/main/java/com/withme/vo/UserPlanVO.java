package com.withme.vo;
//DB에 있는 테이블 컬럼 값을 java에서 객체로 다루기 위해 사용 

public class UserPlanVO {

	private String u_id;
	private int plan_id;
	private int plan_host;
	
	
	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public int getPlan_id() {
		return plan_id;
	}

	public void setPlan_id(int plan_id) {
		this.plan_id = plan_id;
	}

	public int getPlan_host() {
		return plan_host;
	}

	public void setPlan_host(int plan_host) {
		this.plan_host = plan_host;
	}

	
	@Override
	public String toString() {
		return "UserPlanVO [u_id=" + u_id + ", plan_id=" + plan_id + ","
				+ " plan_host=" + plan_host + "]";
	}
}