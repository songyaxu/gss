package com.imu.entity;

/**
 * //0:学生，1：教师，2：答辩秘书，3：管理员
 * 
 *
 */
public class User {
	
	private String id;
	private String name;
	private String password;
	private int type; //0:学生，1：教师，2：答辩秘书，3：管理员
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", password=" + password + "]";
	}
	
	
}
