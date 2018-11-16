package com.imu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.imu.dao.StudentDAO;
import com.imu.entity.Page;
import com.imu.entity.Student;
import com.imu.entity.User;
import com.imu.service.StudentService;

@Service
public class StudentServiceImpl implements StudentService{
	
	@Resource
	private StudentDAO studentDAO;
	
	
	@Override
	public User login(User user) {
		return this.studentDAO.login(user);
	}
	@Override
	public Integer add(Student student) {
		return this.studentDAO.add(student);
	}
	@Override
	public Student getStuInfoById(String id) {
		return this.studentDAO.get(id);
	}
	@Override
	public List<Student> getByKey(String key,Page page) {
		return this.studentDAO.getByKey(key,page);
	}
	@Override
	public Integer getByKeyCount(String key) {
		return this.studentDAO.getByKeyCount(key);
	}
	@Override
	public Integer resetPwd(User user) {
		return this.studentDAO.resetPwd(user);
	}
	@Override
	public Integer getStatusCount(int status) {
		return this.studentDAO.getStatusCount(status);
	}
	@Override
	public Integer update(Student student) {
		return this.studentDAO.update(student);
	}
	@Override
	public Integer updateStatus(Student student) {
		return this.studentDAO.updateStatus(student);
	}
	@Override
	public Integer updateStatusAddOne(String id) {
		return this.studentDAO.updateStatusAddOne(id);
	}
	
	
}
