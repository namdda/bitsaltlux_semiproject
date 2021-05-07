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
		<c:import url="/WEB-INF/include/navbar.jsp"/>
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
</body>
</html>
