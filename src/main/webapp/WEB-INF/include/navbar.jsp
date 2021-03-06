<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="brand">
				<a href="/main/mainPage.do"><img src="/assets/img/zxc1.png" class="img-responsive logo" /></a>
			</div>
			<div class="container-fluid">
				<div class="navbar-btn">
					<button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
				</div>
				<div id="navbar-menu">
					<ul class="nav navbar-nav navbar-right">
						<li>					
							<form action="/blog/searchProc.do">						
							<input class="form-control" type="text" name="keyword" placeholder="Search" aria-label="Search" style="margin-top:24px;">				
							</form>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="/assets/img/user.png" class="img-circle" alt="Avatar" style="display: none;"/><span>${sessionScope.userNm }</span></a>
							<ul class="dropdown-menu">
								<li><a href="/user/userUpdate.do?inputId=${sessionScope.userId }" class="active"><i class="lnr lnr-user"></i> <span>회원 정보</span></a></li>
								<li><a href="/message/${sessionScope.userId }/mainPage.do"><i class="lnr lnr-envelope"></i> <span>메세지</span></a></li>
								<li><a href="/blog/${sessionScope.userId }/blogMain.do"><i class="lnr lnr-book"></i> <span>블로그 가기</span></a></li>
								<li><a href="/login/logOut.do"><i class="lnr lnr-exit"></i> <span>Logout</span></a></li>
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
				<li><a href="/main/mainPage.do" class="active"><i
						class="lnr lnr-home"></i> <span>메인페이지</span></a></li>
				<li><a
					href="/user/userUpdate.do?inputId=${sessionScope.userId }"
					class="active"><i class="lnr lnr-pencil"></i><span>회원
							정보</span></a></li>
				<li>
					<a href="#subPages" data-toggle="collapse" class="collapsed"><i class="lnr lnr-file-empty"></i><span> 수강평가</span><i class="icon-submenu lnr lnr-chevron-left"></i></a>
					<div id="subPages" class="collapse">
						<ul class="nav">
							<li><a href="/courseEvaluationMain/hotCourse.do">수강평가 메인</a></li>
							<c:if test="${sessionScope.userLevel == 'PRO' }">
							<li><a href="/courseEvaluationManagement/getCourseList.do">수강평가 과목 관리</a></li>
							</c:if>
						</ul>
					</div>
				</li>
				<li>
					<!--  <a href="/subject/subjectView.do?inputId=${sessionScope.userId }" class=""><i class="lnr lnr-code"></i> -->
					<c:choose>
						<c:when test="${sessionScope.userLevel != 'PRO'}">
							<a
								href="/subject/studentSubjectView.do?inputId=${sessionScope.userId }"
								class=""><i class="lnr lnr-code"></i> <span>수강과목 조회</span>
							</a>
							<a href="/blog/mainPage.do" class=""><i class="lnr lnr-code"></i>
								<span>블로그 홈</span>
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
				<li>
					<a href="/todo/todoView.do" class=""><i class="lnr lnr-list"></i>
						<span>TODO</span>
					</a>
				</li>
			</ul>
		</nav>
	</div>
</div>
<!-- END LEFT SIDEBAR -->