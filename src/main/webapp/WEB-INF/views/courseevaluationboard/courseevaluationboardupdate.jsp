<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html lang="ko">

<head>
<%@ include file="/WEB-INF/include/header.jsp"%>
</head>


<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="brand">
				<a href="/main/mainPage.do"><img src="/assets/img/logo-dark.png" alt="Klorofil Logo" class="img-responsive logo" /></a>
			</div>
			<div class="container-fluid">
				<div class="navbar-btn">
					<button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
				</div>
				<div id="navbar-menu">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
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
						<li><a href="/main/mainPage.do" class="active"><i class="lnr lnr-home"></i> <span>메인페이지</span></a></li>
						<li><a href="/user/userUpdate.do?inputId=${sessionScope.userId }" class="active"><i class="lnr lnr-pencil"></i><span>회원 정보</span></a></li>
						<li>
							<!--  <a href="/subject/subjectView.do?inputId=${sessionScope.userId }" class=""><i class="lnr lnr-code"></i> -->
							<c:choose>
								<c:when test="${sessionScope.userLevel != 'PRO'}">
									<a href="/subject/studentSubjectView.do?inputId=${sessionScope.userId }" class=""><i class="lnr lnr-code"></i>
										<span>수강과목 조회</span>
									</a>
								</c:when>
								<c:otherwise>
									<a href="/subject/proSubjectView.do?inputId=${sessionScope.userId }" class=""><i class="lnr lnr-code"></i>
										<span>내 과목 조회</span>
									</a>
								</c:otherwise>
							</c:choose>
							<!-- </a> -->
						</li>
						<c:if test="${sessionScope.userLevel == 'PRO'}">
							<li style="display: none;">
								<a href="#subPages" data-toggle="collapse" class="collapsed"><i class="lnr lnr-file-empty"></i><span> 과목</span><i class="icon-submenu lnr lnr-chevron-left"></i></a>
								<div id="subPages" class="collapse">
									<ul class="nav">
										<li><a href="/subject/subjectView.do">과목 등록</a></li>
										<li><a href="page-login.html">과목 수정</a></li>
									</ul>
								</div>
							</li>
						</c:if>
						<c:import url='/WEB-INF/include/courseevaluationbar.jsp' />
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
					<!-- Sidebar/menu -->
					<c:import url='/WEB-INF/include/coursecategorybar.jsp' />
					
					<div class="w3-main" style="margin-left:150px">
					
					
					
					<form id="form" method="post" action="/courseEvaluationBoard/update/${courseEvaluationBoardVo.boardIdx}.do">
						<table class="table table-striped table-hover">
							<tr>
								<th colspan="2" style="text-align:center">글수정</th>
							</tr>
							<tr>
								<td style="padding:20px">제목</td>
								<td style="padding:20px"><input type="text" name="title" value="${courseEvaluationBoardVo.title }"></td>
							</tr>
							<tr>
								<td style="padding:20px">내용</td>
								<td style="padding:20px">
									<textarea id="content" name="content">${courseEvaluationBoardVo.content }</textarea>
								</td>
							</tr>
						</table>
						<div class="bottom">
							<button type="submit" class="btn btn-sm btn-primary" id="form">수정</button>
							<button type="button" class="btn btn-sm btn-primary" id="btnList" onclick='location.href="/courseEvaluationBoard/view/${courseEvaluationBoardVo.boardIdx}.do"'>취소</button>
						</div>
						<input type="hidden" id="courseIdx" name="courseIdx" value="${courseEvaluationBoardVo.courseIdx }">
					</form>				
					
					
				 	 <!-- End page content -->
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
	<!-- <script src="/assets/js/clockTest.js"></script> -->

</body>
</html>