package com.imu.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.imu.constant.Constant;
import com.imu.dto.Result;
import com.imu.util.TimeUtil;

@Controller	
public class UploadController {
	private static Logger logger = LoggerFactory.getLogger(UploadController.class);
	@ResponseBody
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
    public Result upload(HttpServletRequest request, @RequestParam("file") MultipartFile file) {
		Result res = new Result();
		res.setMessage("文件上传失败");
    	res.setStatusCode("0");
		String time = TimeUtil.getTimeWithoutMilliSecond(TimeUtil.currentTime());
        String path = Constant.FILE_LOCATION+"/"+time+"/";
        String fileName = file.getOriginalFilename();
        System.out.println(path);
        logger.info("文件保存路径为："+path);
        File targetFile = new File(path, fileName);
        if (!targetFile.exists()) {
            targetFile.mkdirs();
        }
        try {
            file.transferTo(targetFile);
        } catch (Exception e) {
            e.printStackTrace();
        }
        res.setMessage("上传文件成功");
        res.setStatusCode("1");
        return res;
    }
}
