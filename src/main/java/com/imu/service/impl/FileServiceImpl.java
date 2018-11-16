package com.imu.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.imu.dao.FileDAO;
import com.imu.entity.File;
import com.imu.service.FileService;

@Service
public class FileServiceImpl implements FileService{

	@Resource
	private FileDAO fileDAO;
	@Override
	public int add(File file) {
		return this.fileDAO.add(file);
	}
	@Override
	public File getFileById(int id) {
		return this.fileDAO.getFileById(id);
	}

	
}
