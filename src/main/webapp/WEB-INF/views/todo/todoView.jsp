<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>

<!-- head -->
<c:import url="/WEB-INF/include/header.jsp" />

<style>
.main{
	min-height: 1729px;;
}
table{
	margin-left:auto; 
	margin-right:auto;
}
td,th{
	text-align: center;
	
}
button.left, .todo-area{
    float: left;
    margin-top: 10px;
    margin-right: 10px;
}
</style>
</head>

<body id="page-top">

	<!-- Page Wrapper -->
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
								<li><a href="#"><i class="lnr lnr-cog"></i> <span>Settings</span></a></li>
								<li><a href="#"><i class="lnr lnr-exit"></i> <span>Logout</span></a></li>
							</ul>
						</li>
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
							<c:choose>
								<c:when test="${sessionScope.userLevel != 'PRO'}">
									<a href="/subject/studentSubjectView.do?inputId=${sessionScope.userId }" class=""><i class="lnr lnr-code"></i>
										<span>수강과목 조회</span>
									</a>
								</c:when>
								<c:otherwise>
									<a href="/subject/proSubjectView.do?inputId=${sessionScope.userId }" class=""><i class="lnr lnr-code"></i>
										<span>내 과목 조회</span>
									</a>
								</c:otherwise>
							</c:choose>
							<!-- </a> -->
							<a href="/todo/todoView.do" class=""><i class="lnr lnr-code"></i>
								<span>TODO</span>
							</a>
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

		<!-- Content Wrapper -->
		<div class="main">

			<!-- Main Content -->
			<div class="main-content">

				<!-- Begin Page Content -->
				<div class="container-fluid">
					<div class="panel panel-headline">
					
						<!-- Page Heading -->
						<div class="panel-heading">
							<h3 class="panel-title">TODO</h3>
						</div>
						<!--  Page Body -->
						<div class="panel-body">
							<!-- 아이템 조회 및 수정 테이블 -->
							<div class="row">
								<div class="col-md-9">
									<div class="panel">
										<table class="table table-bordered" >
											<thead>
												<tr>
													<th>DONE?</th>
													<th>제목</th>
													<th>시작일</th>
													<th>종료일</th>
													<th>설명</th>
													<th>수정</th>
													<th>삭제</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="todovo" items="${list}" varStatus="no" >
													<tr class="modifyTodo" >
														<td colspan="7" id="${no.index}" valign=middle>												
															<div class="panel">
																<!-- 수정 화면, 평소에는 안보인다.  -->
																<form action="/todo/modify.do" method="post">
																	<div class="panel-body">
																		<input type="hidden" value="${todovo.userno}" name="userno">
																		<input type="hidden" class="todono" value="${todovo.no}" name="no">
																		<div class="todo-area">
																			제목
																			<input type="text" id="title" name="title" required minlength="4" maxlength="8" size="10" value="${todovo.title}"> 
																			시작일: 
																			<input type="text" value="${todovo.startdate}" class="datestart" name="startdate" required />
																			종료일: 
																			<input type="text" value="${todovo.duedate}" class="dateend" name="duedate"  required />
																			설명
																			<input type="text" id="description" name="description" value="${todovo.description}">
																		</div>		
																		<span class="input-group-btn" style="position: static;">
																			<button class="btn btn-success left" type="submit" onclick="$(this).closest('form').submit();">수정하기</button>
																			<button class="btn btn-default left" type="button" onclick="abortEdit()">취소하기</button>
																		</span>			
																	</div>
																</form>
															</div>
														</td>
													</tr>
													<!--  조회 화면  -->
													<tr class="viewTodo" >		
														<td valign=middle>
															<span class="imgClickAndChange" onclick="changeImage(${todovo.no})" style="display:block">
																<c:choose>
																	<c:when test="${todovo.issuccess eq 1}" >
																		<img alt="" src="/assets/img/checked.png" />
																	</c:when>
																	<c:otherwise>
																		<img alt="" src="/assets/img/unchecked.png"  />
																	</c:otherwise>
																</c:choose>      
															</span>
														</td>
														<td valign=middle>${todovo.title}</td>
														<td valign=middle>${todovo.startdate}</td>
														<td valign=middle>${todovo.duedate}</td>
														<td valign=middle>${todovo.description}</td>
														<td valign=middle><a class="modifyTodoButton" data-index="${no.index}"><span  style="height: 50px; width: 50px" class="lnr lnr-pencil"></span></a></td>
														<td valign=middle><a class="text-white delete-todo" data-no="${todovo.no}" data-toggle="modal" data-target="#deleteModal"><span  style="height: 50px; width: 50px" class="lnr lnr-cross"></span></a></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>						
							</div>
							
							<!-- 아이템 추가 -->
							<div class="col-md-9">
								<div class="panel" id="addTodo">
									<form class="col-xl-auto col-md-auto mb-4 template" 
										name="addTodo"
										action="/todo/add.do" method="post">
										
										<div class="panel-body">
											<input type="hidden" value="${sessionScope.userId}" name="userno">
											<div class="todo-area">
												제목
												<input type="text" id="title" name="title" required minlength="4" maxlength="8" size="10" value=""> 
												시작일: 
												<input type="text" value="" class="datestart" name="startdate" required />
												종료일: 
												<input type="text" value="" class="dateend" name="duedate"  required />
												설명
												<input type="text" id="description" name="description" value="">

												<span class="input-group-btn">
													<button type="button" class="btn btn-primary left" id="search" onclick="document.getElementById('addTodo').getElementsByTagName('form')[0].submit();">추가</button>
													<button class="btn btn-default left" type="button" onclick="abortAdd()">취소</button>
												</span> 
											</div>					
										</div>
									</form>
								</div>
								<span class="input-group-btn" style="position: static;">
									<button type="button" class="btn-lg btn-primary left" id="addTodoBtn">새 TODO 만들기</button>
								</span>
							</div>
						</div>
					</div>	
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- End of Main Content -->
		</div>
		<!-- End of Content Wrapper -->
		
		<!-- Footer -->
		<footer>
			<div class="container-fluid">
				<p class="copyright">Shared by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">BootstrapThemes</a></p>
			</div>
		</footer>
		<!-- End of Footer -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">TODO 삭제</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">TODO를 삭제합니다</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">취소</button>
					<a class="btn btn-primary" id="delete-confirm" href="/todo/delete.do?no=">삭제</a>
				</div>
			</div>
		</div>
	</div>


	<script>
		// string to date (yyyy-MM-dd)
		function toDate(date_str){
			var words = date_str.split('-');
			return new Date(Number(words[0]),Number(words[1])-1,Number(words[2]));
		}
		// date diff (date2 - date1)
		function betweenDate(date1, date2)
		{   
		    var y1970 = new Date(1970, 0, 1).getTime();
		    var time1 = null;
		    var time2 = null;

	        time1 = toDate(date1).getTime() - y1970;
	        time2 = toDate(date2).getTime() - y1970;

		    var per_day = 1000 * 60 * 60 * 24;              // 1일 밀리초

		    return Math.floor(time1/per_day) - Math.floor(time2/per_day);
		}
		
	
		// 일별 todo 체크 여부 확인
		function changeImage(todo_no) {
		   var elem = $(event.target);
		   checked = elem.attr('src') === "/assets/img/checked.png";
		   let src = (checked == true) ? '/assets/img/unchecked.png' : '/assets/img/checked.png';  
		   var is_success = checked == true ? 0 : 1;
		   var form = {
				   todono : todo_no,
				   issuccess : is_success
		   }
		   // todo 달성정보를 전송
		   $.ajax({
			   url: "setachievement.do", 
			   type: "POST",
			   data: form,
			   success: function(data){
				   let issuccess = (data == 1)? '/assets/img/checked.png' : '/assets/img/unchecked.png';
				   elem.attr('src',issuccess);
			   },
			   error:function(){
				   alert("error");
			   }
		   })
	    }
		// 수정 취소하기 
		function abortEdit(){
			let editElement = $(event.target).closest('.modifyTodo');
			let viewElement = $(event.target).closest('.modifyTodo').next();
			editElement.css("display","none");
			viewElement.css("display","");
		}
		// todo 추가 취소
		function abortAdd(){
			let addElement = $('#addTodo');
			addElement.css("display","none");
		}
		// datepicker 초기화
	    $.datepicker.setDefaults({
	        dateFormat: 'yy-mm-dd',
	        prevText: '이전 달',
	        nextText: '다음 달',
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	        showMonthAfterYear: true,
	        yearSuffix: '년'
	    });
	    
		// date format 맞추기
		$(".datestart, .dateend").datepicker({
			dateFormat : 'yy-mm-dd'
		});
		
		

		// todo 추가할때 추가창 뜨게 하기
		$('#addTodo').css("display", "none");
		$('#addTodoBtn').click(function() {
			$('.modifyTodo').css("display","none"); 
			$('.viewTodo').css("display","");
			$('#addTodo').css("display", "");
		});
		$('.modifyTodo').css("display","none");
		$(function(){
			// 수정버튼 누를시 수정화면 보이게끔 함
			$('.modifyTodoButton').click(function(){
				
				$('#addTodo').css("display", "none");
				// 한번 수정화면을 열 경우 가까운 tag 처리가 꼬여서 다 없어지게 된다.
				$('.viewTodo').css("display","");
				// 수정을 누르면 수정화면이 다 안뜨게 된다. 
				$('.modifyTodo').css("display","none");
				// 그리고 가장가까운 view 화면이 뜨지 않는다
				console.log($(this).attr('data-index'));
				let no = $(this).attr('data-index');
				console.log($(this).prev());
				let row = $(this).closest('.viewTodo');
				row.prev().css("display","");
				row.css("display","none");
				//$(this).closest('.viewTodo').css("display","none");
				//$(this).closest('.card-body').children('.modifyTodo').css("display","block");				
				// 가장 가까운 수정화면이 뜬다. 
			});
			
			$('.modifyTodoSubmitButton').click(function(){
				// 확인 클릭시 모든 view 화면이 뜬다. 
				$('.viewTodo').css("display","block");				
				$(this).closest('.card-body').children('.viewTodo').css("display","");
				$(this).closest('.modifyTodo').css("display","none");
			});
			// 종료날짜 클릭시 시작날짜 입력 여부를 확인
			$(".dateend").change(function(){
				let startTag;
				let startVal;
				let endVal;
				startTag= $(this).parent().children(".datestart");
				startVal = startTag.val();
				let endTag = $(this);
				endVal = $(this).val(); 
				// 시작날짜 입력 확인
				if(startVal == ""){
					$(this).val("");
					alert("시작 날짜를 먼저 입력하세요");
					return;
				}
				// 날짜 비교 (시작날짜가 종료날짜보다 같거나 이전이어야)
				let dateDiff = betweenDate(startVal,endVal);
				if(dateDiff > 0){
					endTag.val("");
					alert("종료날짜는 시작 날짜보다 크거나 같아야 합니다");
					return;
				} 
			});
			// 시작날짜가 종료날짜보다 더 늦는지 확인
			$(".datestart").change(function(){
				let startDate= $(this).val();
				let dueDate= $(this).next().val();
				
				let dateDiff = betweenDate(startDate,dueDate);
				if(dateDiff > 0){
					$(this).val("");
					alert("종료날짜는 시작 날짜보다 크거나 같아야 합니다");
					return;
				} 
				
			});
			
			// 삭제 버튼 누를 때 번호 저장 
			$('.delete-todo').click(function(){
				console.log();
				let no = $(this).attr('data-no');
				let link = $("#delete-confirm").attr('href');
				$("#delete-confirm").attr('href',link + no);
				console.log($("#delete-confirm").attr('href'));
			});
		});
		

	</script>
</body>

</html>