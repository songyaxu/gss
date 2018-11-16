<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>

<head>
	<title>查看/编辑 | 毕业选题</title>
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
				<a href="${pageContext.request.contextPath}/user/index"><img src="${pageContext.request.contextPath}/assets/img/logo-dark.png" alt="毕设选题" class="img-responsive logo"></a>
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
						<!-- <li>
							<a class="update-pro" href="#downloads/klorofil-pro-bootstrap-admin-dashboard-template/?utm_source=klorofil&utm_medium=template&utm_campaign=KlorofilPro" title="Upgrade to Pro" target="_blank"><i class="fa fa-rocket"></i> <span>UPGRADE TO PRO</span></a>
						</li> -->
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
						<li><a href='#subPages' data-toggle='collapse' class='active'><i class='lnr lnr-file-empty'></i> <span>学生管理</span> <i class='icon-submenu lnr lnr-chevron-left'></i></a>
							<div id='subPages' class='collapse in'>
								<ul class='nav'>
									<li><a href='${pageContext.request.contextPath}/manage/student/add' class=''>新增</a></li>
									<li><a href='${pageContext.request.contextPath}/student/scan' class='active'>编辑/查看</a></li>
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
					<h3 class="page-title">查看/编辑</h3>
					<div id="toastr-demo" class="panel">
						<div class="panel-body">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>#</th>
										<th>学生ID</th>
										<th>学生姓名</th>
										<th>性别</th>
										<th>邮箱</th>
										<th>电话</th>
										<th>学院专业</th>
										<th>毕业状态</th>
										<th>上次登录时间</th>
										<th>管理</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="varName" items="${stuList}" varStatus="status">
										<tr <c:if test="${status.index%2==0}">style="background-color: snow"</c:if>>
							                <td>${status.index+1}</td>
							                <td>${varName.id}</td>
							                <td>${varName.name}</td>
							                <td> 
							                	<c:if test="${varName.gender==0}">-</c:if>
							                	<c:if test="${varName.gender==1}">男</c:if>
							                	<c:if test="${varName.gender==2}">女</c:if>
							                </td>
							                <td>${varName.email}</td>
							                <td>${varName.phone}</td>
							                <td>${varName.dept}-${varName.major}</td>
							                <td>${varName.status}</td>
							                <td>${(varName.lastLoginTime eq null) ? "从未登陆":varName.lastLoginTime}</td>
							                <td>
							                	<a href="${pageContext.request.contextPath}/manage/student/${varName.id}">编辑</a>
							                	<a href="javascript:reset('${varName.id}');">重置密码</a>
							                	<a href="javascript:del('${varName.id}');">删除</a>
							                </td>
							        	</tr>
							        </c:forEach>
								</tbody>
							</table>
							<!-- END BORDERED TABLE -->
						</div>
						<div class="panel-footer pagenav">		
							<ul>
								<c:if test="${stuPage.hasPrePage==true}">
								<li><a href="${pageContext.request.contextPath}/student/scan/page/${stuPage.currentPage-1}" class="btu">上一页</a></li>
								</c:if>
								<li><a href="#" class="btu active">${stuPage.currentPage}</a></li>
								<c:if test="${stuPage.currentPage+1<=stuPage.totalPage}">
									<li><a href="${pageContext.request.contextPath}/student/scan/page/${stuPage.currentPage+1}" class="btu">${stuPage.currentPage+1}</a></li>
								</c:if>
								<c:if test="${stuPage.currentPage+2<=stuPage.totalPage}">
									<li><a href="${pageContext.request.contextPath}/student/scan/page/${stuPage.currentPage+2}" class="btu">${stuPage.currentPage+2}</a></li>
								</c:if>
								<c:if test="${stuPage.currentPage+3<=stuPage.totalPage}">
									<li><a href="${pageContext.request.contextPath}/student/scan/page/${stuPage.currentPage+3}" class="btu">${stuPage.currentPage+3}</a></li>
								</c:if>
								<c:if test="${stuPage.hasNextPage==true}">
									<li><a href="${pageContext.request.contextPath}/student/scan/page/${stuPage.currentPage+1}" class="btu" >下一页</a></li>
									<li><a href="${pageContext.request.contextPath}/student/scan/page/${stuPage.totalPage}" class="btu">最后一页</a></li>
								</c:if>
							</ul>
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
	<!--  <script src="${pageContext.request.contextPath}/assets/vendor/toastr/toastr.min.js"></script>  -->
	<script src="${pageContext.request.contextPath}/assets/scripts/klorofil-common.js"></script>
	<script type="text/javascript">
	    function reset(id){
	    	layer.confirm('确定要重置用户'+id+'的密码吗？', {
	    		  btn: ['确定','取消']
	    		}, function(){
	    			$.get("${pageContext.request.contextPath}/user/resetPwd",{ id: id,type:0},
	    	    		    function(data){
	    	        		if(data.statusCode=="1"){
	    	        			layer.msg(data.message, {icon: 1});
	    	        		}
	    	        		else{
	    	        	        layer.msg(data.message, {icon: 5});
	    	        		}
	    	    	    });
	    		}
	    	)
	    }
	    function del(id){
	    	layer.confirm('确定要删除用户'+id+'吗？', {
	    		  btn: ['确定','取消']
	    		}, function(){
	    			$.get("${pageContext.request.contextPath}/user/delete/"+id,
	    	    		    function(data){
	    	        		if(data.statusCode=="1"){
	    	        			layer.msg(data.message, {icon: 1});
	    	        			setTimeout(function () {
	    	                        window.location = "${pageContext.request.contextPath}/student/scan";
	    	                    }, 1500);
	    	        		}
	    	        		else{
	    	        	        layer.msg(data.message, {icon: 5});
	    	        		}
	    	    	    });
	    		}
	    	)
	    }
	</script>
</body>

</html>
