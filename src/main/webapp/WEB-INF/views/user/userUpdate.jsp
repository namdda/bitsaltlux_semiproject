<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html lang="en">
<head>
	<title>MEMBER-JOIN | Klorofil - Free Bootstrap Dashboard Template</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="/assets/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/assets/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="/assets/vendor/linearicons/style.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="/assets/css/main.css">
	<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
	<link rel="stylesheet" href="/assets/css/demo.css">
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="/assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="/assets/img/favicon.png">

	<script src="/assets/js/jquery/jquery-3.6.0.js" type="text/javascript"></script>
<script>
$(function(){
	$("#btn-check").click(function(){
		const inputId = $("#inputId").val();
		if(inputId == '') return false;
		$.ajax({
			url: "/user/existid.do",
			type : "post",
			data: {"inputId" : inputId},
			dataType: 'text',
			success: function(response){
				if(response == 'success'){
					$("#imgCheck").show();
					$("#imgCheck").attr("disabled","disabled");
					$("#inputId").attr("readonly","readonly");
				} else {
					$("#imgCheck").hide();
					alert('이미 존재하는 학번입니다. 다른 학번을 사용해 주세요');
					$("#inputId").val('').focus();
				}
			},
			error: function(xhr, status, e){
				console.error(status + ":" + e);
			}
		});
	});
});
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
					<h3 class="page-title">Member Info View &Update</h3>
					<div class="row">
						<div class="col-md-9">
							<!-- INPUTS -->
							<div class="panel">
								<form method="post" name="frm" action="/user/updateProc.do">
									<div class="panel-body">
										<input type="hidden" id="no" name="no" value="${resutl.no }">
										<div style="margin-bottom:10px;height: 40px;">
											<span style="float:left; margin: 5px 7px 0 0;">이름 : </span>
											<input type="text" id="inputName" name="inputName" class="form-control" value="${resutl.inputName}" style="width:90%;float:left;" />
										</div>
										<div style="margin-bottom:10px;height: 40px;">
											<span style="float:left; margin: 5px 10px 0 0;">학교: </span>
											<input type="text" id="inputSchool" name="inputSchool" class="form-control" value="${resutl.inputSchool}" style="width:90%;float:left;" />
										</div>
										<div style="margin-bottom:10px;height: 40px;">
											<span style="float:left; margin: 5px 10px 0 0;">학번: </span>
											<input type="text" id="inputId" name="inputId" class="form-control" value="${resutl.inputId}" style="width:70%;float:left;margin-right: 10px;" readonly="true" />&nbsp;&nbsp;
											<img id="imgCheck" style="width:30px; display:none; float:left; margin-left:10px;" src="/assets/img/check.png" />
										</div>

										<c:if test="${resutl.level == 'STUDENT'}">
											<div style="margin-bottom:10px;height: 40px;">
												<span style="float:left; margin: 5px 10px 0 0;">전공: </span>
												<select class="form-control" name="inputMajor" style="margin-bottom:10px;width:70%;margin-right: 10px;">
													<option value="">과목</option>
													<option value="kor" <c:if test="${resutl.inputMajor == 'kor'}">selected="selected"</c:if>>국어</option>
													<option value="eng" <c:if test="${resutl.inputMajor == 'eng'}">selected="selected"</c:if>>영어</option>
													<option value="mat" <c:if test="${resutl.inputMajor == 'mat'}">selected="selected"</c:if>>수학</option>
													<option value="sci" <c:if test="${resutl.inputMajor == 'sci'}">selected="selected"</c:if>>과학</option>
													<option value="spt" <c:if test="${resutl.inputMajor == 'spt'}">selected="selected"</c:if>>체육</option>
													<option value="art" <c:if test="${resutl.inputMajor == 'art'}">selected="selected"</c:if>>미술</option>
													<option value="com" <c:if test="${resutl.inputMajor == 'com'}">selected="selected"</c:if>>컴퓨터</option>
													<option value="etc" <c:if test="${resutl.inputMajor == 'etc'}">selected="selected"</c:if>>기타</option>
												</select>
											</div>
										</c:if>
										<c:if test="${resutl.level == 'PRO'}">
											<div style=" margin-bottom:10px;height: 40px;">
												<span style="float:left; margin: 5px 10px 0 0;">전공: </span>
												<select class="form-control" name="subjects" style="margin-bottom:10px;width:70%;margin-right: 10px;">
													<option value="">과목</option>
													<option value="kor" <c:if test="${resutl.subjects == 'kor'}">selected="selected"</c:if>>국어</option>
													<option value="eng" <c:if test="${resutl.subjects == 'eng'}">selected="selected"</c:if>>영어</option>
													<option value="mat" <c:if test="${resutl.subjects == 'mat'}">selected="selected"</c:if>>수학</option>
													<option value="sci" <c:if test="${resutl.subjects == 'sci'}">selected="selected"</c:if>>과학</option>
													<option value="spt" <c:if test="${resutl.subjects == 'spt'}">selected="selected"</c:if>>체육</option>
													<option value="art" <c:if test="${resutl.subjects == 'art'}">selected="selected"</c:if>>미술</option>
													<option value="com" <c:if test="${resutl.subjects == 'com'}">selected="selected"</c:if>>컴퓨터</option>
													<option value="etc" <c:if test="${resutl.subjects == 'etc'}">selected="selected"</c:if>>기타</option>
												</select>
											</div>
										</c:if>
										<div style="margin-bottom:10px;height: 40px;">
											<span style="float:left; margin: 5px 10px 0 0;">비밀번호: </span>
											<input type="password" class="form-control" id="userPw" name="userPw" value="${resutl.userPw}" style="width:70%;float: left;" />
										</div>
										<button class="btn btn-success" type="submit">수정하기</button>
										<button class="btn btn-default" type="button" onclick="history.back();">뒤로 	가기</button>
										<button  id="btn-remove" class="btn btn-danger" type="button">탈퇴하기</button>
										<input type="hidden" name="level" value="${resutl.level }" />
									</div>
								</form>
							</div>
							<script>
								//삭제 버튼 누르면 삭제할 것이냐고 묻고 삭제한다고 하면 주소이동(BoardController의 remove 메소드 호출)
								$(function(){
									$('#btn-remove').click(function(){
										var obj = document.frm;
										obj.action = "/user/deleteProc.do";
										obj.submit();
									});
								});
							</script>
							<!-- END INPUTS -->

						</div>
					</div>
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
	<!-- Javascript -->
	<script src="/assets/vendor/jquery/jquery.min.js"></script>
	<script src="/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="/assets/scripts/klorofil-common.js"></script>
</body>

</html>