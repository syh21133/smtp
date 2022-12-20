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
<title>자주찾는질문 상세보기</title>
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
				<h2 class="title">자주찾는질문</h2>
				<ul class="breadcrumb">
					<li><a href="index">Home</a></li>
					<li><a href="">고객센터</a></li>
					<li><a href="#">자주찾는질문</a></li>
					<li>자주찾는질문 상세보기</li>
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
									<h4 class="title">
										<a href="#">Q. ${view.rqTitle}</a>
									</h4>
									<div class="meta-post">
											<a href="#0"><i class="flaticon-view"></i>조회수 : ${view.rqHit}</a>
									</div>
									<p>A. ${view.rqContent}</p>
								</div>
								
								<div class="entry-content">
									<div class="left">
										<span class="date"><i class="far fa-clock"></i> 작성 날짜 : ${view.rqDate}</span>
										<div class="authors">
											
										</div>
									</div>
									
								</div>
							</div>
						</div>
						
						
						
						
					</article>
					
				</div>
				
				<div class="col-lg-4 col-sm-10 col-md-8">
					<aside>
						
						<c:if test="${userId == 'admin'}">
						<div class="widget widget-search">
							<h5 class="title">자주찾는질문 관리</h5>
							<form class="search-form">
								
								<button type="button" onclick="location.href='rqDelete?rqNum=${view.rqNum}'">삭제</button>
								
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
</html>