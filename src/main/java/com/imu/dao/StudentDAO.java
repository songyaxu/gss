package com.imu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.imu.entity.Page;
import com.imu.entity.Student;
import com.imu.entity.User;

public interface StudentDAO {
	
    User login(User user);
    
    Integer update(@Param("u") Student student);
    
    Student get(String id);
    
    Integer add(@Param("u") Student student);
    
    List<Student> getByKey(@Param("key") String key,@Param("page") Page page);
    
    Integer getByKeyCount(@Param("key") String key);
    
    Integer resetPwd(@Param("u") User user);
    
    Integer getStatusCount(@Param("status") int status);
    
    Integer delete(@Param("id") String id);
    
    List<Student> test();
    
    Integer updateStatus(@Param("u") Student student);
    
    Integer updateStatusAddOne(@Param("id") String id);
}
