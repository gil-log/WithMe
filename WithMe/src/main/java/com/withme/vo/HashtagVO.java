package com.withme.vo;

public class HashtagVO {
	
	private int travel;
	private int mukbang;
	private int ohrak;
	private int healing;
	private int photo;
	private int thunder;
	
	public int getTravel() {
		return travel;
	}
	public void setTravel(int travel) {
		this.travel = travel;
	}
	public int getMukbang() {
		return mukbang;
	}
	public void setMukbang(int mukbang) {
		this.mukbang = mukbang;
	}
	public int getOhrak() {
		return ohrak;
	}
	public void setOhrak(int ohrak) {
		this.ohrak = ohrak;
	}
	public int getHealing() {
		return healing;
	}
	public void setHealing(int healing) {
		this.healing = healing;
	}
	public int getPhoto() {
		return photo;
	}
	public void setPhoto(int photo) {
		this.photo = photo;
	}
	public int getThunder() {
		return thunder;
	}
	public void setThunder(int thunder) {
		this.thunder = thunder;
	}

	@Override
	public String toString() {
		return "HashtagVO [travel=" + travel + ", mukbang=" + mukbang + ","
				+ " ohrak=" + ohrak + ", "	+ "healing = " + healing + ", photo = " + photo + "thunder = " + thunder + "]";
	}
	
}
