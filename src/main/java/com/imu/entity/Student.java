package com.imu.entity;

import java.sql.Timestamp;

public class Student extends User{
	
	private int gender; //0:- 1:男 2：女
	private String email;
	private String phone;
	private String major;
	private String dept;
	private int status; //状态：0：可选、1：已确定、2：开题报告、3、论文或程序指导、4：中期答辩、5论文或程序指导、6：答辩、7：结题
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
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Timestamp getLastLoginTime() {
		return lastLoginTime;
	}
	public void setLastLoginTime(Timestamp lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	@Override
	public String toString() {
		return "Student [gender=" + gender + ", email=" + email + ", phone=" + phone + ", major=" + major + ", dept="
				+ dept + ", status=" + status + ", lastLoginTime=" + lastLoginTime + ", getId()=" + getId()
				+ ", getName()=" + getName() + ", getPassword()=" + getPassword() + "]";
	}
	
	
	
	
}
