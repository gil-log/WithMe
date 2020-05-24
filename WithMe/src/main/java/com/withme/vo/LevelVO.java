package com.withme.vo;

public class LevelVO {
	
	private String u_id;
	private int point;
	
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	@Override
	public String toString() {
		return "LevelVO [u_id=" + u_id + ", point=" + point + "]";
	}

	

}
