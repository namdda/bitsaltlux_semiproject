<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" class="fullscreen-bg">

<head>
	<title>Login | Klorofil - Free Bootstrap Dashboard Template</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="/assets/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="/assets/vendor/linearicons/style.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="/assets/css/main.css">
	<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
	<link rel="stylesheet" href="/assets/css/demo.css">
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="/assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="/assets/img/favicon.png">
	<script src="/assets/vendor/jquery/jquery.min.js"></script>
</head>
<script>
$(function(){
	if("${param.Status }" == "PWNE") {
		alert("ID 또는 비밀번호가 일치하지 않습니다.");
	}
	if("${param.Status }" == "SESSIONOUT") {
		alert("세션이 만료되었습니다. 다시 로그인 하여주십시요.");
		top.location="/login/loginPage.do";
	}
	$("#btn").on("click", function(){
		var obj = document.frm;
		obj.action = "/login/loginProc.do";
		obj.method = "post";
		obj.submit();
	});
	$("#btn2").on("click", function(){
		location.href="/user/userJoin.do";
	});
});
</script>

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<div class="vertical-align-wrap">
			<div class="vertical-align-middle">
				<div class="auth-box ">
					<div class="left">
						<div class="content">
							<div class="header">
								<a href="index.html">
								<div class="logo text-center"><img src="/assets/img/logo-dark.png" alt="Klorofil Logo"></div>
								<p class="lead">Login to your account</p>
								</a>
							</div>
							<form class="form-auth-small" name="frm">
								<div class="form-group">
									<label for="signin-id" class="control-label sr-only">학번</label>
									<input type="text" class="form-control" id="inputId" name="inputId" placeholder="학번" />
								</div>
								<div class="form-group">
									<label for="signin-password" class="control-label sr-only">Password</label>
									<input type="password" class="form-control" id="userPw" name="userPw" placeholder="Password" />
								</div>
							</form>
							<button type="button" id="btn" class="btn btn-primary btn-lg btn-block">LOGIN</button>
							<button type="button" id="btn2" class="btn btn-primary btn-lg btn-block" style="background-color: green;">JOIN US</button>
						</div>
					</div>
					<div class="right">
						<div class="overlay"></div>
						<div class="content text">
							<h1 class="heading">NamDawon SemiProject</h1>
							<p>by The Develovers</p>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- END WRAPPER -->
</body>

</html>