package com.imu.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.imu.constant.Constant;
import com.imu.dto.Result;
import com.imu.entity.Message;
import com.imu.entity.Page;
import com.imu.entity.Teacher;
import com.imu.entity.Topic;
import com.imu.entity.User;
import com.imu.enums.StatusEnum;
import com.imu.enums.UserTypeEnum;
import com.imu.param.MessageParam;
import com.imu.service.FileService;
import com.imu.service.MessageService;
import com.imu.service.StudentService;
import com.imu.service.TeacherService;
import com.imu.service.TopicService;
import com.imu.util.PageUtil;
import com.imu.util.TimeUtil;

@Controller
@RequestMapping("topic")
public class TopicController {
	
	private static Logger logger = LoggerFactory.getLogger(TopicController.class);
	
	@Resource
	private FileService fileService;
	
	@Resource
	private TopicService topicService;
	
	@Resource
	private TeacherService teacherService;
	
	@Resource
	private StudentService studentService;
	
	@Resource
	private MessageService messageService;
	
	@ResponseBody
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
    public Result upload(@RequestParam("file") MultipartFile file,Topic topic,HttpSession session) {
		Result res = new Result();
		int fileId=0;
		if(file.getSize()!=0) {
			String time = TimeUtil.getTimeFilePath();
	        String path = Constant.FILE_LOCATION+time+"/";
	        String fileName = file.getOriginalFilename();
	        System.out.println(path);
	        File targetFile = new File(path, fileName);
	        if (!targetFile.exists()) {
	            targetFile.mkdirs();
	        }
	        try {
	            file.transferTo(targetFile);
	        } catch (Exception e) {
	        	res.setMessage("上传文件失败");
	        	res.setStatusCode("0");
	            return res;
	        }
	        com.imu.entity.File f1 = new  com.imu.entity.File();
	        f1.setLocation(path+fileName);
	        f1.setTime(TimeUtil.currentTime());
	        f1.setFileName(fileName);
	        f1.setTitle(topic.getTitle()+"-附件");
	        int re =fileService.add(f1);
	        fileId=f1.getId();
	        if(re==0)
	        {
	        	targetFile.delete();
	        	fileId=0;
	        	return res;
	        }
		}
        User user=(User) session.getAttribute("user");
        topic.setTeacherId(user.getId());
        topic.setValid(1);
        topic.setStatus(StatusEnum.UNCONFIRM.getCode());
        topic.setIsOpen(0);
        topic.setIsFinished(0);
        topic.setProposal(0);
        topic.setAttachment(fileId);
        topic.setMediumDefense(0);
        topic.setThesis(0);
        topic.setCode(0);
        topic.setTime(TimeUtil.currentTime());
        int flag=topicService.add(topic);
        if(flag==0)
        {
        	res.setMessage("发布失败");
            res.setStatusCode("0");
        }else {
        	res.setMessage("发布成功");
        	res.setStatusCode("1");
        }
        return res;
    }
	
	@RequestMapping("scan")
	public String scan(HttpSession session) {
		String key="";
		Integer total =0;
		total=topicService.getByKeyCount(key);
		Page page = new Page();
		page=PageUtil.createPage(Constant.PAGE_SIZE, total, 0);
		total=topicService.getByKeyCount(key);
		List<Topic> topList=topicService.getByKey(key,page);
		for (Topic topic : topList) {
			topic.setTeacherName(teacherService.getTeacherById(topic.getTeacherId()).getName());
		}
		session.setAttribute("topKey", "");
		session.setAttribute("topList", topList);
		session.setAttribute("topPage", page);
		return "public/topic/scan";
	}
	
	@RequestMapping("scan/page/{pageNo}")
	public String scan(HttpSession session,@PathVariable(value="pageNo") int pageNo,String key) {
		Integer total =0;
		if(key==null||"".equals(key))
			key = (String) session.getAttribute("topKey");
		total=topicService.getByKeyCount(key);
		Page page = new Page();
		page=PageUtil.createPage(Constant.PAGE_SIZE, total, pageNo);
		List<Topic> topList=topicService.getByKey(key,page);
		for (Topic topic : topList) {
			topic.setTeacherName(teacherService.getTeacherById(topic.getTeacherId()).getName());
		}
		session.setAttribute("topKey", "");
		session.setAttribute("topList", topList);
		session.setAttribute("topPage", page);
		return "public/topic/scan";
	}
	
