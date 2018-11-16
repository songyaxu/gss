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
import com.imu.entity.Message;
import com.imu.entity.Page;
import com.imu.entity.Student;
import com.imu.entity.Topic;
import com.imu.entity.TopicMap;
import com.imu.entity.User;
import com.imu.enums.StatusEnum;
import com.imu.enums.UserTypeEnum;
import com.imu.service.MessageService;
import com.imu.service.StudentService;
import com.imu.service.TeacherService;
import com.imu.service.TopicMapService;
import com.imu.service.TopicService;
import com.imu.util.PageUtil;
import com.imu.util.TimeUtil;

@Controller
@RequestMapping("topic")
public class TopicMapController {
	
	@Resource
	private TopicMapService topicMapService;
	
	@Resource
	private TopicService topicService;
	
	@Resource
	private StudentService studentService;
	
	@Resource
	private TeacherService teacherService;
	
	@Resource
	private MessageService messageService;
	
	@ResponseBody
	@RequestMapping("choice/{id}")
	public Result choice(@PathVariable(value="id") int id, HttpSession session) {
		User user = (User) session.getAttribute("user");
		int status = (int) session.getAttribute("stuStatus");
		Result res = new Result();
		if(user == null || status!=0 || user.getType()!=UserTypeEnum.STUDENT.getCode())
		{
			res.setMessage("出现异常，无法选择！");
			res.setStatusCode("0");
			return res;
		}
		Topic topic = topicService.get(id);
		if(topic.getStatus()!=StatusEnum.UNCONFIRM.getCode())
		{
			res.setMessage("无法选择");
			res.setStatusCode("0");
		}else {
			TopicMap topicMap = new TopicMap();
			topicMap.setStudentId(user.getId());
			topicMap.setStudentName(user.getName());
			topicMap.setTeacherId(topic.getTeacherId());
			topicMap.setTeacherName(teacherService.getTeacherById(topic.getTeacherId()).getName());
			topicMap.setTime(TimeUtil.currentTime());
			topicMap.setTopicId(topic.getId());
			topicMap.setTopicTitle(topic.getTitle());
			topicMap.setStatus(0);
			topicMapService.add(topicMap);
			res.setMessage("选题成功！");
			res.setStatusCode("1");
		}
		return res;
	}
	
	@ResponseBody
	@RequestMapping("check/{id}")
	public Result checkEnable(@PathVariable(value="id") int id, HttpSession session) {
		Result res = new Result();
		int status = (int) session.getAttribute("stuStatus");
		if(status !=0) {
			res.setMessage("你已确定选题，无法选择。");
			res.setStatusCode("0");
			return res;
		}
		User user = (User)session.getAttribute("user");
		if(user == null)
		{
			res.setMessage("出现异常，无法选择！");
			res.setStatusCode("0");
			return res;
		}
		List<TopicMap> topicMapList = topicMapService.check(id, user.getId());
		int flag = 0;
		for (TopicMap topicMap2 : topicMapList) {
			if(topicMap2!=null && topicMap2.getStatus()!=3)
			{
				flag = 1;
			}
		}
		if(flag == 1)
		{
			res.setMessage("无法重复选择一个题目！");
			res.setStatusCode("0");				
			return res;
		}
		res.setMessage("可选");
		res.setStatusCode("1");
		return res;
	}
	
	@RequestMapping("mytopic/{pageNo}")
	public String myTopic(@PathVariable(value="pageNo") int pageNo,HttpSession session) {
		User user = (User)session.getAttribute("user");
		Integer total =0;
		if(user.getType()==UserTypeEnum.STUDENT.getCode()) {
			total = topicMapService.getStudentCount(user.getId());
			Page page = new Page();
			page=PageUtil.createPage(Constant.PAGE_SIZE, total, pageNo);
			List<TopicMap> topicMapList = topicMapService.getStudentList(user.getId(), page);
			for (TopicMap topicMap : topicMapList) {
				Topic topic =topicService.get(topicMap.getTopicId());
				if(topic.getSecretaryId()!=null&&topic.getSecretaryId()!="") {
					topicMap.setSecretaryId(topic.getSecretaryId());
					topicMap.setSecretaryName(teacherService.getTeacherById(topic.getSecretaryId()).getName());
				}
			}
			session.setAttribute("topMapList", topicMapList);
			session.setAttribute("topMapPage", page);
			return "student/mytopic";
		}
		if(user.getType()==UserTypeEnum.TEACHER.getCode()){
			total = topicMapService.getTeacherCount(user.getId());
			Page page = new Page();
			page=PageUtil.createPage(Constant.PAGE_SIZE, total, pageNo);
			List<TopicMap> topicMapList = topicMapService.getTeacherList(user.getId(), page);
			session.setAttribute("topMapList", topicMapList);
			session.setAttribute("topMapPage", page);
			return "teacher/topicList";
		}
		if(user.getType()==UserTypeEnum.SECRETARY.getCode()) {
			return "http://www.baidu.com";
		}
		return "/404";
	}
	
