<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>

<head>
	<title>我的选题 | 毕业选题</title>
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
								<li><a href="${pageContext.request.contextPath}/user/info"><i class="lnr lnr-user"></i> <span>个人信息</span></a></li>
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
						<li><a href='${pageContext.request.contextPath}/teacher/publish' class=''><i class='lnr lnr-alarm'></i> <span>选题发布</span></a></li>
						<li><a href='${pageContext.request.contextPath}/topic/teaTop/page/0' class='active'><i class='lnr lnr-chart-bars'></i> <span>我的选题</span></a></li>
						<li><a href='${pageContext.request.contextPath}/topic/mytopic/0' class=''><i class='lnr lnr-list'></i> <span>选题记录</span></a></li>
						<li><a href='${pageContext.request.contextPath}/topic/scan' class=""><i class='lnr lnr-chart-bars'></i> <span>选题查看</span></a></li>
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
					<h3 class="page-title">我的选题</h3>
					<div id="toastr-demo" class="panel">
						<div class="panel-body">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>#</th>
										<th>题目名称</th>
										<th>选题学生</th>
										<th>答辩秘书</th>
										<th>描述</th>
										<th>内容</th>
										<th>附件</th>
										<th>发布时间</th>
										<th>状态</th>
										<th>详情</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="varName" items="${teaTopList}" varStatus="status">
										<tr <c:if test="${status.index%2==0}">style="background-color: snow"</c:if>>
							                <td>${status.index+1}</td>
							                <td>${varName.title}</td>
							                <td>
							                	<c:if test="${varName.studentId!=''}">
							                		<a href="${pageContext.request.contextPath}/user/info/0/${varName.studentId}">${varName.studentName}</a>
							                	</c:if>
							                </td>
							                <td>
							                	<c:if test="${varName.secretaryId!=''}">
							                		<a href="${pageContext.request.contextPath}/user/info/2/${varName.secretaryId}">${varName.secretaryName}</a>
							                	</c:if>
							                </td>
							                <td>${varName.description}</td>
							                <td>${varName.content}</td>
							                <td><a href="javascript:check(${varName.attachment})">下载</a></td>
							                <td>${varName.time}</td>
							                <td>
							                	<c:if test="${varName.status==0}">可选</c:if>
						                		<c:if test="${varName.status==1}">已确定</c:if>
						                		<c:if test="${varName.status==2}">开题报告</c:if>
						                		<c:if test="${varName.status==3}">前期指导</c:if>
						                		<c:if test="${varName.status==4}">中期答辩</c:if>
						                		<c:if test="${varName.status==5}">后期指导</c:if>
						                		<c:if test="${varName.status==6}">最终答辩</c:if>
						                		<c:if test="${varName.status==7}">结题</c:if>
							                </td>
							                <td>
							                	<c:if test="${varName.status>0}"><a href="${pageContext.request.contextPath}/topic/detail/${varName.id}">详情</a></c:if>
							                </td>
							        	</tr>
							        </c:forEach>
								</tbody>
							</table>
							<!-- END BORDERED TABLE -->
						</div>
						<div class="panel-footer pagenav">		
							<ul>
								<c:if test="${teaTopPage.hasPrePage==true}">
								<li><a href="${pageContext.request.contextPath}/topic/teaTop/page/${teaTopPage.currentPage-1}" class="btu">上一页</a></li>
								</c:if>
								<li><a href="#" class="btu active">${teaTopPage.currentPage}</a></li>
								<c:if test="${teaTopPage.currentPage+1<=teaTopPage.totalPage}">
									<li><a href="${pageContext.request.contextPath}/topic/teaTop/page/${teaTopPage.currentPage+1}" class="btu">${teaTopPage.currentPage+1}</a></li>
								</c:if>
								<c:if test="${teaTopPage.currentPage+2<=teaTopPage.totalPage}">
									<li><a href="${pageContext.request.contextPath}/topic/teaTop/page/${teaTopPage.currentPage+2}" class="btu">${teaTopPage.currentPage+2}</a></li>
								</c:if>
								<c:if test="${teaTopPage.currentPage+3<=teaTopPage.totalPage}">
									<li><a href="${pageContext.request.contextPath}/topic/teaTop/page/${teaTopPage.currentPage+3}" class="btu">${teaTopPage.currentPage+3}</a></li>
								</c:if>
								<c:if test="${teaTopPage.hasNextPage==true}">
									<li><a href="${pageContext.request.contextPath}/topic/teaTop/page/${teaTopPage.currentPage+1}" class="btu" >下一页</a></li>
									<li><a href="${pageContext.request.contextPath}/topic/teaTop/page/${teaTopPage.totalPage}" class="btu">最后一页</a></li>
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
	</script>
</body>

</html>
