package com.imu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.imu.dao.MessageDAO;
import com.imu.entity.Message;
import com.imu.param.MessageParam;
import com.imu.service.MessageService;

@Service
public class MessageServiceImpl implements MessageService{

	@Resource
	private MessageDAO messageDAO;
	@Override
	public Integer add(Message msg) {
		return this.messageDAO.add(msg);
	}
	@Override
	public List<Message> getMessageList(MessageParam param) {
		return this.messageDAO.getMessageList(param);
	}
	
	
}
