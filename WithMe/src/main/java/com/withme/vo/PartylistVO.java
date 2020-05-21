package com.withme.vo;

import java.sql.Date;

import com.withme.vo.PartylistVO;
public class PartylistVO {
	
	private String party_title;
	private String u_id;
	private Date p_date;
	private int party_id;
   	
	public String getParty_title() {
		return party_title;
	}
	public void setParty_title(String party_title) {
		this.party_title = party_title;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public Date getP_date() {
		return p_date;
	}
	public void setP_date(Date p_date) {
		this.p_date = p_date;
	}

	public int getParty_id() {
		return party_id;
	}
	public void setParty_id(int party_id) {
		this.party_id = party_id;
	}

	
	@Override
	public String toString() {
		return "PartylistVO [party_title=" + party_title +
				", u_id=" + u_id +", p_date=" + p_date +", party_id=" + party_id +"]";
	}

}
