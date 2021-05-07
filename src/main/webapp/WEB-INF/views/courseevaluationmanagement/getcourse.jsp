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
					<form id="form" name="form" method="post">	
						<table class="table table-striped table-hover">
						<tr>
							<th colspan="2" style="text-align:center">등록 강좌 조회</th>
						</tr>
						<tr>
							<td style="padding:20px">카테고리</td>
							<td style="padding:20px">
								${courseVo.COURSE_CATE_NAME }
							</td>
						</tr>
						<tr>
							<td style="padding:20px">강의명</td>
							<td style="padding:20px">
								${courseVo.COURSE_NAME }
							</td>
						</tr>
						<tr>
							<td style="padding:20px">최대수강인원</td>
							<td style="padding:20px">
								${courseVo.PARTICI_NUM }
							</td>
						</tr>
						<tr>
							<td style="padding:20px">강의 설명</td>
							<td style="padding:20px">
								${courseVo.COURSE_DES }
							</td>
						</tr>
						<tr>
							<td style="padding:20px">썸네일 이미지</td>
							<td style="padding:20px">
								<img src="/resources/upload/${courseVo.STORED_FILE_NAME}" style="width:300px; height:400px">
								</td>
							</tr>	
						</table>
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