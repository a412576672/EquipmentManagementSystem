<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html >
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>工业控制设备管理系统</title>
<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<style type="text/css">
	body{
		background:url(./images/back.png) no-repeat center center;
		background-size: cover;
		height:550px;
	}
</style>
<body>
	
	<p class="center"></p>
	<div id="wrapper" class="login-page">
		<div id="login_form" class="form">
<%--			<img style="position: relative; top: -10px;" width="200px" src="images/图标.jpg" >--%>
			<form class="login-form" style="position: relative;top: -25px;" action="${pageContext.request.contextPath}/adminLogin.handler" method="post">
				<h2 style="text-align: center;color:#efab00;margin-bottom: 30px; ">设备管理系统后台登录</h2>
				<input type="text" placeholder="用户名" autocomplete="off"  name="username" id="user_name" />
				<input type="password" placeholder="密码" name="password" id="password" />
				<button type="submit" style="background-color: #FFB800;" id="login">登　录</button>
			</form>
		</div>
	</div>
<script src="js/jquery-1.12.4.js"></script>
</body>
</html>