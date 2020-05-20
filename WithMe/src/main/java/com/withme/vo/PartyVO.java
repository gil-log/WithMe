package com.withme.vo;

import java.sql.Date;

public class PartyVO {
	
	private int party_id;
	private String party_title;
	private Date p_date;
	private String p_location;
	private String p_long;
	private String p_lati;
	private int p_num;
	private char p_gender;
	private int p_cost;
	private String p_note;
	private String hashtag;
	private int party_hit;
	
	public int getParty_id() {
		return party_id;
	}
	public void setParty_id(int party_id) {
		this.party_id = party_id;
	}
	public String getParty_title() {
		return party_title;
	}
	public void setParty_title(String party_title) {
		this.party_title = party_title;
	}
	public Date getP_date() {
		return p_date;
	}
	public void setP_date(Date p_date) {
		this.p_date = p_date;
	}
	public String getP_location() {
		return p_location;
	}
	public void setP_location(String p_location) {
		this.p_location = p_location;
	}
	public String getP_long() {
		return p_long;
	}
	public void setP_long(String p_long) {
		this.p_long = p_long;
	}
	public String getP_lati() {
		return p_lati;
	}
	public void setP_lati(String p_lati) {
		this.p_lati = p_lati;
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public char getP_gender() {
		return p_gender;
	}
	public void setP_gender(char p_gender) {
		this.p_gender = p_gender;
	}
	public int getP_cost() {
		return p_cost;
	}
	public void setP_cost(int p_cost) {
		this.p_cost = p_cost;
	}
	public String getP_note() {
		return p_note;
	}
	public void setP_note(String p_note) {
		this.p_note = p_note;
	}
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
	public int getParty_hit() {
		return party_hit;
	}
	public void setParty_hit(int party_hit) {
		this.party_hit = party_hit;
	}

	@Override
	public String toString() {
		return "PartyVO [party_id=" + party_id + ", party_title=" + party_title + ", p_date=" + p_date + ", p_location="
				+ p_location  + ", p_long=" + p_long + ", p_lati=" + p_lati + ", p_num=" + p_num + ", p_gender=" + p_gender + ", p_cost=" + p_cost + ", p_note=" + p_note +
				", hashtag=" + hashtag +", party_hit=" + party_hit +"]";
	}

}
