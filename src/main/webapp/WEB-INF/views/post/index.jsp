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
<%@ include file="/WEB-INF/include/header.jsp"%>
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
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="jumbotron p-3 p-md-5 text-white rounded bg-dark">
					<div class="col-md-6 px-0">
						<h1 class="display-4 font-italic"></h1>
						<p class="lead my-3"></p>
					</div>
					<div class="col-md-12">
						<c:if test="${authUser.id eq id }">
							<p style="text-align: right;">
								<a class="btn btn-primary"
									href="blog/${id }/post/add">포스트
									작성</a>
							</p>
						</c:if>
					</div>
				</div>

				<div class="row-fluid" align="center" style="margin-top: 20px;">
					<c:forEach items="${postVo }" var="vo" varStatus="status">
						<div class="col-md-8">
							<div class="card flex-md-row mb-4 box-shadow h-md-250">
								<div class="card-body d-flex flex-column align-items-start">
									<div class="col-md-12">
										<strong class="d-inline-block mb-2 text-primary"
											style="float: left;">Post</strong>
									</div>
									<h3 class="mb-0">
										<a class="text-dark"
											href="${pageContext.request.contextPath }/${vo.blog_id }/post/view/${vo.no }"
											style="text-decoration: underline;">${vo.title }</a>
									</h3>
									<div class="mb-1 text-muted">${vo.w_date }</div>
									<p
										style="white-space: nowrap; overflow: hidden; max-width: 800px; text-overflow: ellipsis;"
										class="card-text mb-auto">${vo.content }</p>
									<a
										href="${pageContext.request.contextPath }/${id }/post/view/${vo.no }">자세히
										보기</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>