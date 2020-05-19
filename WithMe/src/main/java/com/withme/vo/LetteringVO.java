package com.withme.vo;

public class LetteringVO {
	
	private String u_id;
	private int l_id;
	private int send_flag;
	private int l_warning;
	
	
	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public int getL_id() {
		return l_id;
	}

	public void setL_id(int l_id) {
		this.l_id = l_id;
	}

	public int getSend_flag() {
		return send_flag;
	}

	public void setSend_flag(int send_flag) {
		this.send_flag = send_flag;
	}

	public int getL_warning() {
		return l_warning;
	}

	public void setL_warning(int l_warning) {
		this.l_warning = l_warning;
	}
	
	@Override
	public String toString() {
		return "LetteringVO [u_id=" + u_id + ", l_id=" + l_id + ","
				+ " send_flag=" + send_flag + ", "	+ "l_warning = " + l_warning + "]";
	}
	
}

