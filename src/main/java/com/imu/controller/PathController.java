package com.imu.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.imu.entity.Student;
import com.imu.entity.Teacher;
import com.imu.entity.User;
import com.imu.enums.UserTypeEnum;
import com.imu.service.StudentService;
import com.imu.service.TeacherService;

@Controller
public class PathController {
	
	@Resource
	private TeacherService teacherService;
	
	@Resource
	private StudentService studentService;
	/**
	 * 管理员使用Path
	 */
	
	@RequestMapping("/manage/student/add")
	public String stuAdd(HttpSession session) {
		return "/management/student/add";
	}
	
	@RequestMapping("/manage/teacher/add")
	public String teaAdd(HttpSession session) {
		return "/management/teacher/add";
	}
	
	@RequestMapping("/manage/admin/add")
	public String adminAdd(HttpSession session) {
		return "/management/admin/add";
	}
	
	@RequestMapping("/admin/modPwd")
	public String modifyPwd(HttpSession session){
		return "/admin/modpwd";
	}
	
	@RequestMapping("/manage/student/{id}")
	public String editStu(HttpServletRequest request,@PathVariable(value="id") String id) {
		Student student=studentService.getStuInfoById(id);
		request.setAttribute("student", student);
		return "/management/student/edit";
	}
	
	@RequestMapping("/manage/teacher/{id}")
	public String editTea(HttpServletRequest request,@PathVariable(value="id") String id) {
		Teacher teacher=teacherService.getTeacherById(id);
		request.setAttribute("teacher", teacher);
		return "/management/teacher/edit";
	}
	/**
	 * 教师使用Path
	 */
	@RequestMapping("/teacher/publish")
	public String publish(HttpSession session) {
		return "/teacher/publish";
	}
	
	/**
	 * 通用path
	 * @param session
	 * @return
	 */
	@RequestMapping("/user/info")
	public String userInfo(HttpSession session,HttpServletRequest request) {
		User user=(User) session.getAttribute("user");
		if(user==null)
			return "405";
		if(user.getType()==UserTypeEnum.SECRETARY.getCode() || user.getType()==UserTypeEnum.TEACHER.getCode()) {
			Teacher teacher=teacherService.getTeacherById(user.getId());
			request.setAttribute("teacher", teacher);
			return "/teacher/info";
		}
		if(user.getType()==UserTypeEnum.STUDENT.getCode()) {
			Student student=studentService.getStuInfoById(user.getId());
			request.setAttribute("student", student);
			return "/student/info";
		}
		else
			return "404";
	}
	
	@RequestMapping("/user/modPwd")
	public String userModifyPwd(HttpSession session){
		User user=(User) session.getAttribute("user");
		if(user==null)
			return "405";
		if(user.getType()==UserTypeEnum.SECRETARY.getCode() || user.getType()==UserTypeEnum.TEACHER.getCode()) {
			return "/teacher/modpwd";
		}
		if(user.getType()==UserTypeEnum.STUDENT.getCode()) {
			return "/student/modpwd";
		}
		if(user.getType()==UserTypeEnum.ADMIN.getCode()) {
			return "/admin/modpwd";
		}
		else
			return "404";
	}
	
	@RequestMapping("teacher/topicList")
	public String teacherTopicList() {
		return "/teacher/topicList";
	}
	
}
