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
					
					<div style="width:90%;">
						<h2>글쓰기</h2>
						<form name="form" id="form" role="form" method="post" action="/courseEvaluationBoard/write.do">
							<div class="mb-3">
								<label for="title">제목</label>
								<input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요">
							</div>
				
							<div class="mb-3">
								<label for="content">내용</label>
								<textarea class="form-control" rows="10" name="content" id="content" placeholder="내용을 입력해 주세요" ></textarea>
							</div>
							
							<div style="margin-top:50px">
								<button type="submit" class="btn btn-sm btn-primary" id="form">저장</button>
								<button type="button" class="btn btn-sm btn-primary" id="btnList" onclick='location.href="/courseEvaluationBoard/list.do?courseIdx=${courseIdx }"'>목록</button>
							</div>
							<input type="hidden" name="courseIdx" value="${courseIdx }" />
						</form>
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