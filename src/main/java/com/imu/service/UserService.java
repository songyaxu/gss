package com.imu.service;

import com.imu.dto.Result;
import com.imu.entity.User;

public interface UserService {
	
	Result login(User user);
	
	Result resetPwd(User user);
	
	Result modifyPwd(User user);
	
	Integer getUserType(String id);
	
	Result deleteUser(User user);
}
