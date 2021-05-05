<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포스트 작성</title>
<c:import url="/WEB-INF/include/header.jsp" />
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
				<div class="container" style="text-align: center;">
					<div class="card card-body">
						<h3 class="text-center mb-4">포스트 작성</h3>
						<form id="add" name="add" method="post" action="/blog/${id }/post/addProc.do" enctype="multipart/form-data">
							<fieldset>
								<div class="form-group">
									<input id="input-title" class="form-control input-lg" placeholder="제목" name="title" type="text">
								</div>
								<br/>
								<div class="form-group">
									<input class="form-control input-lg" placeholder="작성자" name="author" value="${sessionScope.userNm }" type="text" readonly="readonly">
								</div>
								<br/>
								<div class="form-group">
									<textarea id="input-content" class="form-control input-lg" placeholder="내용" name="content" rows="5" cols="86" style="resize:none;"></textarea>
								</div>
								<br/>
								<div class="form-group">
									<input class="form-control input-lg" placeholder="아이디" name="blog_id" value="${id }" type="text" readonly="readonly">
								</div>
								<br/>
								<div class="form-group">
									<input class="form-control input-lg" placeholder="첨부파일" name="file" type="file">
								</div>
								<br/>
								<input id="btn-submit" class="btn btn-lg btn-primary btn-block" value="작성하기" type="submit">
							</fieldset>
						</form>
					</div>
				</div>
			</div>
			<!-- END OVERVIEW -->
		</div>
	</div>
	<!-- END MAIN CONTENT -->
	<script src="/assets/new/js/jquery/jquery-3.6.0.js"></script>
	<script src="/assets/new/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
		$('#btn-submit').click(function() {
			const title = $("#input-title").val();
			const content = $("#input-content").val();
	
			if (title == '' || content == '') {
				alert("필수항목 미입력 오류입니다.");
				return false;
			}
		});
	</script>
</body>
</html>