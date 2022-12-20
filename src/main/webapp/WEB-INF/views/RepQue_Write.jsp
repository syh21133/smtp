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
<title>자주찾는질문 등록</title>
</head>
<style>
textarea:focus{
	outline:2px solid #d50000;
}
</style>
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
				<h2 class="title">자주찾는질문 등록</h2>
				<ul class="breadcrumb">
					<li><a href="index">Home</a></li>
					<li><a href=CS_None">고객센터</a></li>
					<li>자주찾는질문 등록</li>
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
								<form action="rqWrite" method="POST">
								<div class="post-header">
									<h4 class="title">
										Q.<input type="text" name="rqTitle" placeholder="질문 내용">
									</h4>
									<div class="meta-post">
									</div>
									<p>A.<textarea name="rqContent" placeholder="답변 내용" style="background-color:transparent; color:white;"></textarea></p>
								</div>
								
								<div class="entry-content">
										<input type="submit" value="등록"/>
								</div>
								</form>
							</div>
						</div>
						
						
						
						
					</article>
					<!--
					<div class="pagination-area text-center">
						<a href="#0"><i class="fas fa-angle-double-left"></i><span>Prev</span></a><a
							href="#0">1</a><a href="#0">2</a><a href="#0" class="active">3</a><a
							href="#0">4</a><a href="#0">5</a><a href="#0"><span>Next</span><i
							class="fas fa-angle-double-right"></i></a>
					</div>
					 -->
				</div>
				
				<!-- <div class="col-lg-4 col-sm-10 col-md-8">
					<aside>
						
						<div class="widget widget-search">
							<h5 class="title">자주찾는질문 관리</h5>
							<form class="search-form">
								
								<button type="button" onclick="location.href=''">수정</button>
								<button type="button" onclick="location.href=''">삭제</button>
								
							</form>
						</div> -->
						
						<!-- 
						<div class="widget widget-categories">
							<h5 class="title">categories</h5>
							<ul>
								<li><a href="#0"><span>Showtimes & Tickets</span><span>50</span></a></li>
								<li><a href="#0"><span>Latest Trailers</span><span>43</span></a></li>
								<li><a href="#0"><span>Coming Soon </span><span>34</span></a></li>
								<li><a href="#0"><span>In Theaters</span><span>63</span></a></li>
								<li><a href="#0"><span>Release Calendar </span><span>11</span></a></li>
								<li><a href="#0"><span>Stars</span><span>30</span></a></li>
								<li><a href="#0"><span>Horror Movie </span><span>55</span></a></li>
							</ul>
						</div>
						 -->
						
					<!-- </aside>
				</div> -->
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