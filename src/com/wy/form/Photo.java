package com.wy.form;

public class Photo {
	private Integer id = -1;       
	private String photoName = ""; 
	private String photoSize = ""; 
	private String photoTime = ""; 
	private String photoAddress = ""; 
	private String username = ""; 
	private String photoType = ""; 
	private String smallPhoto="";
	private Integer number=null;

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Photo() {
	}
	
	public String getPhotoType() {
		return photoType;
	}

	public void setPhotoType(String photoType) {
		this.photoType = photoType;
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getPhotoAddress() {
		return photoAddress;
	}
	
	public void setPhotoAddress(String photoAddress) {
		this.photoAddress = photoAddress;
	}

	public String getPhotoName() {
		return photoName;
	}

	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}

	public String getPhotoSize() {
		return photoSize;
	}

	public void setPhotoSize(String photoSize) {
		this.photoSize = photoSize;
	}
	public String getPhotoTime() {
		return photoTime;
	}

	public void setPhotoTime(String photoTime) {
		this.photoTime = photoTime;
	}
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getSmallPhoto() {
		return smallPhoto;
	}

	public void setSmallPhoto(String smallPhoto) {
		this.smallPhoto = smallPhoto;
	}
}
