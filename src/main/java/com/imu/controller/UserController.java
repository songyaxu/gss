package com.imu.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.imu.dto.Result;
import com.imu.entity.Admin;
import com.imu.entity.Student;
import com.imu.entity.Teacher;
import com.imu.entity.User;
import com.imu.enums.UserTypeEnum;
import com.imu.service.AdminService;
import com.imu.service.StudentService;
import com.imu.service.TeacherService;
import com.imu.service.TopicService;
import com.imu.service.UserService;
import com.imu.util.MD5Util;


@Controller
@RequestMapping("user")
public class UserController {

	@Resource
	private UserService userService;
	
	@Resource
	private StudentService studentService;
	
	@Resource
	private AdminService adminService;
	
	@Resource
	private TeacherService teacherService;
	
	@Resource
	private TopicService topicService;
	
	@ResponseBody
	@RequestMapping("login/{id}/{pwd}")
	public Result loginAll(@PathVariable(value="id") String id,@PathVariable(value="pwd") String pwd,HttpSession session){
		int totalTea = teacherService.getByKeyCount("");
		int totalStu = studentService.getByKeyCount("");
		int totalTopic = topicService.getByKeyCount("");
		int totalCStu = studentService.getStatusCount(0);
		double percent = (totalStu-totalCStu)/(double)totalStu;
		session.setAttribute("totalTea", totalTea);
		session.setAttribute("totalStu", totalStu);
		session.setAttribute("totalTopic", totalTopic);
		session.setAttribute("percent", String.format("%.2f", percent));
		User user= new User();
		if(null!=id&&null!=pwd)
		{
			user.setId(id);
			user.setPassword(pwd);
			return userService.login(user);
		}
		else {
			Result res= new Result();
			res.setMessage("用户名或密码不能为空");
			res.setStatusCode("0");
			return res;
		}
	}
	
	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		session.removeAttribute("stuStatus");
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping("checkPwd")
	public Result checkPwd(User user)
	{
		Result res = new Result();
		if("".equals(user.getId())||null==user.getId()||user.getPassword()==null||"".equals(user.getPassword()))
		{
			res.setMessage("密码不正确");
			res.setStatusCode("0");
		}
		else
			res = userService.login(user);
		return res;
	}
	
	@ResponseBody
	@RequestMapping("resetPwd")
	public Result resetPwd(User user)
	{
		Result res = userService.resetPwd(user);
		return res;
	}
	
	@ResponseBody
	@RequestMapping("delete/{id}")
	public Result deleteUser(@PathVariable(value="id") String id)
	{
		Result res = new Result();
		res.setStatusCode("0");
		res.setMessage("删除失败");
		int type=userService.getUserType(id);
		User user= new User();
		user.setId(id);
		user.setType(type);
		if(type>=4)
			return res;
		res = userService.deleteUser(user);
		return res;
	}
	
	@ResponseBody
	@RequestMapping("modifyPwd")
	public Result modifyPwd(String newpwd,String newpwd1,HttpSession session) {
		Result res = new Result();
		if(newpwd.equals(newpwd1))
		{
			User user = (User) session.getAttribute("user");
			user.setPassword(MD5Util.md5(newpwd));
			res = userService.modifyPwd(user);
		}else
		{
			res.setMessage("修改失败");
			res.setStatusCode("0");
		}
		return res;
	}
	
	@ResponseBody
	@RequestMapping("checkExist")
	public Result checkExist(String id) {
		Result result = new Result();
		int res=0;
		Student stu=studentService.getStuInfoById(id);
		if(stu==null)
		{
			Teacher teahcer = teacherService.getTeacherById(id);
			if(teahcer==null)
			{
				Admin admin = adminService.getAdminById(id);
				if(admin!=null)
				{
					res=1;
				}
			}
			else
			{
				res=1;
			}
		}
		else
		{
			res=1;
		}
		if(res==1)
		{
			result.setMessage("账号已存在："+id);
			result.setStatusCode("1");
		}
		else
		{
			result.setStatusCode("0");
			result.setMessage("账号不存在");
		}
		return result;
	}
	@RequestMapping("/info/{type}/{id}")
	public String userInfo(HttpSession session,HttpServletRequest request,@PathVariable(value="id") String id,@PathVariable(value="type") int type) {
		User user=(User) session.getAttribute("user");
		if(user==null)
			return "405";
		if(type==UserTypeEnum.SECRETARY.getCode() || type==UserTypeEnum.TEACHER.getCode()) {
			Teacher teacher=teacherService.getTeacherById(id);
			request.setAttribute("teacher", teacher);
			return "/public/info/teainfo";
		}
		if(type==UserTypeEnum.STUDENT.getCode()) {
			Student student=studentService.getStuInfoById(id);
			request.setAttribute("student", student);
			return "/public/info/stuinfo";
		}
		else
			return "404";
	}
}
