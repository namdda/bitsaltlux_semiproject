<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>


  <div>
    <h3><a href="/courseEvaluationMain/hotCourse.do" style="text-decoration:none"><b>Bit University</b></a></h3>
  </div>
  	<ul class="nav" style="float:left">
	  	<c:forEach items="${categoryList }" var="category">
	    	<li><a href="/courseEvaluationMain/${category.COURSE_CODE }.do">${category.COURSE_CATE_NAME }</a></li>
	    </c:forEach>
    </ul>
    
    
