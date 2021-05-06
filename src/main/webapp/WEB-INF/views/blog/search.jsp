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
						<h1>블로그 포스트 검색 결과</h1>
						<p>총 ${postCount }건이 검색되었습니다.</p>
						
					</div>
				</div>
				<div class="row" style="margin-top: 20px;">
					<c:forEach items="${postVo }" var="vo" varStatus="status">
						<div class="col-md-6 col-md-offset-3" style="margin-bottom: 10px;">
							<div class="panel panel-info">
								<div class="card flex-md-row mb-4 box-shadow h-md-250">
									<div class="card-body">
										<div class="col-md-12" >
											<strong class="d-inline-block mb-2 text-primary" style="float:left;">Post</strong>
										</div>
										<div class="panel-heading">
											<h3 class="card-title">
											<a class="text-dark" href="/blog/${vo.blogId }/post/${vo.no }/viewPage.do" style="text-decoration: underline;">${vo.title }</a>
											</h3>
											<div class="mb-1 text-muted">${vo.author}/${vo.wDate }</div>
										</div>
										<div class="panel-body">
											<p style="white-space: nowrap; overflow: hidden; max-width: 800px; text-overflow: ellipsis; " class="card-text mb-auto">${vo.content }</p>
											<a href="/blog/${vo.blogId }/post/${vo.no }/viewPage.do">자세히 보기</a>
										</div>
									</div>
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
										<li> <a href="/blog/searchProc.do?keyword=${keyword }&page=${pageVo.prevPage}" class="prev"> <i class="fa fa-angle-left" aria-hidden="true"></i> Prev </a> </li>
									</c:if>
									<c:choose>
										<c:when test="${pageVo.endNum < pageVo.endPage }">
											<c:forEach var="i" begin="${pageVo.startNum }" end="${pageVo.endNum}">
												<li><a href="/blog/searchProc.do?keyword=${keyword }&page=${i }">${i}</a></li>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<c:forEach var="i" begin="${pageVo.startNum }" end="${pageVo.endPage}">
												<li><a href="/blog/searchProc.do?keyword=${keyword }&page=${i }">${i}</a></li>
											</c:forEach>
										</c:otherwise>
									</c:choose>
									<c:if test="${pageVo.endNum < pageVo.endPage }">
										<li><a href="/blog/searchProc.do?keyword=${keyword }&page=${pageVo.nextPage}" class="next"> Next <i class="fa fa-angle-right" aria-hidden="true"></i></a> </li>
									</c:if>
								</ul>
							</c:when>
							<c:otherwise>
								<ul><li><a href="/blog/searchProc.do?keyword=${keyword }">${pageVo.curPage }</a></li></ul>
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