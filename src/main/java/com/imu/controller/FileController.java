package com.imu.controller;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.imu.dto.Result;
import com.imu.service.FileService;

@Controller
@RequestMapping("file")   
public class FileController {
	
	@Resource
	private FileService fileService;
	
    @RequestMapping("download/{id}")    
    public ResponseEntity<byte[]> download(@PathVariable(value="id") int id) throws IOException {  
    	com.imu.entity.File f1 = fileService.getFileById(id);
        File file=new File(f1.getLocation()); 
        if(file.exists()) {
	        HttpHeaders headers = new HttpHeaders();    
	        String fileName=new String(f1.getFileName().getBytes("UTF-8"),"iso-8859-1");//为了解决中文名称乱码问题  
	        headers.setContentDispositionFormData("attachment", fileName);   
	        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);   
	        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),    
	                                          headers, HttpStatus.CREATED);    
        }
        return null;
    }  
    
    @ResponseBody
    @RequestMapping("check/{id}")
    public Result checkFile(@PathVariable(value="id") int id) {
    	Result res= new  Result();
    	res.setMessage("找不到相应对象");
    	res.setStatusCode("0");
    	com.imu.entity.File f1 = fileService.getFileById(id);
    	if(f1==null) {
    		return res;
    	}
    	else {
    		File file=new File(f1.getLocation()); 
    		if(file.exists()) {
    			res.setStatusCode("1");
    			res.setMessage("文件存在");
    		}else {
    			res.setStatusCode("0");
    			res.setMessage("文件不存在");
    		}
    	}
    	return res;
    }
}
