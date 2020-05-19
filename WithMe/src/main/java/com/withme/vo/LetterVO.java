package com.withme.vo;

public class LetterVO {
	
	private int l_id;
	private String l_message;
	private int l_flag;
	
	
	public int getL_id() {
		return l_id;
	}

	public void setL_id(int l_id) {
		this.l_id = l_id;
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
	
	@Override
	public String toString() {
		return "LetterVO [l_id=" + l_id + ", l_message=" + l_message + ","
				+ " l_flag=" + l_flag + "]";
	}
}

