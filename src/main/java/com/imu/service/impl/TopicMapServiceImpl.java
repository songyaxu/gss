package com.imu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.imu.dao.TopicMapDAO;
import com.imu.entity.Page;
import com.imu.entity.TopicMap;
import com.imu.service.TopicMapService;

@Service
public class TopicMapServiceImpl implements TopicMapService{
	
	@Resource 
	private TopicMapDAO topicMapDAO;

	@Override
	public Integer getTeacherCount(String id) {
		return this.topicMapDAO.getTeacherCount(id);
	}

	@Override
	public List<TopicMap> getTeacherList(String id, Page page) {
		return this.topicMapDAO.getTeacherList(id, page);
	}

	@Override
	public Integer getStudentCount(String id) {
		return this.topicMapDAO.getStudentCount(id);
	}

	@Override
	public List<TopicMap> getStudentList(String id, Page page) {
		return this.topicMapDAO.getStudentList(id, page);
	}

	@Override
	public Integer add(TopicMap topicMap) {
		return this.topicMapDAO.add(topicMap);
	}

	@Override
	public TopicMap get(int id) {
		return this.topicMapDAO.get(id);
	}

	@Override
	public List<TopicMap> check(int id, String studentId) {
		return this.topicMapDAO.check(id, studentId);
	}

	@Override
	public Integer update(TopicMap topicMap) {
		return this.topicMapDAO.update(topicMap);
	}

	@Override
	public List<TopicMap> getTopicList(int id) {
		return this.topicMapDAO.getTopicList(id);
	}

	@Override
	public List<TopicMap> getStudentAllList(String id) {
		return this.topicMapDAO.getStudentAllList(id);
	}
	
	
}
