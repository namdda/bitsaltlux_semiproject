<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<script src="<c:url value='/js/jquery-3.4.0.min.js'/>"></script>
</head>
<style>

</style>
<script>
$(function() {
	$("#btn").click(function(){
		$.ajax({
			type : "POST",
			url : "/js/mberSbscrb.do",
			data : $("#frm").serialize(),
			dataType : "text",
			success : function(data) {
				alert(2222)
			},
			error: function(xhs, status, error) {
				console.log(xhs.status, error)
			}
		});
	});
});

function mberSbscrb() {
	var obj = document.frm
	obj.action = "/js/mberSbscrb.do";
	obj.method = "post";
	obj.submit();
}
</script>
<body>
<div>
	<form name="frm" id="frm">
		아이디 : <input type="text" name="userId" id="userId" title="아이디" valid="req,max20" /><br><br>
		패스워드 : <input type="password" name="userPw" id="userPw" title="패스워드" valid="req,max20" /><br><br>
		성함 : <input type="text" name="userNm" id="userNm" title="성함" valid="req,max20" /><br><br>
		전화번호 : <input type="text" name="userPhone" id="userPhone" title="전화번호" valid="req,max20" /><br><br>
	</form>
	<button type="button" onclick="javascript:mberSbscrb();">회원가입</button>
	<button type="button" id="btn">회원가입2</button>
</div><br>
<div>
</div>
</body>
</html>