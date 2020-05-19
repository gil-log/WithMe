package com.withme.vo;
//DB에 있는 테이블 컬럼 값을 java에서 객체로 다루기 위해 사용 

import java.util.Date;

public class PlanVO {

	private int plan_id;
	private String city;
	private String plan_title;
	
	
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
	
	@Override
	public String toString() {
		return "PlanVO [plan_id=" + plan_id + ", city=" + city + ","
				+ " plan_title=" + plan_title + "]";
	}
}