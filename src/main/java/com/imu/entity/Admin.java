package com.imu.entity;

public class Admin extends User{

	@Override
	public String toString() {
		return "Admin [getId()=" + getId() + ", getName()=" + getName() + ", getPassword()=" + getPassword() + "]";
	}

}
