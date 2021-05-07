<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html lang="ko">

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
					<!-- OVERVIEW -->
					<!-- Sidebar/menu -->
					<c:import url='/WEB-INF/include/coursecategorybar.jsp' />
					
					<div class="w3-main" style="margin-left:150px">
					<form name="form" id="form" method="post" action="/courseEvaluationManagement/addCourse.do" enctype="multipart/form-data" >
						<table class="table table-striped table-hover">
							<tr>
								<th colspan="2" style="text-align:center">영화 등록</th>
							</tr>
							<tr>
								<td style="padding:20px">카테고리 선택</td>
								<td style="padding:20px">
									<select class="category1" name="courseCode">
										<option value="100">전체</option>
									</select>
								</td>
							</tr>
							<tr>
								<td style="padding:20px">강의명</td>
								<td style="padding:20px">
									<input type="text" id="courseName" name="courseName" />
								</td>
							</tr>
							<tr>
								<td style="padding:20px">최대수강인원</td>
								<td style="padding:20px">
									<input type="text" id="particiNum" name="particiNum" />
								</td>
							</tr>
							<tr>
								<td style="padding:20px">강의 설명</td>
								<td style="padding:20px">
									<textarea id="courseDes" name="courseDes"></textarea>
								</td>
							</tr>
							<tr>
								<td style="padding:20px">파일 추가</td>
								<td style="padding:20px">
									<div id="fileDiv">
											<input type="file" id="file" name="file_0"> 
											<div class="select_img"><img src="" /></div>
									</div>
								</td>
							</tr>
						</table>
					<button type="submit" class="btn btn-sm btn-primary">저장</button> 
					</form>
					
					<!-- End page content -->
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
<script>

var cate1Select = $('select.category1');
var cate1Arr = [];
var cate1Obj = {};
var gfv_count = 1;

$("#file").change(function(){
 if(this.files && this.files[0]) {
  var reader = new FileReader;
  reader.onload = function(data) {
   $(".select_img img").attr("src", data.target.result).width(300);        
  }
  reader.readAsDataURL(this.files[0]);
 }
});


$(function() {
	$.ajax({
		url: "/courseEvaluationManagement/courseCategory.do",
		async: true,
		data: '',
		dataType: 'json',
		success: function(response) {
			if(response.result != 'success') {
				console.error(response.message);
				return;
			}
			
			if(response.data) {
				var data = response.data
				console.log(data);
				for(var i=0; i < data.length; i++) {
					if(data[i].courseCodeRef != null) {
						cate1Obj = {};
						cate1Obj.courseCode = data[i].courseCode;
						cate1Obj.courseCateName = data[i].courseCateName;
						
						cate1Arr.push(cate1Obj);	
					}
				}
				
				console.log(cate1Arr);
				for(var i=0; i < cate1Arr.length; i++) {
					cate1Select.append("<option value='" + cate1Arr[i].courseCode + "'>" 
							+ cate1Arr[i].courseCateName + "</option>");	
				}
			}
			
		}, error : function(xhr, status, e) {
			console.log(status + ":" + e);
		}
	})
})
</script>
</html>