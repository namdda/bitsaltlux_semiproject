<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
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
					<h3 class="page-title">PROFESSOR LECTURE LIST</h3>
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
											<th>기타사항</th>
											<th>정원</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="rowList" items="${subjectList }">
											<tr>
												<td>${rowList.rowidx }</td>
												<td>${rowList.name }</td>
												<td>${rowList.allTypeName }</td>
												<td>${rowList.time }</td>
												<td>${rowList.grades }</td>
												<td>${rowList.etc }</td>
												<td>${rowList.cnt }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- END INPUTS -->
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
</body>
</html>