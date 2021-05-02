<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html lang="ko">

<head>
	<title>Dashboard | Klorofil - Free Bootstrap Dashboard Template</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="/assets/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/assets/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="/assets/vendor/linearicons/style.css">
	<link rel="stylesheet" href="/assets/vendor/chartist/css/chartist-custom.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="/assets/css/main.css">
	<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->

	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="/assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="/assets/img/favicon.png">
	<script src="/assets/vendor/jquery/jquery.min.js"></script>
</head>
<script>
$(function(){
	$("#major").on("change", function(){
		$("#allType").find('option').remove();
		$("#professor").find('option').remove();
		$("#allType").append("<option value=''>유형</option>");
		$.ajax({
			url: "/main/allTypeList.do",
			type : "post",
			data: {"value" : $("#major").val()},
			dataType: 'JSON',
			success: function(data) {
				var objSel = $("#allType")[0];
				for(var x = objSel.length-1; 1 <= x; x--) {
					objSel.options[x] = null;
				}
				for(var i = 0; i < data.length; i++) {
					var objOption = document.createElement("option");
					objOption.value = data[i].value;
					objOption.text = data[i].name;
					objSel.options.add(objOption);
				}
			},
			error: function(xhr, status, e){
				console.error(status + ":" + e);
			}
		});
	});
	
	$("#allType").on("change", function(){
		$("#professor").find('option').remove();
		$.ajax({
			url: "/main/professorList.do",
			type : "post",
			data: {"value" : $("#allType").val()},
			dataType: 'JSON',
			success: function(data) {
				var objSel = $("#professor")[0];
				for(var x = objSel.length-1; 1 <= x; x--) {
					objSel.options[x] = null;
				}
				for(var i = 0; i < data.length; i++) {
					var objOption = document.createElement("option");
					objOption.value = data[i].inputId;
					objOption.text = data[i].inputName;
					objSel.options.add(objOption);
				}
			},
			error: function(xhr, status, e){
				console.error(status + ":" + e);
			}
		});
	});
	
	$("#search").on("click", function(){
		$.ajax({
			url: "/education/searchEducationList.do",
			type : "post",
			data: {"inputId" : $("#professor").val()},
			dataType: 'JSON',
			success: function(data) {
				for(var i=0; i<data.length; i++) {
					$(".resultList").append("<tr><td>"+data[i].idx+"</td>"
							+"<td>"+data[i].name+"</td>"
							+"<td>"+data[i].allTypeName+"</td>"
							+"<td>"+data[i].time+"</td>"
							+"<td>"+data[i].grades+"</td>"
							+"<td>"+data[i].inputName+"</td>"
							+"<td>"+data[i].etc+"</td>"
							+"<td>"+data[i].cnt+"</td>"
							+"<td><button type='button' class='btn_"+i+"' onclick='joinEducation(\""+data[i].firstSubject+"\", \""+data[i].secondSubject+"\")'>수강하기</button></td></tr>");
					if(data[i].cnt == 0) {
						$(".btn_"+i).hide();
					}
					
					/* console.log(data[i].idx)
					console.log(data[i].inputId)
					console.log(data[i].subject) */
				}
			},
			error: function(xhr, status, e){
				console.error(status + ":" + e);
			}
		});
	});
});
</script>

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="brand">
				<a href="/mainPage.do"><img src="/assets/img/logo-dark.png" alt="Klorofil Logo" class="img-responsive logo" /></a>
			</div>
			<div class="container-fluid">
				<div class="navbar-btn">
					<button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
				</div>
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
						<li>
							<a href="/login/logOut.do" class="dropdown-toggle"><span>logout</span></a>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="/assets/img/user.png" class="img-circle" alt="Avatar" style="display: none;"/><span>${sessionScope.userNm }</span></a>
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
		<!-- LEFT SIDEBAR -->
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<nav>
					<ul class="nav">
						<li><a href="mainPage.do" class="active"><i class="lnr lnr-home"></i> <span>메인페이지</span></a></li>
						<li><a href="/user/userUpdate.do?inputId=${sessionScope.userId }" class="active"><i class="lnr lnr-pencil"></i><span>회원 정보</span></a></li>
						<li>
							<!--  <a href="../subject/subjectView.do?inputId=${sessionScope.userId }" class=""><i class="lnr lnr-code"></i> -->
							<c:choose>
								<c:when test="${sessionScope.userLevel != 'PRO'}">
									<a href="/subject/StudentsubjectView.do?inputId=${sessionScope.userId }" class=""><i class="lnr lnr-code"></i>
										<span>수강과목 조회</span>
									</a>
								</c:when>
								<c:otherwise>
									<a href="/subject/ProsubjectView.do?inputId=${sessionScope.userId }" class=""><i class="lnr lnr-code"></i>
										<span>내 과목 조회</span>
									</a>
								</c:otherwise>
							</c:choose>
							<!-- </a> -->
						</li>
						<c:if test="${sessionScope.userLevel == 'PRO'}">
							<li>
								<a href="#subPages" data-toggle="collapse" class="collapsed"><i class="lnr lnr-file-empty"></i><span> 과목</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
								<div id="subPages" class="collapse">
									<ul class="nav">
										<li><a href="/subject/subjectView.do">과목 등록</a></li>
										<li><a href="page-login.html">과목 수정</a></li>
									</ul>
								</div>
							</li>
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
					<!-- OVERVIEW -->
					<div class="panel panel-headline">
						<div class="panel-heading">
							<h3 class="panel-title">리얼 타임 시계</h3>
							<h1 id="clock" style="color:gray;">00:00</h1>
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-9">
								<table class="table table-bordered">
										<thead>
											<tr>
												<th>#</th>
												<th>월</th>
												<th>화</th>
												<th>수</th>
												<th>목</th>
												<th>금</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1 교시</td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td>2 교시</td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td>3 교시</td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td>4 교시</td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td>5 교시</td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td>6 교시</td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td>7 교시</td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td>8 교시</td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div><br>
								<div class="col-md-12">
									<div class="col-md-9">
										<form class="navbar-form navbar-left">
											<div class="input-group" style="display: none;">
												<input type="text" class="form-control" placeholder="Search dashboard..." />
												<span class="input-group-btn"><button type="button" class="btn btn-primary">Go</button></span>
											</div>
										</form>
									</div>
									<div class="col-md-12"></div>
									<div class="col-md-3">
										<select class="form-control" id="major" name="major">
											<option value="">과목</option>
											<c:forEach var="rowList" items="${majorList }">
												<option value="${rowList.value }">${rowList.name }</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-md-3">
										<select class="form-control" id="allType" name="allType">
											<option value="">유형</option>
										</select>
									</div>
									<div class="col-md-3">
										<select class="form-control" id="professor" name="professor"></select>
									</div>
									<div class="col-md-3" style="margin-bottom: 10px;'">
										<span class="input-group-btn"><button type="button" class="btn btn-primary" id="search">검색</button></span>
									</div><br><br><br>
									<form id="join-form" name="joinForm" method="post" action="${pageContext.request.contextPath }/user/join">
										<table class="table table-bordered">
											<thead>
												<tr>
													<th>#</th>
													<th>과목 이름</th>
													<th>유형</th>
													<th>시간</th>
													<th>학점</th>
													<th>담당교수</th>
													<th>기타사항</th>
													<th>수강 가능한 인원</th>
													<th>수강하기</th>
												</tr>
											</thead>
											<tbody class="resultList"></tbody>
										</table>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!-- END OVERVIEW -->
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>
		<footer>
			<div class="container-fluid">
				<p class="copyright">Shared by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">BootstrapThemes</a></p>
			</div>
		</footer>
	</div>
	<!-- END WRAPPER -->
	<!-- Javascript -->
	<script src="/assets/vendor/jquery/jquery.min.js"></script>
	<script src="/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="/assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="/assets/scripts/klorofil-common.js"></script>
	<script src="/assets/js/clockTest.js"></script>
</body>
</html>