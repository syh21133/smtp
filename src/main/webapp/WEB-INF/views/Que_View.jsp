<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/assets/css/all.min.css">
<link rel="stylesheet" href="resources/assets/css/animate.css">
<link rel="stylesheet" href="resources/assets/css/flaticon.css">
<link rel="stylesheet" href="resources/assets/css/magnific-popup.css">
<link rel="stylesheet" href="resources/assets/css/odometer.css">
<link rel="stylesheet" href="resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/assets/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/assets/css/nice-select.css">
<link rel="stylesheet" href="resources/assets/css/main.css">
<link rel="shortcut icon" href="resources/assets/images/favicon.png"
	type="image/x-icon">
<title>문의사항</title>
</head>
<body>
	<!-- ==========Preloader========== -->
	<div class="preloader">
		<div class="preloader-inner">
			<div class="preloader-icon">
				<span></span><span></span>
			</div>
		</div>
	</div>
	<!-- ==========Preloader========== -->
	<!-- ==========Overlay========== -->
	<div class="overlay"></div>
	<a href="#0" class="scrollToTop"><i class="fas fa-angle-up"></i></a>
	<!-- ==========Overlay========== -->
	
	
	<!-- ==========Header-Section========== -->
	<%@include file="../views/header.jsp" %>
	<!-- ==========Header-Section========== -->
	
	
	<!-- ==========Banner-Section========== -->
	<section class="main-page-header speaker-banner bg_img"
		data-background="./resources/assets/images/banner/banner07.jpg">
		<div class="container">
			<div class="speaker-banner-content">
				<h2 class="title">문의사항</h2>
				<ul class="breadcrumb">
					<li><a href="index">Home</a></li>
					<li><a href="#">고객센터</a></li>
					<li><a href="#">My 문의사항</a></li>
					<li>My 문의사항 상세보기</li>
				</ul>
			</div>
		</div>
	</section>
	<!-- ==========Banner-Section========== -->
	<!-- ==========Blog-Section========== -->
	<section class="blog-section padding-top padding-bottom">
		<div class="container">
			<div class="row justify-content-center">
				
				<div class="col-lg-8 mb-50 mb-lg-0">
					<article>
						<div class="post-item">
							
							<div class="post-content">
								<div class="post-header">
								<input type="hidden" value="${view.quNum}" id="quNumInput" name="quNumInput">
									<h4 class="title">
										<a href="#">${view.quTitle}</a>
									</h4>
									<div class="meta-post">
										<!-- <a href="#0" class="mr-4"><i class="flaticon-conversation"></i>답변갯수</a>-->
											<a href="#0"><i class="flaticon-view"></i>조회수 : ${view.quHit}</a>
									</div>
									<p>${view.quContent}</p>
								</div>
								
								<div class="entry-content">
									<div class="left">
										<span class="date"><i class="far fa-clock"></i> 작성 날짜 : ${view.quDate}</span>
										<div class="authors">
											
											<h6 class="title">
												<a href="#0"><i class="fas fa-user"></i> 작성자 ID : ${view.quId}</a>
											</h6>
										</div>
									</div>
									
								</div>
							</div>
						</div>
						
						<div class="post-item">
							<c:choose>
							<c:when test="${view.quAnswer != null}">
								<div class="post-content">
									<div class="post-header">
										<h6 class="title">
											<a href="#">${view.quId}님의 문의에 대한 답변</a>
										</h6>
										
										<p>${view.quAnswer}</p>
									</div>
									
									<div class="entry-content">
										<div class="left">
											<span class="date"><i class="far fa-clock"></i> 답변 날짜 : ${view.quAnsDate}</span>
											<div class="authors">
												
												<h6 class="title">
													<a href="#0"><i class="fas fa-user"></i> 관리자님의 답변</a>
												</h6>
											</div>
										</div>
										
									</div>
								</div>
							</c:when>
							
							
							<c:otherwise>
								<c:if test="${userId == 'admin'}">
								<div class="post-content">
									<div class="post-header">
										<h6 class="title">
											<a href="#">${view.quId}님이 답변을 기다리는 중 입니다.</a>
										</h6>
										
										<form class="blog-form">
											<div class="form-group">
												<textarea id="quAnswer" placeholder="답변을 작성해주세요." required=""></textarea>
											</div>
											
											<div class="widget widget-search">
												<button type="button" onclick="quAnswerWrite()">답변 작성</button>
											</div>
											
										</form>
									</div>
								</div>
								</c:if>
							</c:otherwise>
						</c:choose>
							
						</div>
						
						
					</article>
					
				</div>
				
				<div class="col-lg-4 col-sm-10 col-md-8">
					<aside>
						
						<c:if test="${userId == 'admin' || userId == view.quId}">
						<div class="widget widget-search">
							<h5 class="title">문의내역 관리</h5>
							<form class="search-form">
								
								<button type="button" onclick="location.href='quDelete?quNum=${view.quNum}&userId=${userId}'">삭제</button>
								
							</form>
						</div>
						</c:if>
						
						
					</aside>
				</div>
			</div>
		</div>
	</section>
	<!-- ==========Blog-Section========== -->
	
	<!-- ==========Newslater-Section========== -->
	
	<!-- ==========Newslater-Section========== -->
	<script src="resources/assets/js/jquery-3.3.1.min.js"></script>
	<script src="resources/assets/js/modernizr-3.6.0.min.js"></script>
	<script src="resources/assets/js/plugins.js"></script>
	<script src="resources/assets/js/bootstrap.min.js"></script>
	<script src="resources/assets/js/isotope.pkgd.min.js"></script>
	<script src="resources/assets/js/magnific-popup.min.js"></script>
	<script src="resources/assets/js/owl.carousel.min.js"></script>
	<script src="resources/assets/js/wow.min.js"></script>
	<script src="resources/assets/js/countdown.min.js"></script>
	<script src="resources/assets/js/odometer.min.js"></script>
	<script src="resources/assets/js/viewport.jquery.js"></script>
	<script src="resources/assets/js/nice-select.js"></script>
	<script src="resources/assets/js/contact.js"></script>
	<script src="resources/assets/js/main.js"></script>
</body>

<!-- jQuery 사용을 위한 import -->
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous">
</script>
<script>
	// 문의 답변 작성 함수
	function quAnswerWrite(){
		let quNum = $("#quNumInput").val();
		let quAnswer = $("#quAnswer").val();
		
		location.href = "quAnswerWrite?quNum="+quNum+"&quAnswer="+quAnswer;
	}

</script>

</html>