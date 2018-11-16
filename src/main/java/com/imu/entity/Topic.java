package com.imu.entity;

import java.sql.Timestamp;

public class Topic {
	
	private int id;
	private String title;
	private String content;
	private String description;
	private String teacherId;
	private String teacherName;
	private String studentId;
	private String studentName;
	private String secretaryId;
	private String secretaryName;
	private int valid;// 0:无效 1：有效
	private int status;//状态：0：可选、1：已确定、2：开题报告、3、论文或程序指导、4：中期答辩、5论文或程序指导、6：答辩、7：结题
	private int isOpen;
	private int isFinished;
	private int attachment;
	private int proposal;
	private int mediumDefense;
	private int thesis;
	private int code;
	private String record;
	private Timestamp time;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getValid() {
		return valid;
	}
	public void setValid(int valid) {
		this.valid = valid;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getProposal() {
		return proposal;
	}
	public void setProposal(int proposal) {
		this.proposal = proposal;
	}
	public int getThesis() {
		return thesis;
	}
	public void setThesis(int thesis) {
		this.thesis = thesis;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public String getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getSecretaryId() {
		return secretaryId;
	}
	public void setSecretaryId(String secretaryId) {
		this.secretaryId = secretaryId;
	}
	public int getIsOpen() {
		return isOpen;
	}
	public void setIsOpen(int isOpen) {
		this.isOpen = isOpen;
	}
	public int getIsFinished() {
		return isFinished;
	}
	public void setIsFinished(int isFinished) {
		this.isFinished = isFinished;
	}
	public int getMediumDefense() {
		return mediumDefense;
	}
	public void setMediumDefense(int mediumDefense) {
		this.mediumDefense = mediumDefense;
	}
	public int getAttachment() {
		return attachment;
	}
	public void setAttachment(int attachment) {
		this.attachment = attachment;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getSecretaryName() {
		return secretaryName;
	}
	public void setSecretaryName(String secretaryName) {
		this.secretaryName = secretaryName;
	}
	public String getRecord() {
		return record;
	}
	public void setRecord(String record) {
		this.record = record;
	}	
	
	
}
