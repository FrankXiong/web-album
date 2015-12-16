package com.wy.form;

public class UserInfo {
	private Integer id = -1;      
	private String username = "";
	private String password = ""; 
	private String realname = ""; 
	private String email = "";    
	private String question = "";
	private String result = "";   
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
}
