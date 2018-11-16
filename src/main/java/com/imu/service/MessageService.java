package com.imu.service;

import java.util.List;

import com.imu.entity.Message;
import com.imu.param.MessageParam;

public interface MessageService {
	Integer add(Message msg);
	
	List<Message> getMessageList(MessageParam param);
}
