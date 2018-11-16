package com.imu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.imu.dao.TopicDAO;
import com.imu.entity.Page;
import com.imu.entity.Topic;
import com.imu.service.TopicService;

@Service
public class TopicServiceImpl implements TopicService{

	@Resource
	private TopicDAO topicDAO;
	@Override
	public Integer getByKeyCount(String key) {
		return this.topicDAO.getByKeyCount(key);
	}

	@Override
	public List<Topic> getByKey(String key, Page page) {
		return this.topicDAO.getByKey(key, page);
	}

	@Override
	public Integer getSecretaryCount(String id) {
		return this.topicDAO.getSecretaryCount(id);
	}

	@Override
	public Integer getTeacherCount(String id) {
		return this.topicDAO.getTeacherCount(id);
	}

	@Override
	public Integer getStudentCount(String id) {
		return this.topicDAO.getStudentCount(id);
	}

	@Override
	public Integer add(Topic topic) {
		return this.topicDAO.add(topic);
	}

	@Override
	public List<Topic> getMyTopic(String id, Page page) {
		return this.topicDAO.getMyTopic(id, page);
	}

	@Override
	public Integer getMyTopicCount(String id) {
		return this.topicDAO.getMyTopicCount(id);
	}

	@Override
	public Topic get(int id) {
		return this.topicDAO.get(id);
	}

	@Override
	public Integer update(Topic topic) {
		return this.topicDAO.update(topic);
	}

	@Override
	public Integer endStage(int id) {
		return this.topicDAO.endStage(id);
	}

	@Override
	public List<Topic> getSecretaryTopic(String id, Page page) {
		return this.topicDAO.getSecretaryTopic(id, page);
	}
	
	
}