	@ResponseBody
	@RequestMapping("giveup/{id}")
	public Result giveUp(@PathVariable(value="id") int id,HttpSession session) {
		Result res= new Result();
		res.setMessage("出现异常");
		res.setStatusCode("0");
		User user = (User) session.getAttribute("user");
		if(user == null)
			return res;
		else {
			TopicMap topicMap = new TopicMap();
			topicMap.setId(id);
			topicMap.setStatus(3);
			topicMapService.update(topicMap);
			res.setMessage("已放弃此选题");
			res.setStatusCode("1");
		}
		return res;
	}
	
	@ResponseBody
	@RequestMapping("accept/{id}")
	public Result accept(@PathVariable(value="id") int id,HttpSession session) {
		Result res= new Result();
		res.setMessage("出现异常");
		res.setStatusCode("0");
		User user = (User) session.getAttribute("user");
		if(user == null)
			return res;
		else {
			TopicMap top = topicMapService.get(id);
			if(top.getStatus()!=0)
			{
				res.setMessage("无法选择此题目，可能是题目已经被选择");
				return res;
			}
			List<TopicMap> list = topicMapService.getTopicList(top.getTopicId());
			/**
			 * 拒绝所有选择这个题目的学生(include this student)
			 */
			for (TopicMap topicMap2 : list) {
				topicMap2.setStatus(2);
				topicMapService.update(topicMap2);
			}
			/**
			 * 拒绝所有这个学生的其他未确定题目(include this topic)
			 */
			List<TopicMap> list2 = topicMapService.getStudentAllList(top.getStudentId());
			for (TopicMap topicMap3 : list2) {
				topicMap3.setStatus(2);
				topicMapService.update(topicMap3);
			}
			/**
			 * 修改这个题目的状态 为已确定
			 */
			TopicMap topicMap = new TopicMap();
			topicMap.setId(id);
			topicMap.setStatus(1);
			topicMapService.update(topicMap);
			/**
			 * 设置题目相关属性
			 */
			Topic topic = topicService.get(top.getTopicId());
			topic.setStatus(1);
			topic.setStudentId(top.getStudentId());
			topicService.update(topic);
			/**
			 * 设置学生相关状态
			 */
			Student student = studentService.getStuInfoById(top.getStudentId());
			student.setStatus(1);
			studentService.updateStatus(student);
			res.setMessage("已接受该学生的申请");
			res.setStatusCode("1");
			/**
			 * 添加选题开始的Message的状态
			 */
			Message msg = new Message();
			msg.setContent("开题进行中");
			msg.setReceiveId(student.getId());
			msg.setSendId(user.getId());
			msg.setStage(1);
			msg.setTitle("更新了状态");
			msg.setType(1);
			msg.setTime(TimeUtil.currentTime());
			msg.setTopicId(top.getTopicId());
			messageService.add(msg);
		}
		return res;
	}
	
	@ResponseBody
	@RequestMapping("refuse/{id}")
	public Result refuse(@PathVariable(value="id") int id,HttpSession session) {
		Result res= new Result();
		res.setMessage("出现异常");
		res.setStatusCode("0");
		User user = (User) session.getAttribute("user");
		if(user == null)
			return res;
		else {
			TopicMap topicMap = new TopicMap();
			topicMap.setId(id);
			topicMap.setStatus(2);
			topicMapService.update(topicMap);
			res.setMessage("已拒绝该学生的申请");
			res.setStatusCode("1");
		}
		return res;
	}
}
