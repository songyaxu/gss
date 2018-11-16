package com.imu.entity;

import java.sql.Timestamp;

public class Teacher extends User{

	private int gender;  //0:- 1:男 2：女
	private String email;
	private String phone;
	private int type;   //0:教师1:答辩秘书
	private Timestamp lastLoginTime;

	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public Timestamp getLastLoginTime() {
		return lastLoginTime;
	}
	public void setLastLoginTime(Timestamp lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	@Override
	public String toString() {
		return "Teacher [gender=" + gender + ", email=" + email + ", phone=" + phone + ", type=" + type
				+ ", lastLoginTime=" + lastLoginTime + ", getId()=" + getId() + ", getName()=" + getName()
				+ ", getPassword()=" + getPassword() + "]";
	}
		
	
}
