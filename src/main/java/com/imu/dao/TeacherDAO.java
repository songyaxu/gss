package com.imu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.imu.entity.Page;
import com.imu.entity.Teacher;
import com.imu.entity.User;

public interface TeacherDAO {
	
	User login(@Param("u")User teacher);
	
	Teacher isTeacher(String id);
	
	Integer update(@Param("u") Teacher teacher,@Param("a") int a);
	
	Teacher getTeacherById(String id);
	
	Teacher getSecretaryById(@Param("id") String id);
	
	Integer add(@Param("u") Teacher teacher);
	
	Integer getByKeyCount(@Param("key") String key);
	
	List<Teacher> getByKey(@Param("key") String key,@Param("page") Page page);
	
	Integer resetPwd(@Param("u") User user);
	
	Integer delete(@Param("id") String id);
}
