<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html class="fullscreen-bg">
<head>
	<title>用户登录 | 选题系统</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/linearicons/style.css">
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
		<div class="vertical-align-wrap">
			<div class="vertical-align-middle">
				<div class="auth-box ">
					<div class="left">
						<div class="content">
							<div class="header">
								<div class="logo text-center"><img src="${pageContext.request.contextPath}/assets/img/logo-dark.png" alt="Logo"></div>
								<p class="lead">用户登录</p>
							</div>
							<form class="form-auth-small">
								<div class="form-group">
									<input type="text" class="form-control" id="no" value="0141122" name="no" placeholder="工号">
								</div>
								<div class="form-group">
									<input type="password" class="form-control" id="pwd" name="pwd" value="0141122" placeholder="密码">
								</div>

								<button type="button" class="btn btn-primary btn-lg btn-block" onclick="login();">登录</button>
								
							</form>
						</div>
					</div>
					<div class="right">
						<div class="overlay"></div>
						<div class="content text">
							<h1 class="heading">学生选题系统</h1>
							<p>      by yaxuSong</p>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- END WRAPPER -->
	<script type="text/javascript">
    function login(){
    	var no=$("#no").val();
    	var pwd=$("#pwd").val();
    	$.get("${pageContext.request.contextPath}/user/login/"+no+"/"+pwd,
		    function(data){
    		if(data.statusCode=="1"){
    			layer.msg(data.message, {
    				  icon: 16
    				  ,shade: 0.01
    				});
                setTimeout(function () {
                    window.location = "${pageContext.request.contextPath}/user/index";
                }, 1500);
    		}
    		else{
    			layer.msg(data.message, {icon: 5});
    		}
            
	    });
    }
</script>
</body>

</html>
