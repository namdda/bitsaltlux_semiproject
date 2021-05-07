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
		<c:import url="/WEB-INF/include/navbar.jsp"/>
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<!-- OVERVIEW -->
					<!-- Sidebar/menu -->
					<c:import url='/WEB-INF/include/coursecategorybar.jsp' />
					<div class="w3-main" style="margin-left:150px">
						<table class="table table-striped table-hover" >
								<thead>
									<tr>
										<th>썸네일</th>
										<th>강의명</th>
										<th>카테고리</th>
										<th>최대수강인원</th>
										<th>강의 설명</th>
										<th>등록날짜</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="list">
									<tr>
										<td id='img'>
											<img src="/resources/upload/${list.STORED_FILE_NAME}" style="width:300px; height:400px"> 
										</td>
										<td>
											<a href="/courseEvaluationManagement/courseViewDetail/${list.COURSE_IDX}.do">${list.COURSE_NAME}</a>
										</td>
										<td>
											${list.COURSE_CATE_NAME}
										</td>
										<td>${list.PARTICI_NUM}</td>
										<td>${list.COURSE_DES}</td>
										<td>
											<fmt:formatDate value="${list.REG_DATE}" pattern="yyyy-MM-dd" />
										</td>
									</tr>			
									</c:forEach>
								</tbody>
							</table>
					  <!-- End page content -->
					  </div>
					<a href="/courseEvaluationManagement/addCourse.do" class="btn btn-sm btn-primary" id="addbtn" style="float:right">등록</a>
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