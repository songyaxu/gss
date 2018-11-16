<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
	<title>选题详情 | 毕业选题</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/linearicons/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/btu.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
	<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/demo.css">
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="${pageContext.request.contextPath}/assets/img/favicon.png">
	
	<script src="${pageContext.request.contextPath}/assets/scripts/jquery-3.2.1.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/layer/layer.js"></script>
</head>

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="brand">
				<a href="${pageContext.request.contextPath}/user/index"><img src="${pageContext.request.contextPath}/assets/img/logo-dark.png" alt="毕业选题" class="img-responsive logo"></a>
			</div>
			<div class="container-fluid">
				<div class="navbar-btn">
					<button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
				</div>
				<div id="navbar-menu">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span>${user.name}</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
							<ul class="dropdown-menu">
								<c:if test="${user.type!=3}">
								<li><a href='${pageContext.request.contextPath}/user/info'><i class='lnr lnr-user'></i> <span>个人信息</span></a></li>
								</c:if>
								<li><a href="${pageContext.request.contextPath}/user/modPwd"><i class="lnr lnr-envelope"></i> <span>修改密码</span></a></li>
								<li><a href="${pageContext.request.contextPath}/user/logout"><i class="lnr lnr-exit"></i> <span>注销</span></a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<nav>
					<ul class="nav">
						<li><a href="${pageContext.request.contextPath}/user/index" class=""><i class="lnr lnr-home"></i> <span>主页</span></a></li>
						<c:if test="${user.type==1}">
							<li><a href='${pageContext.request.contextPath}/teacher/publish' class=''><i class='lnr lnr-alarm'></i> <span>选题发布</span></a></li>
							<li><a href='${pageContext.request.contextPath}/topic/teaTop/page/0' class=''><i class='lnr lnr-chart-bars'></i> <span>我的选题</span></a></li>
							<li><a href='${pageContext.request.contextPath}/topic/mytopic/0' class=''><i class='lnr lnr-list'></i> <span>选题记录</span></a></li>
						</c:if>
						<li><a href='${pageContext.request.contextPath}/topic/scan' class=""><i class='lnr lnr-chart-bars'></i> <span>选题查看</span></a></li>
						<c:if test="${user.type==0}">
							<li><a href='${pageContext.request.contextPath}/topic/mytopic/0' class=''><i class='lnr lnr-chart-bars'></i> <span>我的选题</span></a></li>
						</c:if>
					</ul>
				</nav>
			</div>
		</div>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<div class="panel panel-profile">
						<div class="clearfix">
							<!-- LEFT COLUMN -->
							<div class="profile-left">
								<!-- PROFILE HEADER -->
								<div class="profile-header">
									<div class="overlay"></div>
									<div class="profile-main">
										<h3 class="name">${topic.title }</h3>
									</div>
									<div class="profile-stat">
										<div class="row">
											<div class="col-md-4 stat-item">
												指导教师 <span>${topic.teacherName }</span>
											</div>
											<div class="col-md-4 stat-item">
												答辩秘书 <span id="secretary">
												<c:if test="${topic.secretaryName!=''}">
												${topic.secretaryName }
												</c:if>
												</span>
											</div>
											<div class="col-md-4 stat-item">
												选题学生 <span>${topic.studentName }</span>
											</div>
										</div>
									</div>
								</div>
								<!-- END PROFILE HEADER -->
								<!-- PROFILE DETAIL -->
								<div class="profile-detail">
									<div class="profile-info">
										<h4 class="heading">选题内容</h4>
										<hr>
										<p>${topic.content }</p>
									</div>
									<div class="profile-info">
										<h4 class="heading">描述</h4>
										<hr>
										<p>${topic.description }</p>
									</div>
									<c:if test="${topic.attachment!=0 }">
										<div class="profile-info">
											<h4 class="heading">附件</h4>
											<hr>
										</div>
										<div class="text-center"><a href="javascript:check(${topic.attachment})" class="btn btn-success"><i class="fa fa-cloud-download"></i>下载附件</a></div>
									</c:if>
								</div>
								<!-- END PROFILE DETAIL -->
							</div>
							<!-- END LEFT COLUMN -->
							<!-- RIGHT COLUMN -->
							<div class="profile-right">
								<h4 class="heading">相关材料</h4>
								<!-- AWARDS -->
								<div class="awards">
									<div class="row">
										<div class="col-md-3 col-sm-6">
											<div class="award-item">
												<div class="hexagon">
													<c:if test="${topic.proposal!=0}">
														<a href="javascript:check(${topic.proposal})"><span class="lnr lnr-pencil award-icon"></span></a>
													</c:if>
													<c:if test="${topic.proposal==0}">
														<span class="lnr lnr-pencil award-icon"></span>
													</c:if>
												</div>
												<span>开题报告</span>
											</div>
											<button type="button" class="btn btn-primary" onclick="upload(1);"><i class="fa fa-cloud-upload"></i> 上传报告</button>
										</div>
										<div class="col-md-3 col-sm-6">
											<div class="award-item">
												<div class="hexagon">
													<c:if test="${topic.mediumDefense!=0}">
														<a href="javascript:check(${topic.mediumDefense})"><span class="lnr lnr-clock award-icon"></span></a>
													</c:if>
													<c:if test="${topic.mediumDefense==0}">
														<span class="lnr lnr-clock award-icon"></span>
													</c:if>
													
												</div>
												<span>中期答辩</span>
											</div>
											<button type="button" class="btn btn-primary" onclick="upload(2);"><i class="fa fa-cloud-upload"></i> 上传材料</button>
										</div>
										<div class="col-md-3 col-sm-6">
											<div class="award-item">
												<div class="hexagon">
													<c:if test="${topic.thesis!=0}">
														<a href="javascript:check(${topic.thesis})"><span class="lnr lnr-graduation-hat award-icon"></span></a>
													</c:if>
													<c:if test="${topic.thesis==0}">
														<span class="lnr lnr-graduation-hat award-icon"></span>
													</c:if>
												</div>
												<span>毕业论文</span>
											</div>
											<button type="button" class="btn btn-primary" onclick="upload(3);"><i class="fa fa-cloud-upload"></i> 上传论文</button>
										</div>
										<div class="col-md-3 col-sm-6">
											<div class="award-item">
												<div class="hexagon">
													<c:if test="${topic.code!=0}">
														<a href="javascript:check(${topic.code})"><span class="lnr lnr-code award-icon"></span></a>
													</c:if>
													<c:if test="${topic.code==0}">
														<span class="lnr lnr-code award-icon"></span>
													</c:if>
												</div>
												<span>设计实现</span>
											</div>
											<button type="button" class="btn btn-primary" onclick="upload(4);"><i class="fa fa-cloud-upload"></i> 上传代码</button>
										</div>
									</div>
								</div>
								<!-- END AWARDS -->
								<!-- TABBED CONTENT -->
								<div class="custom-tabs-line tabs-line-bottom left-aligned">
									<ul class="nav" role="tablist">
										<li class="active"><a href="#tab-bottom-left1" role="tab" data-toggle="tab">开题<span class="badge"></span></a></li>
										<li><a href="#tab-bottom-left2" role="tab" data-toggle="tab">前期指导<span class="badge"></span></a></li>
										<li><a href="#tab-bottom-left3" role="tab" data-toggle="tab">中期答辩 <span class="badge"></span></a></li>
										<li><a href="#tab-bottom-left4" role="tab" data-toggle="tab">后期指导 <span class="badge"></span></a></li>
										<li><a href="#tab-bottom-left5" role="tab" data-toggle="tab">答辩 <span class="badge"></span></a></li>
										<li><a href="#tab-bottom-left6" role="tab" data-toggle="tab">结题 <span class="badge"></span></a></li>
									</ul>
								</div>
								<div class="tab-content">
									<div class="tab-pane fade in active" id="tab-bottom-left1">
										<ul class="list-unstyled activity-timeline">
										<c:forEach var="msg" items="${msgList1 }" varStatus="status">
											<li>
												<c:if test="${msg.type==1 }">
													<i class="fa fa-line-chart activity-icon"></i>
													<p>${msg.sendId }${msg.title }: ${msg.content } <span class="timestamp">${msg.time }</span></p>
												</c:if>
												<c:if test="${msg.type==2 }">
													<i class="fa fa-comment activity-icon"></i>
													<p>${msg.sendId }${msg.title }: ${msg.content }  <span class="timestamp">${msg.time }</span></p>
												</c:if>
												<c:if test="${msg.type==3 }">
													<i class="fa fa-cloud-upload activity-icon"></i>
													<p>${msg.sendId }${msg.title }: ${msg.content }  <span class="timestamp">${msg.time }</span></p>
												</c:if>
												<c:if test="${msg.type==4 }">
													<i class="fa fa-check activity-icon"></i>
													<p>${msg.sendId }${msg.title }: ${msg.content }  <span class="timestamp">${msg.time }</span></p>
												</c:if>
											</li>
										</c:forEach>
										</ul>
									</div>
									<div class="tab-pane fade" id="tab-bottom-left2">
											<ul class="list-unstyled activity-timeline">
											<c:if test="${topic.status < 3}">
												<li>
													<i class="fa fa-times activity-icon"></i>
													<p>阶段未开始</p>
												</li>
											</c:if>
											<c:if test="${topic.status >= 3}">
												<c:forEach var="msg1" items="${msgList2 }" varStatus="status">
												<li>
													<c:if test="${msg1.type==1 }">
														<i class="fa fa-line-chart activity-icon"></i>
														<p>${msg1.sendId }${msg1.title }: ${msg1.content }  <span class="timestamp">${msg1.time }</span></p>
													</c:if>
													<c:if test="${msg1.type==2 }">
														<i class="fa fa-comment activity-icon"></i>
														<p>${msg1.sendId }${msg1.title }: ${msg1.content }  <span class="timestamp">${msg1.time }</span></p>
													</c:if>
													<c:if test="${msg1.type==3 }">
														<i class="fa fa-cloud-upload activity-icon"></i>
														<p>${msg1.sendId }${msg1.title }: ${msg1.content } <span class="timestamp">${msg1.time }</span></p>
													</c:if>
													<c:if test="${msg1.type==4 }">
														<i class="fa fa-check activity-icon"></i>
														<p>${msg1.sendId }${msg1.title }: ${msg1.content }  <span class="timestamp">${msg1.time }</span></p>
													</c:if>
												</li>
											</c:forEach>	
											</c:if>
											</ul>
									</div>
									<div class="tab-pane fade" id="tab-bottom-left3">
										<ul class="list-unstyled activity-timeline">
											<c:if test="${topic.status < 4}">
												<li>
													<i class="fa fa-times activity-icon"></i>
													<p>阶段未开始 </p>
												</li>
											</c:if>
											<c:if test="${topic.status >= 4}">
												<c:forEach var="msg2" items="${msgList3 }" varStatus="status">
											<li>
												<c:if test="${mmsg2type==1 }">
													<i class="fa fa-line-chart activity-icon"></i>
													<p>${msg2.sendId }${msg2.title }: ${msg2.content }  <span class="timestamp">${msg2.time }</span></p>
												</c:if>
												<c:if test="${msg2.type==2 }">
													<i class="fa fa-comment activity-icon"></i>
													<p>${msg2.sendId }${msg2.title }: ${msg2.content }  <span class="timestamp">${msg2.time }</span></p>
												</c:if>
												<c:if test="${msg2.type==3 }">
													<i class="fa fa-cloud-upload activity-icon"></i>
													<p>${msg2.sendId }${msg2.title }: ${msg2.content }  <span class="timestamp">${msg2.time }</span></p>
												</c:if>
												<c:if test="${msg2.type==4 }">
													<i class="fa fa-check activity-icon"></i>
													<p>${msg2.sendId }${msg2.title }: ${msg2.content } <span class="timestamp">${msg2.time }</span></p>
												</c:if>
											</li>
										</c:forEach>
												
												
											</c:if>
										</ul>
									</div>
									<div class="tab-pane fade" id="tab-bottom-left4">
										<ul class="list-unstyled activity-timeline">
											<c:if test="${topic.status < 5}">
												<li>
													<i class="fa fa-times activity-icon"></i>
													<p>阶段未开始</p>
												</li>
											</c:if>
											<c:if test="${topic.status >= 5}">
												
												<c:forEach var="msg3" items="${msgList4 }" varStatus="status">
											<li>
												<c:if test="${msg3.type==1 }">
													<i class="fa fa-line-chart activity-icon"></i>
													<p>${msg3.sendId }${msg3.title }: ${msg3.content }  <span class="timestamp">${msg3.time }</span></p>
												</c:if>
												<c:if test="${msg3.type==2 }">
													<i class="fa fa-comment activity-icon"></i>
													<p>${msg3.sendId }${msg3.title }: ${msg3.content }  <span class="timestamp">${msg3.time }</span></p>
												</c:if>
												<c:if test="${msg3.type==3 }">
													<i class="fa fa-cloud-upload activity-icon"></i>
													<p>${msg3.sendId }${msg3.title }: ${msg3.content }  <span class="timestamp">${msg3.time }</span></p>
												</c:if>
												<c:if test="${msg3.type==4 }">
													<i class="fa fa-check activity-icon"></i>
													<p>${msg3.sendId }${msg3.title }: ${msg3.content }  <span class="timestamp">${msg3.time }</span></p>
												</c:if>
											</li>
										</c:forEach>
												
											</c:if>
										</ul>
									</div>
									<div class="tab-pane fade" id="tab-bottom-left5">
										<ul class="list-unstyled activity-timeline">
											<c:if test="${topic.status < 6}">
												<li>
													<i class="fa fa-times activity-icon"></i>
													<p>阶段未开始 </p>
												</li>
											</c:if>
											<c:if test="${topic.status >= 6}">
												
												<c:forEach var="msg4" items="${msgList5 }" varStatus="status">
											<li>
												<c:if test="${msg4.type==1 }">
													<i class="fa fa-line-chart activity-icon"></i>
													<p>${msg4.sendId }${msg4.title }: ${msg4.content }  <span class="timestamp">${msg4.time }</span></p>
												</c:if>
												<c:if test="${msg4.type==2 }">
													<i class="fa fa-comment activity-icon"></i>
													<p>${msg4.sendId }${msg4.title }: ${msg4.content }  <span class="timestamp">${msg4.time }</span></p>
												</c:if>
												<c:if test="${msg4.type==3 }">
													<i class="fa fa-cloud-upload activity-icon"></i>
													<p>${msg4.sendId }${msg4.title }: ${msg4.content }  <span class="timestamp">${msg4.time }</span></p>
												</c:if>
												<c:if test="${msg4.type==4 }">
													<i class="fa fa-check activity-icon"></i>
													<p>${msg4.sendId }${msg4.title }: ${msg4.content }  <span class="timestamp">${msg4.time }</span></p>
												</c:if>
											</li>
										</c:forEach>
												
											</c:if>
										</ul>
									</div>
									<div class="tab-pane fade" id="tab-bottom-left6">
										<ul class="list-unstyled activity-timeline">
											<c:if test="${topic.status < 7}">
												<li>
													<i class="fa fa-times activity-icon"></i>
													<p>未结题</p>
												</li>
											</c:if>
											<c:if test="${topic.status >= 7}">
												<c:forEach var="msg5" items="${msgList6 }" varStatus="status">
											<li>
												<c:if test="${msg5.type==1 }">
													<i class="fa fa-line-chart activity-icon"></i>
													<p>${msg5.sendId }${msg5.title }: ${msg5.content } <span class="timestamp">${msg5.time }</span></p>
												</c:if>
												<c:if test="${msg5.type==2 }">
													<i class="fa fa-comment activity-icon"></i>
													<p>${msg5.sendId }${msg5.title }: ${msg5.content }  <span class="timestamp">${msg5.time }</span></p>
												</c:if>
												<c:if test="${msg5.type==3 }">
													<i class="fa fa-cloud-upload activity-icon"></i>
													<p>${msg5.sendId }${msg5.title }: ${msg5.content }  <span class="timestamp">${msg5.time }</span></p>
												</c:if>
												<c:if test="${msg5.type==4 }">
													<i class="fa fa-check activity-icon"></i>
													<p>${msg5.sendId }${msg5.title }: ${msg5.content }  <span class="timestamp">${msg5.time }</span></p>
												</c:if>
											</li>
											</c:forEach>
											</c:if>
										</ul>
									</div>
									<div style="padding-bottom: 20px;"></div>
									<div class="input-group">
										<input class="form-control" type="text" id="content">
										<span class="input-group-btn"><button class="btn btn-success" type="button" onclick="send();">留言</button></span>
									</div>
									
								</div>
								<!-- END TABBED CONTENT -->
							</div>
							<!-- END RIGHT COLUMN -->
						</div>
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>
		<footer>
			<div class="container-fluid">
				<p class="copyright">&copy; 2018 <a>Bater</a>. All Rights Reserved.</p>
			</div>
		</footer>
	</div>
	<!-- END WRAPPER -->
	<!-- Javascript -->
	<script src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/scripts/klorofil-common.js"></script>
	<script type="text/javascript">
		function check(id){
				$.get("${pageContext.request.contextPath}/file/check/"+id,
		    		    function(data){
		        		if(data.statusCode=="1"){
		        			window.location = "${pageContext.request.contextPath}/file/download/"+id;
		        		}
		        		else{
		        	        layer.msg(data.message, {icon: 5});
		        		}
		    	    });
	    }
		function send(){
			var content = $("#content").val();
			$.get("${pageContext.request.contextPath}/message/send",
					{title:"评论了",type:2,content:content,receiveId:${topic.teacherId},topicId:${topic.id}},
	    		    function(data){
	        		if(data.statusCode=="1"){
	        			layer.msg(data.message, {icon: 1});
	        			$("#content").val("");
	        			setTimeout(function () {
	        				window.location.reload();
	                    }, 1500);
	        		}
	        		else{
	        	        layer.msg(data.message, {icon: 5});
	        		}
	   		});
		}
		function upload(type){
			window.type=type;
			var id=${topic.id};
			if(type==1&&${topic.proposal!=0}){
				layer.confirm('你已经上传了开题报告是否覆盖？', {
					  btn: ['确定','取消'] 
					},function(){
						layer.open({
							  type: 1,
							  skin: 'layui-layer-rim', 
							  area: ['420px', '240px'], 
							  content: "<form id='upForm'> <div class='panel'><div class='panel-body'><label>附件</label><input id ='attachment' type='file' style='display:none' name='file'><div class='input-group'><input id='photoCover' class='form-control' type='text' readonly='readonly'><span class='input-group-btn'><button class='btn btn-primary' type='button' onclick="+"$('input[id=attachment]').click();"+">浏览文件</button></span></div>"+
							  "<button type='button' class='btn btn-success btn-toastr' data-context='上传' data-message='上传' data-position='top-right' style='float:right;margin-left: 30px;margin-top:35px;' onclick='up(window.type,${topic.id});'>提交</button></div></div></form> "+
							  '<script src='+'${pageContext.request.contextPath}/assets/scripts/gss.js'+"/>"
						});
					});
			}else if(type==2&&${topic.mediumDefense!=0}){
				layer.confirm('你已经上传了中期答辩是否覆盖？', {
					  btn: ['确定','取消'] 
					},function(){
						layer.open({
							  type: 1,
							  skin: 'layui-layer-rim', 
							  area: ['420px', '240px'], 
							  content: "<form id='upForm'> <div class='panel'><div class='panel-body'><label>附件</label><input id ='attachment' type='file' style='display:none' name='file'><div class='input-group'><input id='photoCover' class='form-control' type='text' readonly='readonly'><span class='input-group-btn'><button class='btn btn-primary' type='button' onclick="+"$('input[id=attachment]').click();"+">浏览文件</button></span></div>"+
							  "<button type='button' class='btn btn-success btn-toastr' data-context='上传' data-message='上传' data-position='top-right' style='float:right;margin-left: 30px;margin-top:35px;' onclick='up(window.type,${topic.id});'>提交</button></div></div></form> "+
							  '<script src='+'${pageContext.request.contextPath}/assets/scripts/gss.js'+"/>"
						});
					});		
			}else if(type==3&&${topic.thesis!=0}){
				layer.confirm('你已经上传了毕业论文是否覆盖？', {
					  btn: ['确定','取消'] 
					},function(){
						layer.open({
							  type: 1,
							  skin: 'layui-layer-rim', 
							  area: ['420px', '240px'],
							  content: "<form id='upForm'> <div class='panel'><div class='panel-body'><label>附件</label><input id ='attachment' type='file' style='display:none' name='file'><div class='input-group'><input id='photoCover' class='form-control' type='text' readonly='readonly'><span class='input-group-btn'><button class='btn btn-primary' type='button' onclick="+"$('input[id=attachment]').click();"+">浏览文件</button></span></div>"+
							  "<button type='button' class='btn btn-success btn-toastr' data-context='上传' data-message='上传' data-position='top-right' style='float:right;margin-left: 30px;margin-top:35px;' onclick='up(window.type,${topic.id});'>提交</button></div></div></form> "+
							  '<script src='+'${pageContext.request.contextPath}/assets/scripts/gss.js'+"/>"
						});
					});
			}else if(type==4&&${topic.code!=0}){
				layer.confirm('你已经上传了代码是否覆盖？', {
					  btn: ['确定','取消']
					},function(){
						layer.open({
							  type: 1,
							  skin: 'layui-layer-rim', 
							  area: ['420px', '240px'], 
							  content: "<form id='upForm'> <div class='panel'><div class='panel-body'><label>附件</label><input id ='attachment' type='file' style='display:none' name='file'><div class='input-group'><input id='photoCover' class='form-control' type='text' readonly='readonly'><span class='input-group-btn'><button class='btn btn-primary' type='button' onclick="+"$('input[id=attachment]').click();"+">浏览文件</button></span></div>"+
							  "<button type='button' class='btn btn-success btn-toastr' data-context='上传' data-message='上传' data-position='top-right' style='float:right;margin-left: 30px;margin-top:35px;' onclick='up(window.type,${topic.id});'>提交</button></div></div></form> "+
							  '<script src='+'${pageContext.request.contextPath}/assets/scripts/gss.js'+"/>"
						});
					});
			}else{
				layer.open({
					  type: 1,
					  skin: 'layui-layer-rim', 
					  area: ['420px', '240px'], 
					  content: "<form id='upForm'> <div class='panel'><div class='panel-body'><label>附件</label><input id ='attachment' type='file' style='display:none' name='file'><div class='input-group'><input id='photoCover' class='form-control' type='text' readonly='readonly'><span class='input-group-btn'><button class='btn btn-primary' type='button' onclick="+"$('input[id=attachment]').click();"+">浏览文件</button></span></div>"+
					  "<button type='button' class='btn btn-success btn-toastr' data-context='上传' data-message='上传' data-position='top-right' style='float:right;margin-left: 30px;margin-top:35px;' onclick='up(window.type,${topic.id});'>提交</button></div></div></form> "+
					  '<script src='+'${pageContext.request.contextPath}/assets/scripts/gss.js'+"/>"
				});
				
			}
		}
	</script>
</body>

</html>
