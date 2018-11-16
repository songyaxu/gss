package com.imu.param;

import com.imu.entity.Message;

public class MessageParam {
	
	private int type;
	private int stage;
	private int topicId;
	private String receiveId;
	private String sendId;
	
	public MessageParam(int type,int stage,int topicId) {
		this.type=type;
		this.stage=stage;
		this.topicId=topicId;
		this.receiveId="";
		this.sendId="";
	}
	public MessageParam(int type,int stage,int topicId,String receiveId,String sendId) {
		this.type=type;
		this.stage=stage;
		this.topicId=topicId;
		this.receiveId=receiveId;
		this.sendId=sendId;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getStage() {
		return stage;
	}
	public void setStage(int stage) {
		this.stage = stage;
	}
	public String getReceiveId() {
		return receiveId;
	}
	public void setReceiveId(String receiveId) {
		this.receiveId = receiveId;
	}
	public String getSendId() {
		return sendId;
	}
	public void setSendId(String sendId) {
		this.sendId = sendId;
	}
	public int getTopicId() {
		return topicId;
	}
	public void setTopicId(int topicId) {
		this.topicId = topicId;
	}
	
	
}
