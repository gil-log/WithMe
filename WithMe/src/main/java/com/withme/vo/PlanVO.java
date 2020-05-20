package com.withme.vo;
//DB에 있는 테이블 컬럼 값을 java에서 객체로 다루기 위해 사용 

public class PlanVO {

	private int plan_id;
	private String city;
	private String plan_title;
	private int plan_hit;
	private int pick_flag;
	
	public int getPlan_id() {
		return plan_id;
	}

	public void setPlan_id(int plan_id) {
		this.plan_id = plan_id;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPlan_title() {
		return plan_title;
	}

	public void setPlan_title(String plan_title) {
		this.plan_title = plan_title;
	}
	
	public int getPlan_hit() {
		return plan_hit;
	}

	public void setPlan_hit(int plan_hit) {
		this.plan_hit = plan_hit;
	}

	public int getPick_flag() {
		return pick_flag;
	}

	public void setPick_flag(int pick_flag) {
		this.pick_flag = pick_flag;
	}
	
	@Override
	public String toString() {
		return "PlanVO [plan_id=" + plan_id + ", city=" + city + ","
				+ " plan_title=" + plan_title + " plan_hit=" + plan_hit + " plan_flag" + pick_flag + "]";
	}
}