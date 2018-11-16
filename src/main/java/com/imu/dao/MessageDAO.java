package com.imu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.imu.entity.Message;
import com.imu.param.MessageParam;

public interface MessageDAO {
	
	Integer add(@Param("msg") Message msg);
	
	List<Message> getMessageList(@Param("param") MessageParam param);
}
