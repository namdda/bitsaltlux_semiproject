<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html lang="ko">

<head>
<%@ include file="/WEB-INF/include/header.jsp"%>
<style>
.mainClock {
	height: 30px;
	margin-top: 30px;
	font-size : 25px;
	float: right;
}
</style>
</head>
<script>
$(function(){
printClock();
//var trying = new Date();
//var child = document.getElementById("helpme");
//if (trying.getHours() ==2)
//	console.log(child.id);
//	$("#"+child.id).remove();

//var elements = element.getElementsByClassName('edu edu_15');

	
$.ajax({
	url: "/education/joinEducationList.do",
	type : "post",
	dataType: 'JSON',
	success: function(data) {
		for(var i=0; i<data.length; i++) {
			$(".edu_"+data[i].firstSubject).text(data[i].name);
			$(".edu_"+data[i].firstSubject).css("backgroundColor","#dff0d8");
			$(".edu_"+data[i].secondSubject).text(data[i].name);
			$(".edu_"+data[i].secondSubject).css("backgroundColor","#f2dede");
		}
	},
	error: function(xhr, status, e){
		console.error(status + ":" + e);
	}
});

$("#major").on("change", function(){
	$("#allType").find('option').remove();
	$("#professor").find('option').remove();
	$("#allType").append("<option value=''>유형</option>");
	$.ajax({
		url: "/main/allTypeList.do",
		type : "post",
		data: {"value" : $("#major").val()},
		dataType: 'JSON',
		success: function(data) {
			var objSel = $("#allType")[0];
			for(var x=objSel.length-1; 1<=x; x--) {
				objSel.options[x] = null;
			}
			for(var i=0; i<data.length; i++) {
				var objOption = document.createElement("option");
				objOption.value = data[i].value;
				objOption.className = data[i].type;
				objOption.text = data[i].allTypeName;
				objSel.options.add(objOption);
			}
		},
		error: function(xhr, status, e){
			console.error(status + ":" + e);
		}
	});
});

$("#allType").on("change", function(){
	$("#professor").find('option').remove();
	$.ajax({
		url: "/main/professorList.do",
		type : "post",
		data: {"value" : $("#allType").val()},
		dataType: 'JSON',
		success: function(data) {
			var objSel = $("#professor")[0];
			for(var x=objSel.length-1; 1<=x; x--) {
				objSel.options[x] = null;
			}
			for(var i=0; i<data.length; i++) {
				var objOption = document.createElement("option");
				objOption.value = data[i].inputId;
				objOption.text = data[i].inputName;
				objSel.options.add(objOption);
			}
		},
		error: function(xhr, status, e){
			console.error(status + ":" + e);
		}
	});
});

$("#search").on("click", function(){
	$.ajax({
		url: "/education/searchEducationList.do",
		type : "post",
		data: {"inputId" : $("#professor").val(), "type" : $("#allType option:selected").attr("class")},
		dataType: 'JSON',
		success: function(data) {
			$("#resultList").html("");
			for(var i=0; i<data.length; i++) {
				$("#resultList").append("<tr><td>"+data[i].idx+"</td>"
						+"<td>"+data[i].name+"</td>"
						+"<td>"+data[i].allTypeName+"</td>"
						+"<td>"+data[i].time+"</td>"
						+"<td>"+data[i].grades+"</td>"
						+"<td>"+data[i].inputName+"</td>"
						+"<td>"+data[i].etc+"</td>"
						+"<td>"+data[i].cnt+"</td>"
						+"<td><button type='button' class='btn_"+i+"' onclick='joinEducations(\""+data[i].firstSubject+"\", \""+data[i].secondSubject+"\");'>수강하기</button></td></tr>");
				if(data[i].cnt == 0) {
					$(".btn_"+i).hide();
				}
			}
		},
		error: function(xhr, status, e){
			console.error(status + ":" + e);
		}
	});
}
);
});

