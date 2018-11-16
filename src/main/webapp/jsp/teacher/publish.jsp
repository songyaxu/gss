<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
	<title>选题发布 | 毕业选题</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/linearicons/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/chartist/css/chartist-custom.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
	<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/demo.css">
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
				<a href="${pageContext.request.contextPath}/user/index"><img src="${pageContext.request.contextPath}/assets/img/logo-dark.png" alt="Klorofil Logo" class="img-responsive logo"></a>
			</div>
			<div class="container-fluid">
				<div class="navbar-btn">
					<button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
				</div>
				<div id="navbar-menu">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span>${user.name }</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath}/user/info"><i class="lnr lnr-user"></i> <span>个人信息</span></a></li>
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
						<li><a href='${pageContext.request.contextPath}/teacher/publish' class="active"><i class='lnr lnr-alarm'></i> <span>选题发布</span></a></li>
						<li><a href='${pageContext.request.contextPath}/topic/teaTop/page/0' class=''><i class='lnr lnr-chart-bars'></i> <span>我的选题</span></a></li>
						<li><a href='${pageContext.request.contextPath}/topic/mytopic/0' class=''><i class='lnr lnr-list'></i> <span>选题记录</span></a></li>
						<li><a href='${pageContext.request.contextPath}/topic/scan' class=''><i class='lnr lnr-chart-bars'></i> <span>选题查看</span></a></li>
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
					<h3 class="page-title">选题发布</h3>
					<div id="toastr-demo" class="panel">
						<div class="panel-body">
							<form id= "uploadForm"> 
							<div class="alert alert-info alert-warning" role="alert">
								<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								<i class="fa fa-warning"></i> 如有多个文件请打包上传。
							</div>
							
							<div class="row">
								<div class="col-md-6">
									<!-- INPUTS -->
									<div class="panel">
										<div class="panel-body">
											<label>标题</label>
											<input type="text" class="form-control" id="title" name="title">
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<!-- INPUT GROUPS -->
									<div class="panel">
										<div class="panel-body">
											<label>附件</label>
											<input id ="attachment" type="file" style="display:none" name="file">
											<div class="input-group">
												<input id="photoCover" class="form-control" type="text" readonly="readonly">
												<span class="input-group-btn"><button class="btn btn-primary" type="button" onclick="$('input[id=attachment]').click();">浏览文件</button></span>
											</div>
										</div>
									</div>
									<!-- END ALERT MESSAGES -->
								</div>
							</div>
						<label>内容介绍</label>
						<textarea class="form-control"id="content" name="content" rows="10"></textarea>
						<br>
						<label>描述</label>
						<textarea class="form-control"id="description" name="description" rows="4"></textarea>
						<hr>
						<p class="demo-button">
								<button type="button" class="btn btn-success btn-toastr" data-context="提交" data-message="提交" data-position="top-right" style="float:right;margin-left: 30px;" onclick="doUpload();">提交</button>
								<button type="button" class="btn btn-primary btn-toastr" data-context="重置" data-message="重置" data-position="top-right" style="float:right;" onclick="clr();">重置</button>
						</p>
						</form>
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
		$('input[id=attachment]').change(function() {  
			var name=$(this).val();
			var realname=name.split("\\");
		$('#photoCover').val(realname[realname.length-1]);  
		}); 
		function doUpload() {  
			 var title=$("#title").val();
			 if(title==="")
			 {
				 layer.msg("标题不能为空", {icon: 5});
				 return;
			 }
		     var formData = new FormData($( "#uploadForm" )[0]);  
		     $.ajax({  
		          url: '${pageContext.request.contextPath}/topic/upload' ,  
		          type: 'POST',  
		          data: formData,  
		          async: false,  
		          cache: false,  
		          contentType: false,  
		          processData: false,  
		          success: function (data) {  
		        	  if(data.statusCode=="1")
		        	  {
		        		  layer.msg(data.message, {icon: 1});
		        		  clr();
		        	  }
		        	  else{
		        		  layer.msg(data.message, {icon: 5});
		        	  }
		          },  
		          error: function (returndata) {  
		        	  layer.msg(data.message, {icon: 5});
		          }  
		     });
		}
		function clr(){
			$("#title").val("");
			$("#photoCover").val("");
			$("#description").val("");
			$("#content").val("");
			
		}
	</script>  
</body>

</html>
