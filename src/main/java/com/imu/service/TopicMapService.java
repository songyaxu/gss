package com.imu.service;

import java.util.List;

import com.imu.entity.Page;
import com.imu.entity.TopicMap;

public interface TopicMapService {

	Integer getTeacherCount(String id);
	
	List<TopicMap> getTeacherList(String id, Page page);
	
	Integer getStudentCount(String id);
	
	List<TopicMap> getStudentList(String id, Page page);
	
	Integer add(TopicMap topicMap);
	
	TopicMap get(int id);
	
	List<TopicMap> check(int id,String studentId);
	
	Integer update(TopicMap topicMap);
	
	List<TopicMap> getTopicList(int id);
	
	List<TopicMap> getStudentAllList(String id);
}
