package com.imu.service;

import java.util.List;

import com.imu.entity.Page;
import com.imu.entity.Student;
import com.imu.entity.User;

public interface StudentService {
	
	User login(User user);
	
	Integer add(Student student);
	
	Student getStuInfoById(String id);
	
	List<Student> getByKey(String key,Page page);
	
	Integer getByKeyCount(String key);
	
	Integer resetPwd(User user);
	
	Integer getStatusCount(int status);
	
	Integer update(Student student);
	
	Integer updateStatus(Student student);
	
	Integer updateStatusAddOne(String id);
}
