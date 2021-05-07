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
					
						<div style="width:90%; margin-top:50px">
								<table class="table table-striped table-hover">
									<tr>
										<th colspan="2" style="text-align:center">글보기</th>
									</tr>
									<tr>
										<td style="padding:20px">제목</td>
										<td style="padding:20px">${courseEvaluationBoardVo.title }</td>
									</tr>
									<tr>
										<td style="padding:20px">내용</td>
										<td style="padding:20px">${courseEvaluationBoardVo.content }</td>
									</tr>
								</table>
								<div style="margin-top:30px">
									<%-- <c:if test="${!empty authUser && authUser.no == boardVo.userNo }"> --%>
										<button type="button" class="btn btn-sm btn-primary" id="btnList" onclick='location.href="/courseEvaluationBoard/list.do?courseIdx=${courseEvaluationBoardVo.courseIdx}"'>글목록</button>
										<button type="button" class="btn btn-sm btn-primary" id="btnList" onclick='location.href="/courseEvaluationBoard/update/${courseEvaluationBoardVo.boardIdx}.do"'>글수정</button>					
									<%-- </c:if> --%>
								</div>
								<input type="hidden" id="courseIdx" name="courseIdx" value="${courseEvaluationBoardVo.courseIdx }">
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