package com.imu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.imu.dao.AdminDAO;
import com.imu.entity.Admin;
import com.imu.entity.Page;
import com.imu.entity.User;
import com.imu.service.AdminService;

@Service
public class AdminServiceImpl  implements AdminService{

	@Resource
	private AdminDAO adminDAO;
	@Override
	public User login(User user) {
		return this.adminDAO.login(user);
	}
	@Override
	public Admin getAdminById(String id) {
		return this.adminDAO.getAdminById(id);
	}
	@Override
	public Integer add(Admin admin) {
		return this.adminDAO.add(admin);
	}
	@Override
	public Integer getByKeyCount(String key) {
		return this.adminDAO.getByKeyCount(key);
	}
	@Override
	public List<Admin> getByKey(String key, Page page) {
		return this.adminDAO.getByKey(key, page);
	}
	@Override
	public Integer resetPwd(User user) {
		return this.adminDAO.resetPwd(user);
	}
	
	
}
