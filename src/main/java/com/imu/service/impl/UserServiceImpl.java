package com.imu.service.impl;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.imu.dao.AdminDAO;
import com.imu.dao.StudentDAO;
import com.imu.dao.TeacherDAO;
import com.imu.dao.TopicDAO;
import com.imu.dto.Result;
import com.imu.entity.Admin;
import com.imu.entity.Student;
import com.imu.entity.Teacher;
import com.imu.entity.User;
import com.imu.enums.UserTypeEnum;
import com.imu.service.UserService;
import com.imu.util.MD5Util;
import com.imu.util.TimeUtil;

@Service
public class UserServiceImpl implements UserService{

	@Resource
	private StudentDAO studentDAO;
	@Resource
	private TeacherDAO teacherDAO;
	@Resource
	private AdminDAO adminDAO;
	@Resource
	private TopicDAO topicDAO;
	protected HttpServletRequest getServletRequest() {
        return ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
    }
	
	@Override
	public Result login(User user) {
		HttpServletRequest request = getServletRequest();
		HttpSession session = request.getSession();
		user.setPassword(MD5Util.md5(user.getPassword()));
		Result res= new Result();
		User loginSt = studentDAO.login(user);
		if (loginSt != null) {
			loginSt.setType(0);
			Student st =studentDAO.get(loginSt.getId());
			st.setLastLoginTime(TimeUtil.currentTime());
			studentDAO.update(st);
			session.setAttribute("stuStatus", st.getStatus());
			session.setAttribute("user", loginSt);
			res.setMessage("登录成功，马上转到系统...");
			res.setStatusCode("1");
			return res;
		} else {
			User loginTeacher = teacherDAO.login(user);
			if (loginTeacher != null) {
				loginTeacher.setType(1);
				Teacher tea=teacherDAO.getTeacherById(loginTeacher.getId());
				tea.setLastLoginTime(TimeUtil.currentTime());
				teacherDAO.update(tea,0);
				loginTeacher.setType(tea.getType()+1);
				session.setAttribute("user", loginTeacher);
				res.setMessage("登录成功，马上转到系统...");
				res.setStatusCode("1");
				return res;
			} else {
				User loginAdmin = adminDAO.login(user);
				if (loginAdmin != null) {
					loginAdmin.setType(3);
					session.setAttribute("user", loginAdmin);
					res.setMessage("登录成功，马上转到系统...");
					res.setStatusCode("1");
					return res;
				} else {
					res.setStatusCode("0");
					res.setMessage("登录失败，用户名或密码有误。");
					return res;
				}
			}
		}
	}

	@Override
	public Result resetPwd(User user) {
		int res=0;
		Result result = new Result();
		user.setPassword(MD5Util.md5(user.getId()));
		if(user.getType()==UserTypeEnum.ADMIN.getCode())
		{
			res=adminDAO.resetPwd(user);
		}
		if(user.getType()==UserTypeEnum.SECRETARY.getCode())
		{
			res=teacherDAO.resetPwd(user);
		}
		if(user.getType()==UserTypeEnum.STUDENT.getCode())
		{
			res=studentDAO.resetPwd(user);
		}
		if(user.getType()==UserTypeEnum.TEACHER.getCode())
		{
			res=teacherDAO.resetPwd(user);
		}
		if(res!=0) {
			result.setMessage("重置成功");
			result.setStatusCode("1");
		}
		else
		{
			result.setMessage("重置失败");
			result.setStatusCode("0");
		}
		return result;
	}

	@Override
	public Result modifyPwd(User user) {
		int res=0;
		Result result = new Result();
		if(user.getType()==UserTypeEnum.ADMIN.getCode())
		{
			res=adminDAO.resetPwd(user);
		}
		if(user.getType()==UserTypeEnum.SECRETARY.getCode())
		{
			res=teacherDAO.resetPwd(user);
		}
		if(user.getType()==UserTypeEnum.STUDENT.getCode())
		{
			res=studentDAO.resetPwd(user);
		}
		if(user.getType()==UserTypeEnum.TEACHER.getCode())
		{
			res=teacherDAO.resetPwd(user);
		}
		if(res!=0) {
			result.setMessage("修改成功");
			result.setStatusCode("1");
		}
		else
		{
			result.setMessage("修改失败");
			result.setStatusCode("0");
		}
		return result;
	}

	@Override
	public Integer getUserType(String id) {
		int res= 4;
		Student student=studentDAO.get(id);
		if(student!=null)
		{
			res=UserTypeEnum.STUDENT.getCode();
			return res;
		}
		Teacher teacher = teacherDAO.getTeacherById(id);
		if(teacher!=null)
		{
			if(teacher.getType()==0)
				res=UserTypeEnum.TEACHER.getCode();
			else
				res=UserTypeEnum.SECRETARY.getCode();
			return res;
		}
		Admin admin = adminDAO.getAdminById(id);
		if(admin!=null)
		{
			res=UserTypeEnum.ADMIN.getCode();
			return res;
		}
		return res;
	}

	@Override
	public Result deleteUser(User user) {
		int res=0;
		Result result = new Result();
		if(user.getType()==UserTypeEnum.ADMIN.getCode())
		{
			res=adminDAO.delete(user.getId());
		}
		if(user.getType()==UserTypeEnum.SECRETARY.getCode())
		{
			int total = topicDAO.getSecretaryCount(user.getId());
			if(total>0)
			{
				result.setMessage("删除失败");
				result.setStatusCode("0");
				return result;
			}
			res=teacherDAO.delete(user.getId());
		}
		if(user.getType()==UserTypeEnum.STUDENT.getCode())
		{
			int total = topicDAO.getStudentCount(user.getId());
			if(total>0)
			{
				result.setMessage("删除失败");
				result.setStatusCode("0");
				return result;
			}
			res=studentDAO.delete(user.getId());
		}
		if(user.getType()==UserTypeEnum.TEACHER.getCode())
		{
			int total = topicDAO.getTeacherCount(user.getId());
			if(total>0)
			{
				result.setMessage("删除失败");
				result.setStatusCode("0");
				return result;
			}
			res=teacherDAO.delete(user.getId());
		}
		if(res!=0) {
			result.setMessage("删除成功");
			result.setStatusCode("1");
		}
		else
		{
			result.setMessage("删除失败");
			result.setStatusCode("0");
		}
		return result;
	}
	
}
