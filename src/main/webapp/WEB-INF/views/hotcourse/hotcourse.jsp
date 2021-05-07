<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html lang="ko">

<head>
<%@ include file="/WEB-INF/include/header.jsp"%>
<style>
.jb-wrap {
	width: 40%;
	margin: 10px auto;
	float: left;
	margin-right: 50px
}
.jb-wrap img {
	width: 100%;
	vertical-align: middle;
}
.jb-text {
	padding: 5px 10px;
	text-align: center;
	font-size: 20px;
}
</style>
</head>

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<c:import url="/WEB-INF/include/navbar.jsp"/>
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<!-- OVERVIEW -->
					<!-- Sidebar/menu -->
					<c:import url='/WEB-INF/include/coursecategorybar.jsp' />
					
					
					<!-- !PAGE CONTENT! -->
					<div class="w3-main" style="margin-left:150px">
					
					  <!-- Image header -->
					  <c:if test="${not empty list}">
						  <div style="margin-left:100px; margin-bottom:50px;">
							<div class="jb-image">
								<a href="/courseEvaluationBoard/list.do?courseIdx=${list[0].COURSE_IDX}">
								<img src="/assets/upload/${list[0].STORED_FILE_NAME}" alt="${list[0].COURSE_NAME }" style="width:70%">
								</a>
							</div>
							<div class="jb-text" style="width:70%">
								<p>Best Course</p>
								<p>${list[0].COURSE_NAME }</p>
								<p>최대수강인원 : ${list[0].PARTICI_NUM }</p>
							</div>
						  </div>
					  </c:if>
					
					  <!-- Product grid -->
					  <c:forEach items="${list }" begin="1" var="courseVo" varStatus="status">
						<div class="jb-wrap">
							<div class="jb-image">
								<a href="/courseEvaluationBoard/list.do?courseIdx=${courseVo.COURSE_IDX}">
								<img src="/assets/upload/${courseVo.STORED_FILE_NAME}" style="width:100%">
								</a>
							</div>
							<div class="jb-text">
								<p>강의명 : ${courseVo.COURSE_NAME }</p>
								<p>최대수강인원 : ${courseVo.PARTICI_NUM }</p>
							</div>
						</div>
					  </c:forEach>
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