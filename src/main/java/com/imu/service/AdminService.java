package com.imu.service;

import java.util.List;

import com.imu.entity.Admin;
import com.imu.entity.Page;
import com.imu.entity.User;

public interface AdminService {
	
	User login(User user);
	
	Admin getAdminById(String id);
	
	Integer add(Admin admin);
	
	Integer getByKeyCount(String key);
	
	List<Admin> getByKey(String key,Page page);
	
	Integer resetPwd(User user);
}
