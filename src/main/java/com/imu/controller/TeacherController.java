package com.imu.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.imu.constant.Constant;
import com.imu.dto.Result;
import com.imu.entity.Page;
import com.imu.entity.Teacher;
import com.imu.service.TeacherService;
import com.imu.service.TopicService;
import com.imu.util.MD5Util;
import com.imu.util.PageUtil;

@Controller
@RequestMapping("teacher")
public class TeacherController {

	@Resource
	private TeacherService teacherService;
	
	@Resource
	private TopicService topicService;
	
	@ResponseBody
	@RequestMapping("add")
	public Result add(Teacher teacher) {
		if(teacher.getPassword()==null||"".equals(teacher.getPassword()))
			teacher.setPassword(MD5Util.md5(teacher.getId()));
		else
			teacher.setPassword(MD5Util.md5(teacher.getPassword()));
		int res=teacherService.add(teacher);
		Result result = new Result();
		result.setMessage("添加失败");
		result.setStatusCode("0");
		if(res==1){
			result.setMessage("添加成功");
			result.setStatusCode("1");
		}
		return 	result;
	}
	
	@RequestMapping("scan")
	public String scan(HttpSession session) {
		String key="";
		Integer total =0;
		total=teacherService.getByKeyCount(key);
		Page page = new Page();
		page=PageUtil.createPage(Constant.PAGE_SIZE, total, 0);
		total=teacherService.getByKeyCount(key);
		List<Teacher> teaList=teacherService.getByKey(key,page);
		session.setAttribute("teaKey", "");
		session.setAttribute("teaList", teaList);
		session.setAttribute("teaPage", page);
		return "management/teacher/scan";
	}
	
	@RequestMapping("scan/page/{pageNo}")
	public String scan(HttpSession session,@PathVariable(value="pageNo") int pageNo,String key) {
		Integer total =0;
		if(null==key||"".equals(key))
			key = (String) session.getAttribute("teaKey");
		total=teacherService.getByKeyCount(key);
		Page page = new Page();
		page=PageUtil.createPage(Constant.PAGE_SIZE, total, pageNo);
		total=teacherService.getByKeyCount(key);
		List<Teacher> teaList=teacherService.getByKey(key,page);
		session.setAttribute("teaKey", "");
		session.setAttribute("teaList", teaList);
		session.setAttribute("teaPage", page);
		return "management/teacher/scan";
	}
	
	@ResponseBody
	@RequestMapping("update")
	public Result update(Teacher teacher) {
		Result result = new Result();
		result.setMessage("更新失败");
		result.setStatusCode("0");
		int res=teacherService.update(teacher,1);
		if(res!=0)
		{
			result.setMessage("更新成功");
			result.setStatusCode("1");
		}
		return result;
	}
	
	
}