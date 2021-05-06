<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>


<li>
	<a href="#subPages" data-toggle="collapse" class="collapsed"><i class="lnr lnr-file-empty"></i><span> 수강평가</span><i class="icon-submenu lnr lnr-chevron-left"></i></a>
	<div id="subPages" class="collapse">
		<ul class="nav">
			<li><a href="/courseEvaluationMain/hotCourse.do">수강평가 메인</a></li>
			<c:if test="${sessionScope.userLevel == 'PRO' }">
			<li><a href="/courseEvaluationManagement/getCourseList.do">수강평가 과목 관리</a></li>
			</c:if>
		</ul>
	</div>
</li>

