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