package com.withme.vo;

public class PlanningVO {
	
	private int plan_id;
	private int party_id;
	
	public int getPlan_id() {
		return plan_id;
	}
	public void setPlan_id(int plan_id) {
		this.plan_id = plan_id;
	}
	public int getParty_id() {
		return party_id;
	}
	public void setParty_id(int party_id) {
		this.party_id = party_id;
	}
	
	@Override
	public String toString() {
		return "PlanningVO [plan_id=" + plan_id + ", party_id=" + party_id + "]";
	}

}
