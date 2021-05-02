<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html lang="en">
<head>
	<title>MEMBER-JOIN | Klorofil - Free Bootstrap Dashboard Template</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="/assets/vendor/bootstrap/css/bootstrap.min.css">
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
	
	<script src="/assets/js/jquery/jquery-3.6.0.js" type="text/javascript"></script>
<script>
$(function(){
	$("#btn-check").click(function(){
		const inputId = $("#inputId").val();
		if(inputId == '') return false;
		$.ajax({
			url: "/user/existid.do",
			type : "post",
			data: {"inputId" : inputId},
			dataType: 'text',
			success: function(response){
				if(response == 'success'){
					$("#imgCheck").show();
					$("#imgCheck").attr("disabled","disabled");
					$("#inputId").attr("readonly","readonly");
				} else {
					$("#imgCheck").hide();
					alert('이미 존재하는 학번입니다. 다른 학번을 사용해 주세요');
					$("#inputId").val('').focus();
				}
			},
			error: function(xhr, status, e){
				console.error(status + ":" + e);
			}
		});
	});
})

</script>
</head>

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="brand">
				<a href="../main/mainPage.do"><img src="/assets/img/logo-dark.png" alt="Klorofil Logo" class="img-responsive logo"></a>
			</div>
			<div class="container-fluid">
				<div class="navbar-btn">
					<button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
				</div>
				<form class="navbar-form navbar-left">
					<div class="input-group">
						<input type="text" value="" class="form-control" placeholder="Search dashboard...">
						<span class="input-group-btn"><button type="button" class="btn btn-primary">Go</button></span>
					</div>
				</form>
				<div id="navbar-menu">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<ul class="dropdown-menu notifications">
								<li><a href="#" class="notification-item"><span class="dot bg-warning"></span>System space is almost full</a></li>
								<li><a href="#" class="notification-item"><span class="dot bg-danger"></span>You have 9 unfinished tasks</a></li>
								<li><a href="#" class="notification-item"><span class="dot bg-success"></span>Monthly report is available</a></li>
								<li><a href="#" class="notification-item"><span class="dot bg-warning"></span>Weekly meeting in 1 hour</a></li>
								<li><a href="#" class="notification-item"><span class="dot bg-success"></span>Your request has been approved</a></li>
								<li><a href="#" class="more">See all notifications</a></li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="lnr lnr-question-circle"></i> <span>Help</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
							<ul class="dropdown-menu">
								<li><a href="#">Basic Use</a></li>
								<li><a href="#">Working With Data</a></li>
								<li><a href="#">Security</a></li>
								<li><a href="#">Troubleshooting</a></li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="/assets/img/user.png" class="img-circle" alt="Avatar"> <span>Samuel</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
							<ul class="dropdown-menu">
								<li><a href="#"><i class="lnr lnr-user"></i> <span>My Profile</span></a></li>
								<li><a href="#"><i class="lnr lnr-envelope"></i> <span>Message</span></a></li>
								<li><a href="#"><i class="lnr lnr-cog"></i> <span>Settings</span></a></li>
								<li><a href="#"><i class="lnr lnr-exit"></i> <span>Logout</span></a></li>
							</ul>
						</li>
						<!-- <li>
							<a class="update-pro" href="https://www.themeineed.com/downloads/klorofil-pro-bootstrap-admin-dashboard-template/?utm_source=klorofil&utm_medium=template&utm_campaign=KlorofilPro" title="Upgrade to Pro" target="_blank"><i class="fa fa-rocket"></i> <span>UPGRADE TO PRO</span></a>
						</li> -->
					</ul>
				</div>
			</div>
		</nav>
		<!-- END NAVBAR -->
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">Member join</h3>
					<div class="row">
						<div class="col-md-9">
							<!-- INPUTS -->
							<div class="panel">
								<form method="post" action="/user/joinProc.do">
									<div class="panel-body">
										<div style="margin-bottom:10px;height: 40px;">
											<span style="float:left; margin: 5px 7px 0 0;">이름 : </span> 
											<input type="text" id="inputName" name="inputName" class="form-control" placeholder="이름" style="width:90%;float:left;" />
										</div>
										<div style="margin-bottom:10px;height: 40px;">
											<span style="float:left; margin: 5px 10px 0 0;">학교: </span> 
											<input type="text" id="inputSchool" name="inputSchool" class="form-control" placeholder="학교" style="width:90%;float:left;" />
										</div>
										<div style="margin-bottom:10px;height: 40px;">
											<span style="float:left; margin: 5px 10px 0 0;">학번: </span> 
											<input type="text" id="inputId" name="inputId" class="form-control" placeholder="학번" style="width:70%;float:left;margin-right: 10px;">&nbsp;&nbsp;
											<input id="btn-check" class="btn btn-default" type="button" value="중복확인" style="float:left;">&nbsp;&nbsp;
											<img id="imgCheck" style="width:30px; display:none; float:left; margin-left:10px;" src="/assets/img/check.png" />
										</div>
										<div style="margin-bottom:10px;height: 40px; width:70%;float:left;margin-right: 10px;">
											<span style="float:left; margin: 5px 10px 0 0;">전공: </span>
											<select class="form-control" name="inputMajor">
												<option value="">과목</option>
												<option value="kor">국어</option>
												<option value="eng">영어</option>
												<option value="mat">수학</option>
												<option value="sci">과학</option>
												<option value="spt">체육</option>
												<option value="art">미술</option>
												<option value="com">컴퓨터</option>
												<option value="etc">기타</option>
											</select>
										</div>
										<div style="margin-bottom:10px;height: 40px;">
											<span style="float:left; margin: 5px 10px 0 0;">비밀번호: </span>
											<input type="password" class="form-control" id="userPw" name="userPw" value="asecret" style="width:70%;float: left;" />
										</div>
										회원 등급:
										<label class="fancy-radio">
											<input name="level" value="PRO" type="radio">
											<span><i></i>교수</span>
										</label>
										<label class="fancy-radio">
											<input name="level" value="STUDENT" type="radio" checked="checked">
											<span><i></i>학생</span>
										</label>
										
										<button class="btn btn-success" type="submit">가입하기</button>
										<button class="btn btn-default" type="button" onclick="history.back();">뒤로 	가기</button>
									</div>
								</form>
							</div>
							<!-- END INPUTS -->
							
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
				<p class="copyright">Shared by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">BootstrapThemes</a>
</p>
			</div>
		</footer>
	</div>
	<!-- END WRAPPER -->
	<!-- Javascript -->
	<script src="/assets/vendor/jquery/jquery.min.js"></script>
	<script src="/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="/assets/scripts/klorofil-common.js"></script>
</body>

</html>
