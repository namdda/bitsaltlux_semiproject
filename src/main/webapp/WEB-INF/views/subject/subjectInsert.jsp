<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
	<title>Elements | Klorofil - Free Bootstrap Dashboard Template</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/vendor/linearicons/style.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="assets/css/main.css">
	<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
	<link rel="stylesheet" href="assets/css/demo.css">
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
	
	<script src="assets/js/jquery/jquery-3.6.0.js" type="text/javascript"></script>
<script>
$(function(){
	$("#input_id").change(function(){
		$('#img-check').hide();
		$('#btn-check').show();
	});
	
	$("#btn-check").click(function(){
		const email = $("#input-email").val();
		if(email == ''){
			return;
		}
		$.ajax({
			url: "/semiproject/api/user/existid?id=" + id,
			async: true,
			data: '',
			dataType: 'json',
			success: function(response){
				if(response.result != 'success'){
					console.error(response.message);
					return;
				}
				
				if(response.data == true){
					alert('이미 존재하는 이메일입니다. 다른 이메일을 사용해 주세요');
					$("#input-email")
						.val('')
						.focus();
					return;
				}
				
				$('#img-check').show();
				$('#btn-check').hide();
			},
			error: function(xhr, status, e){
				console.error(status + ":" + e);
			}
		});
	});
})

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
					<h3 class="page-title">Member join</h3>
					<div class="row">
						<div class="col-md-9">
							<!-- INPUTS -->
							<div class="panel">
								<form id="join-form" name="joinForm" method="post" action="${pageContext.request.contextPath }/user/update">
									<div class="panel-body">
										과목 번호 : <input type="text" id="input_name" class="form-control" placeholder="이름">
										<br>
										과목 이름: <input type="text" id="input_school" class="form-control" placeholder="학교">
										<br>
										유형: <input type="text" id="input_id" class="form-control" placeholder="학번">
										<br>
										시간 1: <input type="text" id="input_id" class="form-control" placeholder="학번">
										<br>
										시간 2: <input type="text" id="input_id" class="form-control" placeholder="학번">
										<br>
										학점: <input type="text" id="input_id" class="form-control" placeholder="학번">
										<br>
										담당교수: <input type="text" id="input_id" class="form-control" placeholder="학번">
										<br>
										기타사항: <input type="text" id="input_id" class="form-control" placeholder="학번">

										<br>
										정원: <input type="text" id="input_major" class="form-control" placeholder="학교">
										<br>
							
										
									
										
										<button class="btn btn-success" type="submit">등록하기</button>
										 <button class="btn btn-default" onclick="history.back()">뒤로 가기</button>
									</div>
								</form>
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
	<!-- Javascript -->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="assets/scripts/klorofil-common.js"></script>
</body>

</html>
