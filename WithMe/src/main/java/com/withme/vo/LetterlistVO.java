package com.withme.vo;

public class LetterlistVO {

	private int l_id;
	private String u_id;
	private String l_message;
	private int l_flag;
	private String l_title;
	private int send_flag;
	private String l_date;
	private String sender_id;

	
	public int getL_id() {
		return l_id;
	}

	public void setL_id(int l_id) {
		this.l_id = l_id;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getL_message() {
		return l_message;
	}

	public void setL_message(String l_message) {
		this.l_message = l_message;
	}

	public int getL_flag() {
		return l_flag;
	}

	public void setL_flag(int l_flag) {
		this.l_flag = l_flag;
	}

	public String getL_title() {
		return l_title;
	}

	public void setL_title(String l_title) {
		this.l_title = l_title;
	}

	public int getSend_flag() {
		return send_flag;
	}

	public void setSend_flag(int send_flag) {
		this.send_flag = send_flag;
	}
	
	public String getL_date() {
		return l_date;
	}

	public void setL_date(String l_date) {
		this.l_date = l_date;
	}
	
	public String getSender_id() {
		return sender_id;
	}

	public void setSender_id(String sender_id) {
		this.sender_id = sender_id;
	}
	@Override
	public String toString() {
		return "LetterlistVO [l_id=" + l_id + ", u_id=" + u_id + ", l_message=" + l_message + 
				", l_flag=" + l_flag + ", l_title=" + l_title + ", send_flag=" + send_flag 
				+ ", l_date" + l_date + ", sender_id" + sender_id + "]";
	}

}