	@RequestMapping("teaTop/page/{pageNo}")
	public String scan(HttpSession session,@PathVariable(value="pageNo") int pageNo) {
		Integer total =0;
		User user=(User)session.getAttribute("user");
		total=topicService.getMyTopicCount(user.getId());
		Page page = new Page();
		page=PageUtil.createPage(Constant.PAGE_SIZE, total, pageNo);
		List<Topic> topList=topicService.getMyTopic(user.getId(), page);
		for (Topic topic : topList) {
			topic.setTeacherName(teacherService.getTeacherById(topic.getTeacherId()).getName());
			if(topic.getStudentId()!=null&&topic.getStudentId()!="")
				topic.setStudentName(studentService.getStuInfoById(topic.getStudentId()).getName());
			if(topic.getSecretaryId()!=null&&topic.getSecretaryId()!="")
				topic.setSecretaryName(teacherService.getSecretaryById(topic.getSecretaryId()).getName());
		}
		session.setAttribute("teaTopList", topList);
		session.setAttribute("teaTopPage", page);
		return "teacher/mytopic";
	}
	
	@RequestMapping("detail/{id}")
	public String detail(HttpServletRequest request,@PathVariable(value="id") int id) {
		Topic topic = topicService.get(id);
		topic.setStudentName(studentService.getStuInfoById(topic.getStudentId()).getName());
		topic.setTeacherName(teacherService.getTeacherById(topic.getTeacherId()).getName());
		if(topic.getSecretaryId()!=null &&topic.getSecretaryId()!="")
			topic.setSecretaryName(teacherService.getTeacherById(topic.getSecretaryId()).getName());
		else
			topic.setSecretaryName("");
		request.setAttribute("topic", topic);
		MessageParam param = new MessageParam(0, 1, id);
		List<Message> msgList1 = messageService.getMessageList(param);
		param = new MessageParam(0, 2, id);
		List<Message> msgList2 = messageService.getMessageList(param);
		param = new MessageParam(0, 3, id);
		List<Message> msgList3 = messageService.getMessageList(param);
		param = new MessageParam(0, 4, id);
		List<Message> msgList4 = messageService.getMessageList(param);
		param = new MessageParam(0, 5, id);
		List<Message> msgList5 = messageService.getMessageList(param);
		param = new MessageParam(0, 6, id);
		List<Message> msgList6 = messageService.getMessageList(param);
		request.setAttribute("msgList1", msgList1);
		request.setAttribute("msgList2", msgList2);
		request.setAttribute("msgList3", msgList3);
		request.setAttribute("msgList4", msgList4);
		request.setAttribute("msgList5", msgList5);
		request.setAttribute("msgList6", msgList6);
		HttpSession session = request.getSession();
		User user= (User) session.getAttribute("user");
		if(user.getType()==UserTypeEnum.STUDENT.getCode())
			return "public/topic/studetail";
		if(user.getType()==UserTypeEnum.TEACHER.getCode())
			return "public/topic/teadetail";
		return "";
	}
	
	@RequestMapping("setsecretary/{id}")
	@ResponseBody
	public Result setSecretary(@PathVariable(value="id") int id,String tid) {
		Result res = new Result();
		res.setMessage("设置失败，未知错误");
		res.setStatusCode("0");
		Teacher secretary = teacherService.getSecretaryById(tid);
		if(secretary==null)
		{
			res.setMessage("答辩秘书不存在");
			return res;
		}
		else {
			Topic topic = topicService.get(id);
			if(topic!=null) {
				topic.setSecretaryId(secretary.getId());
				topicService.update(topic);
				res.setStatusCode("1");
				res.setMessage("设置成功");
				res.setData(secretary.getName());
			}
		}
		return res;
	}
	
