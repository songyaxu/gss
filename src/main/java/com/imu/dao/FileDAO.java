package com.imu.dao;

import org.apache.ibatis.annotations.Param;

import com.imu.entity.File;

public interface FileDAO {
	
	int add(@Param("file") File file);
	
	File getFileById(@Param("id") int id);
}
