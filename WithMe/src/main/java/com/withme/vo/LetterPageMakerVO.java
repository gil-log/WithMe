package com.withme.vo;


import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class LetterPageMakerVO {

	private String u_id;
	private int displayPost;
	private int postNum;
	
	
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public int getDisplayPost() {
		return displayPost;
	}
	public void setDisplayPost(int displayPost) {
		this.displayPost = displayPost;
	}
	public int getPostNum() {
		return postNum;
	}
	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}
	
	@Override
	public String toString() {
		return "LetterPageMakerVO [u_id=" + u_id + ", displayPost=" + displayPost + ",postNum = " + postNum + "]";
	}
}