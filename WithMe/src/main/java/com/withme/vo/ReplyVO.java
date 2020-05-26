package com.withme.vo;


import java.util.Date;

public class ReplyVO {

	private int c_id;
	private String u_id;
	private int party_id;
	private String c_message;
	private int c_warning;
	private Date regdate;
	
	
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
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
	public String getC_message() {
		return c_message;
	}
	public void setC_message(String c_message) {
		this.c_message = c_message;
	}
	public int getC_warning() {
		return c_warning;
	}
	public void setC_warning(int c_warning) {
		this.c_warning = c_warning;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "ReplyVO [c_id=" + c_id + ", u_id=" + u_id + ", party_id=" + party_id + ", c_message=" + c_message
				+ ", c_warning=" + c_warning + ", regdate=" + regdate + "]";
	}
	

}