package com.imu.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.imu.constant.Constant;
import com.imu.entity.Page;
import com.imu.entity.Topic;
import com.imu.entity.User;
import com.imu.service.StudentService;
import com.imu.service.TeacherService;
import com.imu.service.TopicService;
import com.imu.util.PageUtil;

@RequestMapping("secretary")
@Controller
public class SecretaryController {
	
	@Resource
	private TeacherService teacherService;
	
	@Resource
	private StudentService studentService;
	
	@Resource
	private TopicService topicService;
	
	@RequestMapping("mytopic/page/{pageNo}")
	public String scan(HttpSession session,@PathVariable(value="pageNo") int pageNo) {
		Integer total =0;
		User user=(User)session.getAttribute("user");
		total=topicService.getSecretaryCount(user.getId());
		Page page = new Page();
		page=PageUtil.createPage(Constant.PAGE_SIZE, total, pageNo);
		List<Topic> topList=topicService.getSecretaryTopic(user.getId(), page);
		for (Topic topic : topList) {
			topic.setTeacherName(teacherService.getTeacherById(topic.getTeacherId()).getName());
			topic.setStudentName(studentService.getStuInfoById(topic.getStudentId()).getName());
		}
		session.setAttribute("secTopList", topList);
		session.setAttribute("secTopPage", page);
		return "secretary/mytopic";
	}
}
