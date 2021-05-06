<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
<%@ include file="/WEB-INF/include/header.jsp"%>
<script>
$(function(){
	var sccessCall = "${sccessCall }";
	if(sccessCall !== "") alert(sccessCall);
});

function studentSubjectDel(idx, inputId) {
	if(confirm("수강 취소 하시겠습니까??")) {
		var form = document.createElement("form");
		form.setAttribute("method", "post");
		form.setAttribute("action", "/subject/studentSubjectView.do"); //요청 보낼 주소

		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "idx");
		hiddenField.setAttribute("value", idx);
		form.appendChild(hiddenField);

		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "inputId");
		hiddenField.setAttribute("value", inputId);
		form.appendChild(hiddenField);
		document.body.appendChild(form);
		form.submit();
	} else {
		return false;
	}
}
</script>
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
						
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="/main/profile.do?fileName=${userProfile.fullName }" class="img-circle" alt="Avatar" /><span>${userProfile.userNm }</span></a>
							<ul class="dropdown-menu">
								<li><a href="/user/userUpdate.do?inputId=${userProfile.userId }" class="active"><i class="lnr lnr-user"></i> <span>회원 정보</span></a></li>
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
						<li><a href="/main/mainPage.do" class="active"><i class="lnr lnr-home"></i> <span>메인페이지</span></a></li>
						<!--  <li><a href="/user/userUpdate.do?inputId=${userProfile.userId }" class="active"><i class="lnr lnr-pencil"></i><span>회원 정보</span></a></li> -->
						<li>
							<!--  <a href="/subject/subjectView.do?inputId=${userProfile.userId }" class=""><i class="lnr lnr-code"></i> -->
							<c:choose>
								<c:when test="${userProfile.userLevel != 'PRO'}">
									<a href="/subject/studentSubjectView.do?inputId=${userProfile.userId }" class=""><i class="lnr lnr-code"></i>
										<span>수강과목 조회</span>
									</a>
								</c:when>
								<c:otherwise>
									<a href="/subject/proSubjectView.do?inputId=${userProfile.userId }" class=""><i class="lnr lnr-code"></i>
										<span>내 과목 조회</span>
									</a>
								</c:otherwise>
							</c:choose>
							<!-- </a> -->
						</li>
						<c:if test="${userProfile.userLevel == 'PRO'}">
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
					<h3 class="page-title">수강한 항목</h3>
					<div class="row">
						<div class="col-md-12">
							<!-- INPUTS -->
							<div class="panel">
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
											<th>정원</th>
											<th>수강하기</th>
										</tr>
									</thead>
									<tbody class="subjectList">
										<c:forEach var="rowList" items="${subjectList }">
											<tr>
												<td>${rowList.rowidx }</td>
												<td>${rowList.name }</td>
												<td>${rowList.allTypeName }</td>
												<td>${rowList.time }</td>
												<td>${rowList.grades }</td>
												<td>${rowList.inputName }</td>
												<td>${rowList.etc }</td>
												<td>${rowList.cnt }</td>
												<td><button type="button" onclick="studentSubjectDel('${rowList.idx }', '${rowList.userId }');">취소하기</button></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<div class="clearfix"></div>
		<footer>
			<div class="container-fluid">
				<p class="copyright">Shared by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">BootstrapThemes</a>
				</p>
			</div>
		</footer>
	</div>
	<!-- END WRAPPER -->
	<!-- git 올라가는거 확인  -->
</body>
</html>
