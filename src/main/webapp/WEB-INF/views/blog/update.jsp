<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블로그 생성 페이지</title>
<%@ include file="/WEB-INF/include/header.jsp"%>
</head>
<body>
	<div id="wrapper">
		<c:import url="/WEB-INF/include/navbar.jsp"/>
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid bg-light py-3">
					<div class="col-md-6 col-md-offset-3">
						<h3 class="text-center mb-4">블로그 수정</h3>
						<form id="join" name="join" method="post" action="/blog/${blogVo.userId }/updateProc.do" enctype="multipart/form-data">
							<fieldset>
								<div class="form-group">
									<input class="form-control input-lg" placeholder="아이디" name="userId" type="text" value="${blogVo.userId }" readonly="readonly">
								</div>
								<br/>
								<div class="form-group">
									<input id="b_file_up" class="form-control input-lg" placeholder="블로그 로고" name="file" type="file">
								</div>
								<br/>
								<div class="form-group">
									<textarea class="form-control input-lg" placeholder="블로그 소개" name="intro" rows="5" cols="86" style="resize: none;">${blogVo.intro }</textarea>
								</div>
								<br/> <input id="btn-submit" class="btn btn-lg btn-primary btn-block" value="수정 완료" type="submit">
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>