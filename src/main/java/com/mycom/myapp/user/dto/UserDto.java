package com.mycom.myapp.user.dto;

import java.util.Date;

public class UserDto {
	
	private int userSeq;
	private String userName;
	private String userPassword;
	private String userEmail;
	private String profileImage;
	private Date registerDate;
	public UserDto() {
	}
	public UserDto(int userSeq, String userName, String userPassword, String userEmail, String profileImage,
			Date registerDate) {
		super();
		this.userSeq = userSeq;
		this.userName = userName;
		this.userPassword = userPassword;
		this.userEmail = userEmail;
		this.profileImage = profileImage;
		this.registerDate = registerDate;
	}
	@Override
	public String toString() {
		return "UserDto [userSeq=" + userSeq + ", userName=" + userName + ", userPassword=" + userPassword + ", userEmail="
				+ userEmail + ", profileImage=" + profileImage + ", registerDate=" + registerDate + "]";
	}
	public int getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getProfileImage() {
		return profileImage;
	}
	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}
	public Date getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}
	
	
	
	
}
