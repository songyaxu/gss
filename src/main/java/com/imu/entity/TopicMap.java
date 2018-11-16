package com.imu.entity;

import java.sql.Timestamp;
/**
 * 
 * @author 
 *	//0：待审核 1：选题成功2：被拒绝3：已放弃
 */
public class TopicMap {
	
	private int id;
	private String studentId;
	private String studentName;
	private String teacherId;
	private String teacherName;
	private int topicId;
	private String topicTitle;
	private Timestamp time;
	private int status; //0：待审核 1：选题成功2：被拒绝3：已放弃
	
	private String secretaryId;
	private String secretaryName;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public int getTopicId() {
		return topicId;
	}
	public void setTopicId(int topicId) {
		this.topicId = topicId;
	}
	public String getTopicTitle() {
		return topicTitle;
	}
	public void setTopicTitle(String topicTitle) {
		this.topicTitle = topicTitle;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public String getSecretaryId() {
		return secretaryId;
	}
	public void setSecretaryId(String secretaryId) {
		this.secretaryId = secretaryId;
	}
	public String getSecretaryName() {
		return secretaryName;
	}
	public void setSecretaryName(String secretaryName) {
		this.secretaryName = secretaryName;
	}
	
	
}
