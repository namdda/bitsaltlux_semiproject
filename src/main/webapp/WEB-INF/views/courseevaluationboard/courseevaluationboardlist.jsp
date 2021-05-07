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
							<div id="board">
								<form id="search_form" action="/courseEvaluationBoard/list.do" method="post" style="text-align:center">
									<input type="text" id="search1" name="search" value="${search }">
									<input type="hidden" id="search2" name="courseIdx" value="${courseIdx }"> 
									<input type="submit" value="찾기">
								</form>
				
								<table class="table table-striped table-hover" style="margin-top:50px">
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>글쓴이</th>
										<th>조회수</th>
										<th>작성일</th>
										<th>강의명</th>
										<th>&nbsp;</th>
									</tr>
									<c:set var="count" value="${fn:length(list) }" />
									<c:forEach items="${list }" var="vo" varStatus="status">
										<tr>
											<td>${count-status.index }</td>
											<td><a href="/courseEvaluationBoard/view/${vo.boardIdx}.do">
												${vo.title }</a></td>
											<td>${vo.userName }</td>
											<td>${vo.hitCnt }</td>
											<td>${vo.regDate }</td>
											<td>${vo.courseName }</td>
											<%-- <c:choose> 
													<c:when test="${!empty authUser && authUser.no == vo.user_Idx }"> --%>
													<td><a href="/courseEvaluationBoard/delete/${vo.boardIdx}.do?courseIdx=${vo.courseIdx}"	class="del">삭제</a></td>
												<%-- </c:when>
												<c:otherwise>
													<td>&nbsp;</td>
												</c:otherwise>
											</c:choose> --%>
										</tr>
									</c:forEach>
								</table>
				
								<!-- pager 추가 -->
								<!-- 이전페이지/다음페이지를 추가하기 위해서 페이징체크처리 -->
								<!-- 미리 계산한 데이터를 map에 저장해서 내려주기 -->
								<div class="text-center">
									<ul class="pagination">
										<c:if test="${pageVo.nowPage > pageVo.cntPage/2 + 1 }">
											<li><a href="/courseEvaluationBoard/list.do?nowPage=1&search=${search }&courseIdx=${courseIdx }">◀</a></li>
										</c:if>
										<c:forEach begin="${pageVo.firstPageInCurrentPageGroup }" end="${pageVo.lastPageInCurrentPageGroup }" var="i" step="1">
											<c:choose>
												<c:when test="${i == pageVo.nowPage }">
													<li><a href="/courseEvaluationBoard/list.do?nowPage=${i}&search=${search }&courseIdx=${courseIdx }">${i }</a></li>	
												</c:when>
												<c:otherwise>
													<li><a href="/courseEvaluationBoard/list.do?nowPage=${i }&search=${search }&courseIdx=${courseIdx }">${i }</a></li>	
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:if test="${pageVo.lastPage > 5 && pageVo.nowPage != pageVo.lastPage }">
											<li><a href="/courseEvaluationBoard/list.do?nowPage=${pageVo.lastPage}&search=${search }&courseIdx=${courseIdx }">▶</a></li>
										</c:if>
									</ul>
								</div>
								<!-- pager 추가 -->
								<%-- <c:if test="${!empty authUser }"> --%>
									<div class="bottom">
										<button type="button" class="btn btn-sm btn-primary" id="btnList" onclick='location.href="/courseEvaluationBoard/write/${courseIdx}.do"'>글쓰기</button>
									</div>
								<%-- </c:if> --%>
							</div>
						
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