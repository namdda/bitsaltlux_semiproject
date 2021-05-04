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
			<div id="main-content">

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div class="panel-heading">
						<h2 class="panel-title">TODO</h2>
					</div>
					<div class="panel-body">
						<div class="card-body">
							<table class="table table-borderless " >
								<tr>
									<th>DONE?</th>
									<th>제목</th>
									<th>시작일</th>
									<th>종료일</th>
									<th>설명</th>
									<th><a class="modifyTodoButton text-white">수정</a></th>
									<th><a class="text-white" >삭제</a></th>
								</tr>
							</table>
						</div>
						<c:forEach items="${list}" var="todovo" varStatus="status">
							<div class="card-body">
								<!-- 수정 화면, 평소에는 안보인다.  -->
								<form class="modifyTodo"
									action="/todo/modify.do"
									method="post" >
									<input type="hidden" value="${todovo.userno}" name="userno">
									<input type="hidden" class="todono" value="${todovo.no}" name="no">
									제목<input
										type="text" id="title" name="title" required minlength="4"
										maxlength="8" size="10" value="${todovo.title}"> 시작일: 
										<input type="text" value="${todovo.startdate}" class="datestart" name="startdate" required />
									종료일: 
									<input type="text" value="${todovo.duedate}" class="dateend" name="duedate"  required />설명<input type="text"
										id="description" name="description" value="${todovo.description}">
									<input type="image" src="${pageContext.request.contextPath}/assets/img/edit.png" style="height: 30px; width: 30px" value="수정"
										class="modifyTodoSubmitButton">
								</form>
								<table class="viewTodo table table-borderless " >
									<tr>
										<td>
											<c:choose>
												<c:when test="${todovo.issuccess eq 1}">
										<img alt="" src="${pageContext.request.contextPath}/assets/img/checked.png" style="height: 30px; width: 30px" class="imgClickAndChange" onclick="changeImage(${todovo.no})"/>
												</c:when>
												<c:otherwise>
										<img alt="" src="${pageContext.request.contextPath}/assets/img/unchecked.png" style="height: 30px; width: 30px" class="imgClickAndChange" onclick="changeImage(${todovo.no})"/>
												</c:otherwise>
											</c:choose>        
										</td>
										<td><a class="text-white">${todovo.title}</a></td>
										<td><a class="text-white">${todovo.startdate}</a></td>
										<td><a class="text-white">${todovo.duedate}</a></td>
										<td><a class="text-white">${todovo.description}</a></td>
										<td><a class="modifyTodoButton text-white">
											<img alt="수정" src="${pageContext.request.contextPath}/assets/img/edit.png" style="height: 30px; width: 30px">
										</a></td>
										<td><a
											
											class="text-white" data-toggle="modal"
							data-target="#deleteModal"><img alt="삭제" src="${pageContext.request.contextPath}/assets/img/delete.png" style="height: 30px; width: 30px"></a></td>
									</tr>
								</table>
							</div>
						</c:forEach>
					</div>
					<form class="col-xl-auto col-md-auto mb-4 template" id="addTodo"
						name="addTodo"
						action="/todo/add.do" method="post">
						<div class="card border-left-primary shadow h-100 py-2">
							<div class="card-body">
								<div class="row no-gutters align-items-center">
									<div class="col mr-2">
										<input type="hidden" value="${sessionScope.userId}" name="userno">
											제목 
										<input class="form-control"
											type="text" id="title" name="title" required minlength="4"
											maxlength="8" size="10"> 시작일: 
										<input 
											type="text" value="" class="datestart" name="startdate"
											required /> 종료일: 
										<input type="text" value=""
											class="dateend" name="duedate" required /> 설명 
										<input class="form-control"
											type="text" id="description" name="description">
										<input class="form-control" type="submit" value="추가"
											class="btn-lg btn-primary btn-icon-split "> 
									</div>
								</div>
							</div>
						</div>
					</form>

					<a id="addTodoBtn"
						class="btn-lg btn-primary btn-icon-split"> <span
						class="icon text-white-50"> <i class="fas fa-flag"></i>
					</span> <span class="text">새로운 TODO 만들기</span>
					</a>

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
					<a class="btn btn-primary" href="/todo/delete.do?no=${todovo.no}">삭제</a>
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
		   checked = $(event.target).attr('src') === "/todosite/assets/img/checked.png";
		   let src = (checked == true) ? '/todosite/assets/img/unchecked.png' : '/todosite/assets/img/checked.png';  
		   var is_success = checked == true ? 0 : 1;
		   console.log(is_success);
		   var elem = $(event.target);
		   //$(event.target).attr('src',src);
		   var form = {
				   todono : todo_no,
				   issuccess : is_success
		   }
		   // todo 달성정보를 전송
		   $.ajax({
			   url: "todo/setachievement", 
			   type: "POST",
			   data: form,
			   success: function(data){
				   let issuccess = (data == 1)? '/todosite/assets/img/checked.png' : '/todosite/assets/img/unchecked.png';
				   elem.attr('src',issuccess);
			   },
			   error:function(){
				   alert("error");
			   }
		   })
	    }
		// date format 맞추기
		$(".datestart, .dateend").datepicker({
			dateFormat : 'yy-mm-dd'
		});
		
		

		// todo 추가할때 추가창 뜨게 하기
		$('#addTodo').css("display", "none");
		$('#addTodoBtn').click(function() {
			$('.modifyTodo').css("display","none"); 
			$('.viewTodo').css("display","block");
			$('#addTodo').css("display", "block");
		});
		$('.modifyTodo').css("display","none");
		$(function(){
			// 수정버튼 누를시 수정화면 보이게끔 함
			$('.modifyTodoButton').click(function(){
				$('#addTodo').css("display", "none");
				// 한번 수정화면을 열 경우 가까운 tag 처리가 꼬여서 다 없어지게 된다.
				$('.viewTodo').css("display","block");
				// 수정을 누르면 수정화면이 다 안뜨게 된다. 
				$('.modifyTodo').css("display","none");
				// 그리고 가장가까운 view 화면이 뜨지 않는다
				$(this).closest('.viewTodo').css("display","none");
				$(this).closest('.card-body').children('.modifyTodo').css("display","block");				
				// 가장 가까운 수정화면이 뜬다. 
			});
			
			$('.modifyTodoSubmitButton').click(function(){
				// 확인 클릭시 모든 view 화면이 뜬다. 
				$('.viewTodo').css("display","block");				
				$(this).closest('.card-body').children('.viewTodo').css("display","block");
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
		});
		

		

	</script>
</body>

</html>