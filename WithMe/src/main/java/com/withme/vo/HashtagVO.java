package com.withme.vo;

public class HashtagVO {
	
	private String hashtag;
	private String location;
	
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	@Override
	public String toString() {
		return "HashtagVO [hashtag=" + hashtag + ", location=" + location + "]";
	}

}
