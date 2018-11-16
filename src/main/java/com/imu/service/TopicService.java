package com.imu.service;

import java.util.List;

import com.imu.entity.Page;
import com.imu.entity.Topic;

public interface TopicService {
	
	Integer getByKeyCount(String key);
	
	List<Topic> getByKey(String key,Page page);
	
	Integer getSecretaryCount(String id);
	
	List<Topic> getSecretaryTopic(String id,Page page);
	
	Integer getTeacherCount(String id);
	
	Integer getStudentCount(String id);
	
	Integer add(Topic topic);
	
	List<Topic> getMyTopic(String id,Page page);
	
	Integer getMyTopicCount(String id);
	
	Topic get(int id);
	
	Integer update(Topic topic);
	
	Integer endStage(int id);
}