function joinEducations(idx1, idx2) {
	if(confirm("수강 신청 하시겠습니까??")) {
		$.ajax({
			url: "/education/checkEducation.do",
			data: {"idx1" : idx1, "idx2" : idx2},
			type : "post",
			dataType: 'text',
			success: function(data) {
				if(data === "ok") {
					$.ajax({
						url: "/education/joinEducation.do",
						type : "post",
						data: {"idx1" : idx1, "idx2" : idx2},
						dataType: 'JSON',
						success: function(data) {
							$("#search").trigger("click");
							$(".edu").text("");
							$(".edu").css("backgroundColor","#0000");
							for(var i=0; i<data.length; i++) {
								$(".edu_"+data[i].firstSubject).text(data[i].name);
								$(".edu_"+data[i].firstSubject).css("backgroundColor","#dff0d8");
								$(".edu_"+data[i].secondSubject).text(data[i].name);
								$(".edu_"+data[i].secondSubject).css("backgroundColor","#f2dede");
							}
							alert("정상 신청되셨습니다.");
						},
						error: function(xhr, status, e){
							console.error(status + ":" + e);
						}
					});
				} else {
					alert("시간이 겹칩니다");
					return false;
				}
			},
			error: function(xhr, status, e){
				console.error(status + ":" + e);
			}
		});
	} else {
		return false;
	}
}


//현재 시간 보여주기
function printClock() {
	var clock = document.getElementById("clocks");				// 출력할 div id 선택
	var currentDate = new Date();								// 현재시간
	//var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
	var amPm = 'AM';											// 초기값 AM
	var amKorPm = '오전';											// 초기값 오전
	amKorPm = '<span style="color:#f109f3;">'+amKorPm+'</span>'

	var currentYears = addZeros(currentDate.getFullYear(), 2);
	var currentMonth = currentDate.getMonth()+1;
	var currentDay = currentDate.getDate();
	var currentHangul = currentDate.getDay();
	var currentHours = addZeros(currentDate.getHours(), 2);
	var currentMinute = addZeros(currentDate.getMinutes(), 2);
	var currentSeconds =  addZeros(currentDate.getSeconds(), 2);
	var week = new Array('일', '월', '화', '수', '목', '금', '토');

	if(currentHours >= 12) { 							// 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
		amPm = 'PM';
		amKorPm = '오후';
		amKorPm = '<span style="color:#15acf7;">'+amKorPm+'</span>'
		currentHours = addZeros(currentHours-12, 2);
	}

	if(currentSeconds >= 50) {							// 50초 이상일 때 색을 변환해 준다.
		currentSeconds = '<span style="color:#de1951;">'+currentSeconds+'</span>';
	}
	if(currentSeconds >= 40) {							// 50초 이상일 때 색을 변환해 준다.
		currentSeconds = '<span style="color:#43c1bb;">'+currentSeconds+'</span>';
	}
	if(currentSeconds >= 30) {							// 50초 이상일 때 색을 변환해 준다.
		currentSeconds = '<span style="color:#c1b525;">'+currentSeconds+'</span>';
	}
	if(currentSeconds >= 20) {							// 50초 이상일 때 색을 변환해 준다.
		currentSeconds = '<span style="color:#81ea98;">'+currentSeconds+'</span>';
	}
	if(currentSeconds >= 10) {							// 50초 이상일 때 색을 변환해 준다.
		currentSeconds = '<span style="color:#33bfce;">'+currentSeconds+'</span>';
	}

	clock.innerHTML = currentYears + "년    " + currentMonth + "월   " + currentDay + "일 &nbsp;&nbsp;"+ amKorPm + "&nbsp" + currentHours + ":"
					  + currentMinute + ":" +currentSeconds + " <span style='font-size:20px;'>" + amPm +"&nbsp;"+ week[currentHangul] + "요일   " +"</span>"; //날짜를 출력해 줌
	setTimeout("printClock()",1000);					// 1초마다 printClock() 함수 호출
}

