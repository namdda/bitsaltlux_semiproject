<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포스트 작성</title>
<c:import url="/WEB-INF/include/header.jsp" />
</head>
<body>
	<div id="wrapper">
		<c:import url="/WEB-INF/include/navbar.jsp"/>
		<!-- MAIN -->
		<div class="main">
			<div class="main-content">
				<div class="container" style="text-align: center;">
					<div class="card card-body">
						<h3 class="text-center mb-4">메세지 작성</h3>
						<form id="add" name="add" method="post" action="/message/${sessionScope.userId }/sendProc.do">
							<fieldset>
								<input class="form-control input-lg" name="userTo" value="${toVo.userId }" type="hidden">
								<input class="form-control input-lg" name="userFrom" value="${sessionScope.userId }" type="hidden">
								<input class="form-control input-lg" name="fromName" value="${sessionScope.userNm }" type="hidden">
								<input class="form-control input-lg" name="userId" value="${sessionScope.userId }" type="hidden">
								<div class="form-group">
									<input id="input-title" class="form-control input-lg" placeholder="받는 사람" name="toName" value="${toVo.userName }" type="text" readonly="readonly">
								</div>
								<br/>
								<div class="form-group">
									<textarea id="input-content" class="form-control input-lg" placeholder="내용" name="content" rows="5" cols="86" style="resize:none;"></textarea>
								</div>
								<br/>
								<input id="btn-submit" class="btn btn-lg btn-primary btn-block" value="보내기" type="submit">
							</fieldset>
						</form>
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
		$('#btn-submit').click(function() {
			const title = $("#input-title").val();
			const content = $("#input-content").val();
	
			if (title == '' || content == '') {
				alert("필수항목 미입력 오류입니다.");
				return false;
			}
		});
	</script>
</body>
</html>