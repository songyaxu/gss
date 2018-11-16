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
import com.imu.entity.Admin;
import com.imu.entity.Page;
import com.imu.entity.Student;
import com.imu.service.AdminService;
import com.imu.util.MD5Util;
import com.imu.util.PageUtil;

@Controller
@RequestMapping("admin")
public class AdminController {

	@Resource
	private AdminService adminService;
	
	@ResponseBody
	@RequestMapping("add")
	public Result add(Admin admin) {
		if(admin.getPassword()==null||"".equals(admin.getPassword()))
			admin.setPassword(MD5Util.md5(admin.getId()));
		else
			admin.setPassword(MD5Util.md5(admin.getPassword()));
		int res=adminService.add(admin);
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
		total=adminService.getByKeyCount(key);
		Page page = new Page();
		page=PageUtil.createPage(Constant.PAGE_SIZE, total, 0);
		total=adminService.getByKeyCount(key);
		List<Admin	> adminList=adminService.getByKey(key,page);
		session.setAttribute("adminKey", "");
		session.setAttribute("adminList", adminList);
		session.setAttribute("adminPage", page);
		return "management/admin/scan";
	}
	
	@RequestMapping("scan/page/{pageNo}")
	public String scan(HttpSession session,@PathVariable(value="pageNo") int pageNo,String key) {
		Integer total =0;
		if(null == key )
			key = (String) session.getAttribute("adminKey");
		total=adminService.getByKeyCount(key);
		Page page = new Page();
		page=PageUtil.createPage(Constant.PAGE_SIZE, total, pageNo);
		total=adminService.getByKeyCount(key);
		List<Admin> adminList=adminService.getByKey(key,page);
		session.setAttribute("adminKey", "");
		session.setAttribute("adminList", adminList);
		session.setAttribute("adminPage", page);
		return "management/admin/scan";
	}
}