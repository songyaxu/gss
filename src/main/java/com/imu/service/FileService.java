package com.imu.service;

import com.imu.entity.File;

public interface FileService {
	
	int add(File file);
	File getFileById(int id);
}
