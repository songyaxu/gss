package com.imu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.imu.entity.Page;
import com.imu.entity.TopicMap;

public interface TopicMapDAO {
	
	Integer getTeacherCount(@Param("id") String id);
	
	List<TopicMap> getTeacherList(@Param("id") String id,@Param("page") Page page);
	
	Integer getStudentCount(@Param("id") String id);
	
	List<TopicMap> getStudentList(@Param("id") String id,@Param("page") Page page);
	
	Integer add(@Param("m") TopicMap topicMap);
	
	TopicMap get(@Param("id") int id);
	
	List<TopicMap> check(@Param("id") int id,@Param("studentId") String studentId);
	
	Integer update(@Param("map") TopicMap topicMap);
	
	List<TopicMap> getTopicList(@Param("id") int id);
	
	List<TopicMap> getStudentAllList(@Param("id") String id);
}
