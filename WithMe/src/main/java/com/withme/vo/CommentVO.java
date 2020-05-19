package com.withme.vo;

public class CommentVO {
	
	private int c_id ;
	private String u_id;
	private int plan_id;
	private int r_id;
	private String c_message;
	private int c_warning;
	
	
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
	public int getPlan_id() {
		return plan_id;
	}
	public void setPlan_id(int plan_id) {
		this.plan_id = plan_id;
	}
	public int getR_id() {
		return r_id;
	}
	public void setR_id(int r_id) {
		this.r_id = r_id;
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
	
	@Override
	public String toString() {
		return "CommentVo [c_id=" + c_id + ", u_id=" + u_id + ","
				+ " plan_id=" + plan_id + ", "	+ "r_id = " + r_id 
				+ ", c_message=" + c_message + ","+ " c_warning=" + c_warning + "]";
	}
	
}

