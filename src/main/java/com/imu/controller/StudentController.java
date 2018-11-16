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
import com.imu.entity.Student;
import com.imu.service.StudentService;
import com.imu.util.MD5Util;
import com.imu.util.PageUtil;

@Controller
@RequestMapping("student")
public class StudentController {

	@Resource
	private StudentService studentService;
	
	
	@ResponseBody
	@RequestMapping("add")
	public Result add(Student student) {
		if(student.getPassword()==null||"".equals(student.getPassword()))
			student.setPassword(MD5Util.md5(student.getId()));
		else
			student.setPassword(MD5Util.md5(student.getPassword()));
		int res=studentService.add(student);
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
		total=studentService.getByKeyCount(key);
		Page page = new Page();
		page=PageUtil.createPage(Constant.PAGE_SIZE, total, 0);
		total=studentService.getByKeyCount(key);
		List<Student> stuList=studentService.getByKey(key,page);
		session.setAttribute("stuKey", "");
		session.setAttribute("stuList", stuList);
		session.setAttribute("stuPage", page);
		return "management/student/scan";
	}
	
	@RequestMapping("scan/page/{pageNo}")
	public String scan(HttpSession session,@PathVariable(value="pageNo") int pageNo,String key) {
		Integer total =0;
		if(key==null||"".equals(key))
			key = (String) session.getAttribute("stuKey");
		total=studentService.getByKeyCount(key);
		Page page = new Page();
		page=PageUtil.createPage(Constant.PAGE_SIZE, total, pageNo);
		total=studentService.getByKeyCount(key);
		List<Student> stuList=studentService.getByKey(key,page);
		session.setAttribute("stuKey", "");
		session.setAttribute("stuList", stuList);
		session.setAttribute("stuPage", page);
		return "management/student/scan";
	}
	
	@ResponseBody
	@RequestMapping("update")
	public Result update(Student student) {
		Result result = new Result();
		result.setMessage("更新失败");
		result.setStatusCode("0");
		int res=studentService.update(student);
		if(res!=0)
		{
			result.setMessage("更新成功");
			result.setStatusCode("1");
		}
		return result;
	}

	
}