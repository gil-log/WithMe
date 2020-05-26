package com.withme.vo;

//페이징 클래스
public class UserVO {

	private String u_id ;
	private String name;
	private String email_address;
	private String password;
	private int age;
	private String phone_number;
	private char gender;
	private int u_level;
	private int u_warning;
	private String nickname;
	private String intro;
	
	
	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail_address() {
		return email_address;
	}

	public void setEmail_address(String email_address) {
		this.email_address = email_address;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public int getU_level() {
		return u_level;
	}

	public void setU_level(int u_level) {
		this.u_level = u_level;
	}

	public int getU_warning() {
		return u_warning;
	}

	public void setU_warning(int u_warning) {
		this.u_warning = u_warning;
	}
	
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	@Override
	public String toString() {
		return "UserVO [u_id=" + u_id + ", name=" + name + ", email_address=" + email_address + ", password=" + password
				+ ", age=" + age + ", phone_number=" + phone_number + ", gender=" + gender + ", u_level=" + u_level
				+ ", u_warning=" + u_warning + ", nickname=" + nickname + ", intro=" + intro + "]";
	}
	
}