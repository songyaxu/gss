<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>

<head>
	<title>编辑 | 毕业选题</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/linearicons/style.css">
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
								<li><a href="${pageContext.request.contextPath}/admin/modPwd"><i class="lnr lnr-envelope"></i> <span>修改密码</span></a></li>
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
						<li><a href='#subPages' data-toggle='collapse' class='collapsed'><i class='lnr lnr-file-empty'></i> <span>学生管理</span> <i class='icon-submenu lnr lnr-chevron-left'></i></a>
							<div id='subPages' class='collapse '>
								<ul class='nav'>
									<li><a href='${pageContext.request.contextPath}/manage/student/add' class=''>新增</a></li>
									<li><a href='${pageContext.request.contextPath}/student/scan' class=''>编辑/查看</a></li>
								</ul>
							</div>
						</li>
						<li>
						<a href='#subPages2' data-toggle='collapse' class='collapsed'><i class='lnr lnr-file-empty'></i> <span>教师管理</span> <i class='icon-submenu lnr lnr-chevron-left'></i></a>
							<div id='subPages2' class='collapse '>
								<ul class='nav'>
									<li><a href='${pageContext.request.contextPath}/manage/teacher/add' class=''>新增</a></li>
									<li><a href='${pageContext.request.contextPath}/teacher/scan' class=''>编辑/查看</a></li>
								</ul>
							</div>
						</li>
						<li>
						<a href='#subPages3' data-toggle='collapse' class='collapsed'><i class='lnr lnr-file-empty'></i> <span>管理员管理</span> <i class='icon-submenu lnr lnr-chevron-left'></i></a>
							<div id='subPages3' class='collapse '>
								<ul class='nav'>
									<c:if test="${user.id=='admin'}">
										<li><a href='${pageContext.request.contextPath}/manage/admin/add' class=''>新增</a></li>
									</c:if>
									<li><a href='${pageContext.request.contextPath}/admin/scan' class=''>编辑/查看</a></li>
								</ul>
							</div>
						</li>
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
					<h3 class="page-title">编辑教师信息</h3>
					<div id="toastr-demo" class="panel">
						<div class="panel-body">
							<p>
								<br>
								<label>ID</label>
								<input type="text" id="id" class="form-control" value="${teacher.id}" readonly="readonly" style="width:200px;">
								<br>
								<label>姓名</label>
								<input type="text" id="name" class="form-control" value="${teacher.name}" style="width:200px;">
								<br>
								<label>性别</label>
								<div>
									<label class="fancy-radio" style="float: left">
											<input name="gender" value="1" type="radio" <c:if test="${teacher.gender==1}">checked="checked"</c:if>>
											<span><i></i>男</span>
									</label>
									<label class="fancy-radio" style="float: left;padding-left: 20px">
											<input name="gender" value="2" type="radio" <c:if test="${teacher.gender==2}">checked="checked"</c:if>>
											<span><i></i>女</span>
								   </label>
								</div>
								<div class="clearfix"></div>
								<br>
								<label>邮箱</label>
								<input type="text" id="email" class="form-control" value="${teacher.email}" style="width:200px;">
								<br>
								<label>手机</label>
								<input type="text" id="phone" class="form-control" value="${teacher.phone}" style="width:200px;">
								<br>
								<label>类别</label>
								<select id="type" class="form-control" style="width:200px;">
										<option value="0" <c:if test="${teacher.type==0}">selected="selected"</c:if>>教师</option>
										<option value="1" <c:if test="${teacher.type==1}">selected="selected"</c:if>>答辩秘书</option>
									</select>

							</p>
							<hr>
							<p class="demo-button">
								<button type="button" class="btn btn-success btn-toastr" data-context="提交" data-message="提交" data-position="top-right" style="float:right;margin-left: 30px;" onclick="add();">提交</button>
							</p>
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
    function add(){
    	var id=$("#id").val();
        var name=$("#name").val();
        var gender=$('input[name=gender]:checked').val();
        var email=$("#email").val();
        var phone=$("#phone").val();
        var type=$("#type").val();
        $.get("${pageContext.request.contextPath}/teacher/update",{ id: id,name:name,gender:gender,email:email,phone:phone,type:type},
    		    function(data){
        		if(data.statusCode=="1"){
        			layer.msg(data.message, {icon: 1});
        		}
        		else{
        	        layer.msg(data.message, {icon: 5});
        		}
    	    });
    }
	</script>
</body>

</html>
