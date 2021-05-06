<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블로그 홈</title>
<c:import url="/WEB-INF/include/header.jsp" />
<!-- <link rel="stylesheet" href="/assets/new/css/bootstrap.min.css"> -->
</head>
<body>
	<div id="wrapper">
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="brand">
				<a href="/main/mainPage.do"><img src="/assets/img/logo-dark.png"
					alt="Klorofil Logo" class="img-responsive logo" /></a>
			</div>
			<div class="container-fluid">
				<div class="navbar-btn">
					<button type="button" class="btn-toggle-fullwidth">
						<i class="lnr lnr-arrow-left-circle"></i>
					</button>
				</div>
				<div id="navbar-menu">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"></li>
						<li><a href="/login/logOut.do" class="dropdown-toggle"><span>logout</span></a>
						</li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><img src="/assets/img/user.png"
								class="img-circle" alt="Avatar" style="display: none;" /><span>${sessionScope.userNm }</span></a>
							<ul class="dropdown-menu">
								<li><a href="#"><i class="lnr lnr-user"></i> <span>My
											Profile</span></a></li>
								<li><a href="#"><i class="lnr lnr-envelope"></i> <span>Message</span></a></li>
								<li><a href="/blog/${sessionScope.userId }/blogMain.do"><i
										class="lnr lnr-cog"></i> <span>블로그 가기</span></a></li>
								<li><a href="#"><i class="lnr lnr-exit"></i> <span>Logout</span></a></li>
							</ul></li>
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
						<li><a href="/main/mainPage.do" class="active"><i
								class="lnr lnr-home"></i> <span>메인페이지</span></a></li>
						<li><a
							href="/user/userUpdate.do?inputId=${sessionScope.userId }"
							class="active"><i class="lnr lnr-pencil"></i><span>회원
									정보</span></a></li>
						<li>
							<!--  <a href="/subject/subjectView.do?inputId=${sessionScope.userId }" class=""><i class="lnr lnr-code"></i> -->
							<c:choose>
								<c:when test="${sessionScope.userLevel != 'PRO'}">
									<a
										href="/subject/studentSubjectView.do?inputId=${sessionScope.userId }"
										class=""><i class="lnr lnr-code"></i> <span>수강과목 조회</span>
									</a>
								</c:when>
								<c:otherwise>
									<a
										href="/subject/proSubjectView.do?inputId=${sessionScope.userId }"
										class=""><i class="lnr lnr-code"></i> <span>내 과목 조회</span>
									</a>
								</c:otherwise>
							</c:choose> <!-- </a> -->
						</li>
						<c:if test="${sessionScope.userLevel == 'PRO'}">
							<li style="display: none;"><a href="#subPages"
								data-toggle="collapse" class="collapsed"><i
									class="lnr lnr-file-empty"></i><span> 과목</span><i
									class="icon-submenu lnr lnr-chevron-left"></i></a>
								<div id="subPages" class="collapse">
									<ul class="nav">
										<li><a href="/subject/subjectView.do">과목 등록</a></li>
										<li><a href="page-login.html">과목 수정</a></li>
									</ul>
								</div></li>
						</c:if>
					</ul>
				</nav>
			</div>
		</div>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">
			<div class="main-content">
				<div class="container-fluid">
					<!-- OVERVIEW -->
					<div class="jumbotron p-3 p-md-5 text-white rounded" style="background-color: black;">
						<h1 class="display-4 font-italic" style="color: white;">${sessionScope.userNm } 블로그</h1>
						<p class="lead my-3" style="color: silver;">${blogVo.intro }</p>
						<div class="col-md-12">
							<c:if test="${sessionScope.userId eq id }">
								<p style="text-align: right;">
									<a class="btn btn-primary" href="/blog/${sessionScope.userId }/post/addProc.do">포스트 작성</a>
								</p>
							</c:if>
						</div>
					</div>
					
					<div class="row" style="margin-top: 20px;">
						<c:forEach items="${postVo }" var="vo" varStatus="status">
							<div class="col-md-6 col-md-offset-3" style="margin-bottom: 10px;">
								<hr style="height: 2px; background: #ccc;">
								<div class="card flex-md-row mb-4 box-shadow h-md-250">
									<div class="card-body">
										<div class="col-md-12" >
											<strong class="d-inline-block mb-2 text-primary" style="float:left;">Post</strong>
										</div>
										<h3 class="card-title">
											<a class="text-dark" href="/blog/${id }/post/${vo.no }/viewPage.do" style="text-decoration: underline;">${vo.title }</a>
										</h3>
										<div class="mb-1 text-muted">${vo.wDate }</div>
										<p style="white-space: nowrap; overflow: hidden; max-width: 800px; text-overflow: ellipsis; " class="card-text mb-auto">${vo.content }</p>
										<a href="/blog/${id }/post/${vo.no }/viewPage.do">자세히 보기</a>
									</div>
								</div>
								<hr style="height: 2px; background: #ccc;">
							</div>
						</c:forEach>
					</div>
					
					<hr style="height: 1px; background: #ccc; margin-top: 40px;">
					<c:if test="${sessionScope.userId eq blogVo.userId }">
						<button class="btn btn-danger" onclick="blogDel()">블로그 삭제</button>
						<a href="/blog/${blogVo.userId }/update.do" style="float: right;"><button class="btn btn-primary">블로그 수정</button></a>
					</c:if>
				</div>
			</div>
			<!-- END OVERVIEW -->
		</div>
	</div>
	<!-- END MAIN CONTENT -->
	<script src="/assets/new/js/jquery/jquery-3.6.0.js"></script>
	<script src="/assets/new/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
		function blogDel() {
		    var chk = confirm("정말 삭제하시겠습니까?");
		    if (chk) {
		        location.href= 'delete.do?result=true';
		    }
		}
	</script>
</body>
</html>