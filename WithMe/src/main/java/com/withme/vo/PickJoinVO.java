package com.withme.vo;

public class PickJoinVO {
	
	private String u_id;
	private int party_id;
	private int party_host;
	private int pick_flag;
	private int join_flag;
	
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public int getParty_id() {
		return party_id;
	}
	public void setParty_id(int party_id) {
		this.party_id = party_id;
	}
	public int getParty_host() {
		return party_host;
	}
	public void setParty_host(int party_host) {
		this.party_host = party_host;
	}
	public int getPick_flag() {
		return pick_flag;
	}
	public void setPick_flag(int pick_flag) {
		this.pick_flag = pick_flag;
	}
	public int getJoin_flag() {
		return join_flag;
	}
	public void setJoin_flag(int join_flag) {
		this.join_flag = join_flag;
	}

	@Override
	public String toString() {
		return "PickJoinVO [u_id=" + u_id + ", party_id=" + party_id + ","
				+ " party_host=" + party_host + ", pick_flag=" + pick_flag + ", join_flag=" + join_flag + "]";
	}
	
}