	@RequestMapping("endstage/{id}")
	@ResponseBody
	public Result endSatge(@PathVariable(value="id") int id) {
		Result res = new  Result();
		res.setMessage("未知错误，操作失败");
		res.setStatusCode("0");
		Topic topic = topicService.get(id);
		if(topic.getStatus()==1) {
			topicService.endStage(id);
		}
		topic = topicService.get(id);
		if(topic.getStatus()==1||topic.getStatus()==2) {
			if(topic.getProposal()==0) {
				res.setMessage("请通知学生上传开题报告");
				return res;
			}
		}
		if(topic.getStatus()==6){
			if(topic.getRecord()==null || topic.getRecord()==""){
				res.setMessage("请通知答辩秘书填写答辩记录单");
				return res;
			}
		}
		if(topic.getStatus()==7) {
			if(topic.getCode()==0||topic.getThesis()==0||topic.getRecord()==null||topic.getRecord()==""||topic.getProposal()==0) {
				res.setMessage("请通知学生上传资料");
				return res;
			}
		}
		int a = topicService.endStage(id);
		int b = studentService.updateStatusAddOne(topic.getStudentId());
		if(a>=1&&b>=1) {
			Message msg = new Message();
			Message msg1= new Message();
			if(topic.getStatus()==7)
				msg.setContent("课题已结题");
			msg.setContent("流程结束");
			msg.setReceiveId(topic.getStudentId());
			msg.setSendId(topic.getTeacherId());
			msg.setTopicId(topic.getId());
			msg.setStage(topic.getStatus()-1);
			msg.setTitle("更新了状态");
			msg.setType(4);
			msg.setTime(TimeUtil.currentTime());
			messageService.add(msg);
			if(topic.getStatus()!=7)
			{
				msg1.setContent("此阶段已将开始");
				msg1.setReceiveId(topic.getStudentId());
				msg1.setSendId(topic.getTeacherId());
				msg1.setTopicId(topic.getId());
				msg1.setStage(topic.getStatus());
				msg1.setTitle("更新了状态");
				msg1.setType(1);
				msg1.setTime(TimeUtil.currentTime());
				messageService.add(msg1);
			}
			res.setMessage("操作成功");
			res.setStatusCode("1");
		}
		return res;
	}
	@ResponseBody
	@RequestMapping(value = "/upload/topic={id}/{type}", method = RequestMethod.POST)
    public Result upload(HttpServletRequest request, @RequestParam("file") MultipartFile file,@PathVariable(value="id") int id,@PathVariable(value="type") int type) {
		String label="";
		Result res = new Result();
		res.setMessage("文件上传失败");
    	res.setStatusCode("0");
    	String time = TimeUtil.getTimeFilePath();
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
        Topic topic = topicService.get(id);
        com.imu.entity.File f1 = new  com.imu.entity.File();
        f1.setLocation(path+fileName);
        f1.setTime(TimeUtil.currentTime());
        f1.setFileName(fileName);
        f1.setTitle(topic.getTitle()+"-附件");
        fileService.add(f1);
        Message msg =new Message();
		msg.setTitle("上传了");
        if(type==1) {
        	if(topic.getProposal()!=0)
        		msg.setTitle("更新了文件");
        	topic.setProposal(f1.getId());
        	label="开题报告";
        }
        if(type==2) {
        	if(topic.getMediumDefense()!=0)
        		msg.setTitle("更新了文件");
        	topic.setMediumDefense(f1.getId());
        	label="中期答辩资料";
        }
        if(type==3) {
        	if(topic.getThesis()!=0)
        		msg.setTitle("更新了文件");
        	topic.setThesis(f1.getId());
        	label="毕业论文";
        }
        if(type==4) {
        	if(topic.getCode()!=0)
        		msg.setTitle("更新了文件");
        	topic.setCode(f1.getId());
        	label="代码";
        }
        msg.setContent(label);
		msg.setReceiveId(topic.getTeacherId());
		msg.setSendId(((User)request.getSession().getAttribute("user")).getId());
		msg.setTopicId(topic.getId());
		msg.setStage(topic.getStatus()-1);
		msg.setType(3);
		msg.setTime(TimeUtil.currentTime());
        topicService.update(topic);
        messageService.add(msg);
        res.setMessage("上传文件成功");
        res.setStatusCode("1");
        return res;
    }
	
	@RequestMapping("record/{id}")
	@ResponseBody
	public Result record(@PathVariable(value="id") int id,String record,HttpSession session) {
		Result res = new Result();
		res.setMessage("未知错误，更新失败");
		res.setStatusCode("0");
		Topic topic = topicService.get(id);
		topic.setRecord(record);
		int a=topicService.update(topic);
		if(a>=1)
		{
			Message msg = new  Message();
			msg.setContent("答辩记录单");
			msg.setTitle("填写了");
			msg.setReceiveId(topic.getStudentId());
			msg.setSendId(((User)session.getAttribute("user")).getId());
			msg.setTopicId(topic.getId());
			msg.setStage(topic.getStatus()-1);
			msg.setType(2);
			msg.setTime(TimeUtil.currentTime());
			messageService.add(msg);
			res.setMessage("填写成功");
			res.setStatusCode("1");
		}
		return res;
	}
}
