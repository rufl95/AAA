package com.pi.developi.user.domain;

import java.util.Date;

public class UserDTO {
	private int userNo;
	private String id;
	private String password;
	private String name;
	private Date birthday;
	private String phone;
	private String question;
	private String answer;
	private int admin;
	
	
	public UserDTO() {
	}

	public UserDTO(int userNo, String id, String password, String name, Date birthday, String phone, String question,
			String answer, int admin) {
		super();
		this.userNo = userNo;
		this.id = id;
		this.password = password;
		this.name = name;
		this.birthday = birthday;
		this.phone = phone;
		this.question = question;
		this.answer = answer;
		this.admin = admin;
	}
	
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	@Override
	public String toString() {
		return "UserDTO [userNo=" + userNo + ", id=" + id + ", password=" + password + ", name=" + name + ", birthday="
				+ birthday + ", phone=" + phone + ", question=" + question + ", answer=" + answer + ", admin=" + admin
				+ "]";
	}
	
	
	

}
