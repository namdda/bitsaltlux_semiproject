<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>
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
				<div class="col-md-8 blog-main">
					<h1 class="pb-3 mb-4 font-italic border-bottom">${sessionScope.userNm } 블로그</h1>
					<div class="blog-post">
						<h3 class="blog-post-title">${postVo.title }</h3>
						<hr style="width: 60%;">
						<p class="blog-post-meta">${postVo.w_date } by <a href="#"> ${postVo.author }</a>
						</p>
						<br/>
						<p>${fn:replace(postVo.content, newLineChar, "<br/>")}</p>
					</div>
					
					<%-- <c:if test="${postVo.origin_file != null}">
						<hr>
						<div class="like p-2 cursor action-collapse" data-toggle="collapse" href="#attach" role="button" aria-expanded="false" aria-controls="attach">
							첨부파일<span class="fas fa-caret-down" aria-hidden="true"></span> 
						</div>
						<div class="bg-light p-2 collapse" id="attach">
							[<a href="${pageContext.request.contextPath }/upload/${vo.stored_file}" download>${vo.origin_file}</a>]
						</div>
					</c:if> --%>
					<hr>
					<div class="blog-post">
						<c:if test="${sessionScope.userId eq id}">
							<button class="btn btn-danger" onclick="postDel(${no})" style="float: left;">삭제</button>
							<a class="btn btn-primary" href="/blog/${id}/post/view/${no}/updatePage.do" role="button" style="float: right; margin-left: 5px; margin-right: 5px;">수정</a>
						</c:if>
						<a class="btn btn-primary" href="/blog/${id}/post/mainPage.do" role="button" style="float: right; margin-left: 5px;">목록</a>
					</div>
					<br>
					<hr>
				</div>
			</div>
		</div>
	</div>
	<!-- END MAIN CONTENT -->
	<script src="/assets/new/js/jquery/jquery-3.6.0.js"></script>
	<script src="/assets/new/js/bootstrap.bundle.min.js"></script>
</body>
</html>