function addZeros(num, digit) { // 자릿수 맞춰주기
	var zero = '';
	num = num.toString();
	if (num.length < digit) {
		for (i=0; i<digit-num.length; i++) {
			zero += '0';
		}
	}
	return zero + num;
}
</script>

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="brand">
				<a href="/main/mainPage.do"><img src="/assets/img/logo-dark.png" alt="Klorofil Logo" class="img-responsive logo" /></a>
			</div>
			<div class="container-fluid">
				<div class="navbar-btn">
					<button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
				</div>
				<div id="navbar-menu">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
						</li>
						<li>
							<a href="/login/logOut.do" class="dropdown-toggle"><span>logout</span></a>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="/assets/img/user.png" class="img-circle" alt="Avatar" style="display: none;"/><span>${sessionScope.userNm }</span></a>
							<ul class="dropdown-menu">
								<li><a href="#"><i class="lnr lnr-user"></i> <span>My Profile</span></a></li>
								<li><a href="#"><i class="lnr lnr-envelope"></i> <span>Message</span></a></li>
								<li><a href="/blog/${sessionScope.userId }/blogMain.do"><i class="lnr lnr-cog"></i> <span>블로그 가기</span></a></li>
								<li><a href="#"><i class="lnr lnr-exit"></i> <span>Logout</span></a></li>
							</ul>
						</li>
						<!-- <li>
							<a class="update-pro" href="https://www.themeineed.com/downloads/klorofil-pro-bootstrap-admin-dashboard-template/?utm_source=klorofil&utm_medium=template&utm_campaign=KlorofilPro" title="Upgrade to Pro" target="_blank"><i class="fa fa-rocket"></i> <span>UPGRADE TO PRO</span></a>
						</li> -->
					</ul>
				</div>
			</div>
		</nav>
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<nav>
					<ul class="nav">
						<li><a href="/main/mainPage.do" class="active"><i class="lnr lnr-home"></i> <span>메인페이지</span></a></li>
						<li><a href="/user/userUpdate.do?inputId=${sessionScope.userId }" class="active"><i class="lnr lnr-pencil"></i><span>회원 정보</span></a></li>
						<li>
							<!--  <a href="/subject/subjectView.do?inputId=${sessionScope.userId }" class=""><i class="lnr lnr-code"></i> -->
							<c:choose>
								<c:when test="${sessionScope.userLevel != 'PRO'}">
									<a href="/subject/studentSubjectView.do?inputId=${sessionScope.userId }" class=""><i class="lnr lnr-code"></i>
										<span>수강과목 조회</span>
									</a>
									<a href="/blog/mainPage.do" class=""><i class="lnr lnr-code"></i>
										<span>블로그 홈</span>
									</a>
								</c:when>
								<c:otherwise>
									<a href="/subject/proSubjectView.do?inputId=${sessionScope.userId }" class=""><i class="lnr lnr-code"></i>
										<span>내 과목 조회</span>
									</a>
								</c:otherwise>
							</c:choose>
							<!-- </a> -->
						</li>
						<c:if test="${sessionScope.userLevel == 'PRO'}">
							<li style="display: none;">
								<a href="#subPages" data-toggle="collapse" class="collapsed"><i class="lnr lnr-file-empty"></i><span> 과목</span><i class="icon-submenu lnr lnr-chevron-left"></i></a>
								<div id="subPages" class="collapse">
									<ul class="nav">
										<li><a href="/subject/subjectView.do">과목 등록</a></li>
										<li><a href="page-login.html">과목 수정</a></li>
									</ul>
								</div>
							</li>
						</c:if>
					</ul>
				</nav>
			</div>
		</div>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<!-- OVERVIEW -->
					<div class="panel panel-headline">
						<div class="panel-heading">
							<h3 class="panel-title">리얼 타임 시계</h3>
							<span class="clock" id="clocks"></span>
							<!-- <h1 id="clock" style="color:gray;">00:00</h1> -->
						</div>
						<div class="panel-body">
							<c:choose>
								<c:when test="${sessionScope.userLevel != 'PRO'}">
									<div class="row">
										<div class="col-md-9">
											<table class="table table-bordered" id="helpme">
												<thead>
													<tr>
														<th>#</th>
														<th>월</th>
														<th>화</th>
														<th>수</th>
														<th>목</th>
														<th>금</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>1 교시</td>
														<td class="edu edu_1"></td>
														<td class="edu edu_9"></td>
														<td class="edu edu_17"></td>
														<td class="edu edu_25"></td>
														<td class="edu edu_33"></td>
													</tr>
													<tr>
														<td>2 교시</td>
														<td class="edu edu_2"></td>
														<td class="edu edu_10"></td>
														<td class="edu edu_18"></td>
														<td class="edu edu_26"></td>
														<td class="edu edu_34"></td>
													</tr>
													<tr>
														<td>3 교시</td>
														<td class="edu edu_3"></td>
														<td class="edu edu_11"></td>
														<td class="edu edu_19"></td>
														<td class="edu edu_27"></td>
														<td class="edu edu_35"></td>
													</tr>
													<tr>
														<td>4 교시</td>
														<td class="edu edu_4"></td>
														<td class="edu edu_12"></td>
														<td class="edu edu_20"></td>
														<td class="edu edu_28"></td>
														<td class="edu edu_36"></td>
													</tr>
													<tr>
														<td>5 교시</td>
														<td class="edu edu_5"></td>
														<td class="edu edu_13"></td>
														<td class="edu edu_21"></td>
														<td class="edu edu_29"></td>
														<td class="edu edu_37"></td>
													</tr>
													<tr>
														<td>6 교시</td>
														<td class="edu edu_6"></td>
														<td class="edu edu_14"></td>
														<td class="edu edu_22"></td>
														<td class="edu edu_30"></td>
														<td class="edu edu_38"></td>
													</tr>
													<tr>
														<td>7 교시</td>
														<td class="edu edu_7"></td>
														<td class="edu edu_15"></td>
														<td class="edu edu_23"></td>
														<td class="edu edu_31"></td>
														<td class="edu edu_39"></td>
													</tr>
													<tr>
														<td>8 교시</td>
														<td class="edu edu_8"></td>
														<td class="edu edu_16"></td>
														<td class="edu edu_24"></td>
														<td class="edu edu_32"></td>
														<td class="edu edu_40"></td>
													</tr>
												</tbody>
											</table>
										</div><br>
										<div class="col-md-12">
											<div class="col-md-9">
												<form class="navbar-form navbar-left">
													<div class="input-group" style="display: none;">
														<input type="text" class="form-control" placeholder="Search dashboard..." />
														<span class="input-group-btn"><button type="button" class="btn btn-primary">Go</button></span>
													</div>
												</form>
											</div>
											<div class="col-md-12"></div>
											<div class="col-md-3">
												<select class="form-control" id="major" name="major">
													<option value="">과목</option>
													<c:forEach var="rowList" items="${majorList }">
														<option value="${rowList.value }">${rowList.name }</option>
													</c:forEach>
												</select>
											</div>
											<div class="col-md-3">
												<select class="form-control" id="allType" name="allType">
													<option value="">유형</option>
												</select>
											</div>
											<div class="col-md-3">
												<select class="form-control" id="professor" name="professor"></select>
											</div>
											<div class="col-md-3" style="margin-bottom: 10px;'">
												<span class="input-group-btn"><button type="button" class="btn btn-primary" id="search">검색</button></span>
											</div><br><br><br>
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
														<th>수강 가능한 인원</th>
														<th>수강하기</th>
													</tr>
												</thead>
												<tbody class="resultList" id="resultList"></tbody>
											</table>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<h1>교수 메인페이지입니다</h1>
								</c:otherwise>
							</c:choose>
						</div>
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