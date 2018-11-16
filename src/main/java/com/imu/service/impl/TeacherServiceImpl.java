package com.imu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.imu.dao.TeacherDAO;
import com.imu.entity.Page;
import com.imu.entity.Teacher;
import com.imu.entity.User;
import com.imu.service.TeacherService;

@Service
public class TeacherServiceImpl implements TeacherService{

	@Resource
	private TeacherDAO teacherDAO;
	@Override
	public User login(User user) {
		return this.teacherDAO.login(user);
	}
	@Override
	public Teacher isTeacher(String id) {
		return teacherDAO.isTeacher(id);
	}
	@Override
	public Teacher getTeacherById(String id) {
		return this.teacherDAO.getTeacherById(id);
	}
	@Override
	public Integer add(Teacher teacher) {
		return this.teacherDAO.add(teacher);
	}
	@Override
	public Integer getByKeyCount(String key) {
		return this.teacherDAO.getByKeyCount(key);
	}
	@Override
	public List<Teacher> getByKey(String key, Page page) {
		return this.teacherDAO.getByKey(key, page);
	}
	@Override
	public Integer resetPwd(User user) {
		return this.teacherDAO.resetPwd(user);
	}
	@Override
	public Integer update(Teacher teacher,int a) {
		return this.teacherDAO.update(teacher,a);
	}
	@Override
	public Teacher getSecretaryById(String id) {
		return this.teacherDAO.getSecretaryById(id);
	}
	
}
