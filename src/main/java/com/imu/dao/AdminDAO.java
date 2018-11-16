package com.imu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.imu.entity.Admin;
import com.imu.entity.Page;
import com.imu.entity.User;

public interface AdminDAO {
	
	User login(@Param("u") User user);
	
	Admin getAdminById(String id);
	
	Integer add(@Param("u") Admin admin);
	
	Integer getByKeyCount(@Param("key") String key);
	
	List<Admin> getByKey(@Param("key") String key,@Param("page") Page page);
	
	Integer resetPwd(@Param("u") User user);
	
	Integer delete(@Param("id") String id);
}
