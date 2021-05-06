<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블로그 홈</title>
<c:import url="/WEB-INF/include/header.jsp" />
</head>
<body>
	<div id="wrapper">
		<c:import url="/WEB-INF/include/navbar.jsp"/>
		<!-- MAIN -->
		<div class="main">
			<div class="main-content">
				<div class="col-md-8 blog-main">
					<h1 class="pb-3 mb-4 font-italic border-bottom">${postVo.author } 블로그</h1>
					<div class="blog-post">
						<div class="col-md-12">
							<div class="carousel-inner">
								<img class="first-slide" src="/assets/img/blogtitle.png"  style="width: 878px; height:301px;"/>
								<div class="carousel-caption">
									<div class="title-area">
										<h1 class="title-modern" style="color: white;">${postVo.title }</h1>		
									</div>
									<div class="col-md-12" style="display: inline; margin-top:20px;">
										<h4 class="blog-post-meta">${postVo.author } / ${postVo.wDate } </h4>
									</div>
								</div>
							</div>
						</div>

						<br/>
						<div class="col-md-12" style="margin-top: 20px; margin-bottom: 20px;">
							<h3>${fn:replace(postVo.content, newLineChar, "<br/>")}</h3>
						</div>
					</div>
					<div class="col-md-12">
						<c:if test="${postVo.originFile != null}">
							<div class="like p-2 cursor action-collapse" data-toggle="collapse" href="#attach" role="button" aria-expanded="false" aria-controls="attach" style="margin-top:20px;">
								첨부파일<span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span> 
							</div>
							<div class="bg-light p-2 collapse" id="attach">
								[<a href="/resources/upload/${postVo.storedFile}" download>${postVo.originFile}</a>]
							</div>
						</c:if>
						
					</div>
					
					<div class="col-lg-12">
						<hr style="height: 2px; background: #ccc;">					
						<c:if test="${sessionScope.userId eq id}">
							<button class="btn btn-danger" onclick="postDel()" style="float: left;">삭제</button>
							<a class="btn btn-primary" href="/blog/${id}/post/${no}/updateProc.do" role="button" style="float: right; margin-left: 5px; margin-right: 5px;">수정</a>
						</c:if>
						<a class="btn btn-primary" href="/blog/${id}/mainPage.do" role="button" style="float: right; margin-left: 5px;">목록</a>
					</div>
					<br>

					<div class="col-lg-12" style="margin-top:20px;">
						<!-- 댓글 폼 -->
						<div class="panel panel-default">
							<form action="/blog/${id}/post/${no}/comment/addProc.do" method="post">
								<input name="writer" value="${sessionScope.userNm }" type="hidden">
								<div class="panel-heading">댓글</div>
								<div class="panel-body">
									<div class="col-lg-1">
										<img class="img-circle" src="https://i.imgur.com/mCHMpLT.png" width="40px">
									</div>
									<div class="col-lg-10">
										<textarea id="reply-content" class="form-control ml-1 shadow-none textarea" name="content" placeholder="댓글을 달아주세요."></textarea>
									</div>
									<div class="col-lg-1">
										<button id="btn-reply" class="btn btn-primary btn-xs" type="submit">등록</button>
									</div>
								</div>
							</form>
							<hr style="height: 1px; background: #ccc;" width="90%">
							<!-- 댓글 조회 -->
							<div class="panel-body">
								<c:forEach items="${commentVo }" var="commentvo">
									<div class="col-lg-12" style="margin-bottom: 30px;">
										<div class="col-md-12" style="display: inline;">
											${commentvo.writer } &#183; ${commentvo.wDate }
											<c:if test="${sessionScope.userNm eq commentvo.writer }">
												<a onclick="delComment(${commentvo.no})" style="float: right; color: red;" role="button">삭제</a>
											</c:if>
										</div>
										<div class="col-md-12" style="margin-top: 5px;">
											<span>${commentvo.content }</span>
										</div>
										<div class="col-md-12" style="margin-top: 5px;">
											<div class="like p-2 cursor action-collapse" data-toggle="collapse" href="#collapseReply-${commentvo.no }" role="button" aria-expanded="false" aria-controls="collapseReply-${vo.no }">
												Reply<span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span>
											</div>
											<!-- 댓글 조회 끝 -->
											
											<div class="bg-light p-2 collapse" id="collapseReply-${commentvo.no }">
												<div class="panel-body">
													<!-- 댓글의 답글 폼 -->
													<form action="/blog/${id}/post/${no}/comment/${commentvo.no}/reply/addProc.do" method="post">
														<div class="row">
															<input name="writer" value="${sessionScope.userNm }" type="hidden">
															<div class="col-lg-1">
																<img class="img-circle" src="https://i.imgur.com/mCHMpLT.png" width="40">
															</div>
															<div class="col-lg-10">
																<textarea id="reply-content" class="form-control ml-1 shadow-none textarea" name="content" placeholder="답글을 달아주세요." style="margin-right: 10px;"></textarea>
															</div>
															<div class="col-lg-1">
																<button id="btn-reply" class="btn btn-primary btn-xs" type="submit">등록</button>
															</div>
														</div>
													</form>
													<!-- 댓글의 답글 폼 끝 -->

													<!-- 댓글의 답글 조회 -->
													<hr style="height: 1px; background: #ccc;">
													<c:forEach items="${replyVo }" var="replyvo">
														<c:if test="${commentvo.no eq replyvo.commentNo}">
															<div class="col-md-12" style="margin-bottom: 25px;">
																<div class="col-md-12" style="display: inline;">
																	${replyvo.writer } &#183; ${replyvo.regDate }
																	<c:if test="${sessionScope.userNm eq replyvo.writer }">
																		<a onclick="delReply(${replyvo.no})" style="float: right; color: red;" role="button">삭제</a>
																	</c:if>
																</div>
																<div class="col-md-12">
																	<span>${replyvo.content }</span>
																</div>
															</div>
														</c:if>
													</c:forEach>
													<!-- 댓글의 답글 조회 끝-->
												
												</div>
											</div>
											<!-- 댓글의 답글 끝-->
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<!-- Comment end -->
				</div>
				<aside class="col-md-4 blog-sidebar">
				<div class="p-3 mb-3 bg-light rounded">
					<h4 class="font-italic">About</h4>
					<p class="mb-0">
						Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras
						mattis consectetur purus sit amet fermentum. Aenean lacinia
						bibendum nulla sed consectetur.
					</p>
				</div>

				<div class="p-3">
					<h4 class="font-italic">Archives</h4>
					<ol class="list-unstyled mb-0">
						<li><a href="#">March 2021</a></li>
						<li><a href="#">February 2021</a></li>
						<li><a href="#">January 2021</a></li>
						<li><a href="#">December 2020</a></li>
						<li><a href="#">November 2020</a></li>
						<li><a href="#">October 2020</a></li>
						<li><a href="#">September 2020</a></li>
						<li><a href="#">August 2020</a></li>
						<li><a href="#">July 2020</a></li>
						<li><a href="#">June 2020</a></li>
						<li><a href="#">May 2020</a></li>
						<li><a href="#">April 2020</a></li>
					</ol>
				</div>

				<div class="p-3">
					<h4 class="font-italic">Elsewhere</h4>
					<ol class="list-unstyled">
						<li><a href="#">GitHub</a></li>
						<li><a href="#">Twitter</a></li>
						<li><a href="#">Facebook</a></li>
					</ol>
				</div>
			</aside>
			<!-- /.blog-sidebar -->
			</div>
		</div>
	</div>
	<!-- END MAIN CONTENT -->
	<script src="/assets/new/js/jquery/jquery-3.6.0.js"></script>
	<script src="/assets/new/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
		function postDel() {
		    var chk = confirm("정말 삭제하시겠습니까?");
		    if (chk) {
		        location.href='delete.do?result=true';
		    }
		}
	
		function delComment(no) {
		    var chk = confirm("정말 삭제하시겠습니까?");
		    if (chk) {
		        location.href='comment/' + no + '/delete.do?result=true';
		    }
		}
		
		function delReply(no) {
		    var chk = confirm("정말 삭제하시겠습니까?");
		    if (chk) {
		        location.href='reply/' + no + '/delete.do?result=true';
		    }
		}
	</script>
</body>
</html>