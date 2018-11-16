package com.imu.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.imu.dto.Result;
import com.imu.entity.Message;
import com.imu.entity.Topic;
import com.imu.entity.User;
import com.imu.service.MessageService;
import com.imu.service.TopicService;
import com.imu.util.TimeUtil;

@Controller
@RequestMapping("message")
public class MessageController {

	@Resource
	private MessageService messageService;
	
	@Resource
	private TopicService topicService;
	
	@RequestMapping("send")
	@ResponseBody
	public Result send(Message message,HttpSession session) {
		User user = (User) session.getAttribute("user");
		Result res = new  Result();
		Topic topic = topicService.get(message.getTopicId());
		if(topic.getStatus()==1)
			message.setStage(1);
		else
			message.setStage(topic.getStatus()-1);
		res.setStatusCode("0");
		res.setMessage("未知错误，发送失败");
		if(user == null)
			return res;
		message.setTime(TimeUtil.currentTime());
		message.setSendId(user.getId());
		int r=messageService.add(message);
		if(r>=1)
		{
			res.setMessage("发送成功");
			res.setStatusCode("1");
		}
		return res;
	}
	
}
