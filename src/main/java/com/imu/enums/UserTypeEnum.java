package com.imu.enums;

/**
 * 
 * @author 
 *  0:学生
 *  1：教师
 *  2：答辩秘书
 *  3：管理员
 */
public enum UserTypeEnum {
	STUDENT(0,"student"),
	TEACHER(1, "teacher"), 
	SECRETARY(2, "secretary"),
	ADMIN(3,"admin");
	
	private Integer code;
	
	private String value;
	
	private UserTypeEnum(Integer code, String value) {
		this.code = code;
		this.value = value;
	}
	
	public static String getValue(Integer code) {
		if (code == null) {
			return "";
		}
		for (UserTypeEnum userTypeEnum : UserTypeEnum.values()) {
			if (userTypeEnum.code == code) {
				return userTypeEnum.value;
			}
		}
		return "";
	}
	
	public Integer getCode() {
		return code;
	}

	public String getValue() {
		return value;
	}
}
