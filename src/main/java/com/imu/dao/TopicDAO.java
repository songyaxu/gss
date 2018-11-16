package com.imu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.imu.entity.Page;
import com.imu.entity.Topic;

public interface TopicDAO {
	
	Integer getByKeyCount(@Param("key") String key);
	
	List<Topic> getByKey(@Param("key") String key,@Param("page") Page page);
	
	Integer getSecretaryCount(@Param("id") String id);
	
	List<Topic> getSecretaryTopic(@Param("id") String id,@Param("page") Page page);
	
	Integer getTeacherCount(@Param("id") String id);
	
	Integer getStudentCount(@Param("id") String id);
	
	Integer add(@Param("t") Topic topic);
	
	Integer getMyTopicCount(@Param("id") String id);
	
	List<Topic> getMyTopic(@Param("id") String id,@Param("page") Page page);
	
	Topic get(@Param("id") int id);
	
	Integer update(@Param("t") Topic topic);
	
	Integer endStage(@Param("id") int id);
}
