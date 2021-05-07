<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블로그 홈</title>
<c:import url="/WEB-INF/include/header.jsp" />
<link rel="stylesheet" href="/assets/new/css/page.css">
</head>
<body>
	<div id="wrapper">
		<c:import url="/WEB-INF/include/navbar.jsp"/>
		<!-- MAIN -->
		<div class="main">
			<div class="main-content">
				<div class="jumbotron">
					<div class="container">
						<h1>블로그 홈에 오신걸 환영합니다.</h1>
						<p>여러 사용자들의 블로그를 구경하고, 추억이 담긴 포스트를 올려보세요.</p>
						
					</div>
				</div>
				<div class="container-fluid">
					<c:forEach items="${blogVo }" var="vo" varStatus="status">
					<div class="col-xs-4 col-md-4" style="text-align: center">
						<div class="thumbnail">
							<c:choose>
								<c:when test="${vo.thumbLogo ne null }">
									<img src="/resources/upload/${vo.thumbLogo }"/>
								</c:when>
								<c:otherwise>
									<img src="https://i.imgur.com/mCHMpLT.png" style="width:250px; height:150px;"/>
								</c:otherwise>
							</c:choose>
							
							<div class="caption" style="margin-top: 20px;">
								<hr style="margin: auto;" width="300px">
								<h2>${vo.userName } 블로그</h2>
								<p>${vo.intro }</p>
								<p>
									<a href="/blog/${vo.userId }/mainPage.do" class="btn btn-primary" role="button">블로그 들어가기</a>
								</p>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
				<hr style="height: 1px; background: #ccc; margin-top: 40px;">
				<div class="text-center">
					<div class="pagination_rounded">
						<c:choose>
							<c:when test="${pageVo.count > 0 }">
								<ul>
									<c:if test="${pageVo.curPage > pageVo.groupSize}">
										<li> <a href="/blog/mainPage.do?page=${pageVo.prevPage}" class="prev"> <i class="fa fa-angle-left" aria-hidden="true"></i> Prev </a> </li>
									</c:if>
									<c:choose>
										<c:when test="${pageVo.endNum < pageVo.endPage }">
											<c:forEach var="i" begin="${pageVo.startNum }" end="${pageVo.endNum}">
												<li><a href="/blog/mainPage.do?page=${i }">${i}</a></li>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<c:forEach var="i" begin="${pageVo.startNum }" end="${pageVo.endPage}">
												<li><a href="/blog/mainPage.do?page=${i }">${i}</a></li>
											</c:forEach>
										</c:otherwise>
									</c:choose>
									<c:if test="${pageVo.endNum < pageVo.endPage }">
										<li><a href="/blog/mainPage.do?page=${pageVo.nextPage}" class="next"> Next <i class="fa fa-angle-right" aria-hidden="true"></i></a> </li>
									</c:if>
								</ul>
							</c:when>
							<c:otherwise>
								<ul><li><a href="/blog/mainPage.do">${pageVo.curPage }</a></li></ul>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
			<!-- END OVERVIEW -->
		</div>
	</div>
	<!-- END MAIN CONTENT -->
	<script src="/assets/new/js/jquery/jquery-3.6.0.js"></script>
	<script src="/assets/new/js/bootstrap.bundle.min.js"></script>

</body>
</html>