package com.imu.service;

import java.util.List;

import com.imu.entity.Page;
import com.imu.entity.Teacher;
import com.imu.entity.User;

public interface TeacherService {
	
	User login(User user);
	
	Teacher isTeacher(String id);
	
	Teacher getTeacherById(String id);
	
	Integer add(Teacher teacher);
	
	Integer getByKeyCount(String key);
	
	List<Teacher> getByKey(String key,Page page);
	
	Integer resetPwd(User user);
	
	Integer update(Teacher teacher,int a);
	
	Teacher getSecretaryById(String id);
}
