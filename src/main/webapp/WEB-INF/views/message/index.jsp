<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블로그 홈</title>
<c:import url="/WEB-INF/include/header.jsp" />
<link rel="stylesheet" href="/assets/new/css/page.css">
</head>
<body>
	<div id="wrapper">
		<c:import url="/WEB-INF/include/navbar.jsp"/>
		<!-- MAIN -->
		<div class="main">
			<div class="main-content">
				<div class="container-fluid">
					<ul class="nav nav-tabs nav-justified">
						<li class="active"><a data-toggle="tab" href="#from">받은 쪽지함</a></li>
						<li><a data-toggle="tab" href="#to">보낸 쪽지함</a></li>
					</ul>

					<div class="tab-content">
						<div id="from" class="tab-pane fade in active">
							<div class="table-responsive">
								<table class="table table-striped">
									<thead>
										<tr>
											<th>no</th>
											<th>보낸 사람</th>
											<th>메세지 내용</th>
											<th>받은 시간</th>
											<th>옵션</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${msgToVo }" var="vo" varStatus="status">
											<tr>
												<td>${fn:length(msgToVo) - status.index }</td>
												<td>${vo.userFrom }</td>
												<td>${vo.content }</td>
												<td>${vo.sendDate }</td>
												<td><a onclick="delMessage(${vo.userId}, ${vo.no })" style="color: red;" role="button">삭제</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div id="to" class="tab-pane fade">
							<div class="table-responsive">
								<table class="table table-striped">
									<thead>
										<tr>
											<th>no</th>
											<th>받는 사람</th>
											<th>메세지 내용</th>
											<th>보낸 시간</th>
											<th>옵션</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${msgFromVo }" var="vo" varStatus="status">
											<tr>
												<td>${fn:length(msgFromVo) - status.index }</td>
												<td>${vo.userTo }</td>
												<td>${vo.content }</td>
												<td>${vo.sendDate }</td>
												<td><a onclick="delMessage(${vo.userId}, ${vo.no })" style="color: red;" role="button">삭제</a></td>
											</tr>
										</c:forEach>
									</tbody>				
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- END OVERVIEW -->
		</div>
	</div>
	<!-- END MAIN CONTENT -->
	<script src="/assets/new/js/jquery/jquery-3.6.0.js"></script>
	<script src="/assets/new/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
	function delMessage(id, no) {
	    var chk = confirm("정말 삭제하시겠습니까?");
	    if (chk) {
	        location.href= id + '/deleteProc.do?result=true&no=' + no;
	    }
	}
	</script>
</body>
</html>