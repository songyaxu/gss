package com.imu.enums;

public enum StatusEnum {
	
	UNCONFIRM(0,"未确定"),
	CONFIRM(1, "已确定"), 
	OPEN(2, "开题"),
	DIRECT1(3,"前期指导"),
	MEDIUM(4,"中期答辩"),
	DIRECT2(5,"后期指导"),
	REPLY(6,"答辩"),
	FINISHED(7,"结题");
	
	
	private Integer code;
	
	private String value;
	
	private StatusEnum(Integer code, String value) {
		this.code = code;
		this.value = value;
	}
	
	public static String getValue(Integer code) {
		if (code == null) {
			return "";
		}
		for (StatusEnum statusEnum : StatusEnum.values()) {
			if (statusEnum.code == code) {
				return statusEnum.value;
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
