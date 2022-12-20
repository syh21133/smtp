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
<link rel="stylesheet"
	href="resources/assets/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/assets/css/nice-select.css">
<link rel="stylesheet" href="resources/assets/css/main.css">
<link rel="shortcut icon" href="resources/assets/images/favicon.png"
	type="image/x-icon">
<title>고객센터</title>
<style>
.span1{
overflow: hidden; 
text-overflow: ellipsis; 
white-space: nowrap;
}
</style>
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
	<%@include file="../views/header.jsp"%>
	<!-- ==========Header-Section========== -->
	<!-- ==========Banner-Section========== -->
	<section class="main-page-header speaker-banner bg_img"
		data-background="./resources/assets/images/banner/banner07.jpg">
		<div class="container">
			<div class="speaker-banner-content">
				<h2 class="title">고객센터</h2>
				<ul class="breadcrumb">
					<li><a href="index">Home</a></li>
					<li>고객센터</li>
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
										<a href="RepQue_List">자주하는 질문<img alt="plus" src="./resources/assets/images/movie/plus.png" style="float:right; margin-top:5px;"></a>
									</h4>
									<div class="widget widget-categories">
										<ul>
											<c:forEach var="list" items="${rqList}">
												<li><a href="rqView?rqNum=${list.rqNum}&userId=${userId}"><span class="span1" style="width:400px;">${list.rqTitle}</span><span><i class="flaticon-view"></i> ${list.rqHit}</span></a></li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="post-item">
							<div class="post-thumb"></div>
							<div class="post-content">
								<div class="post-header">
									<h4 class="title">
										<a href="Noti_List" >공지사항<img alt="plus" src="./resources/assets/images/movie/plus.png" style="float:right; margin-top:5px;"></a>
										
										
										
									</h4>
									

									<div class="widget widget-categories">
										<ul>
											<c:forEach var="list" items="${notiList}">
												<li><a href="notiView?notiNum=${list.notiNum}"><span class="span1" style="width:300px;">${list.notiTitle}</span> <span><i class="far fa-clock"></i> ${list.notiDate}</span></a></li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
						</div>
				</div>
				<div class="col-lg-4 col-sm-10 col-md-8">
					<aside>
					
					<!-- 문의하기 버튼 기능 구현 예정 -->
					<c:if test="${userId != null}">
					
						<c:if test="${userId ne 'admin'}">
						<div class="widget widget-search">
							<button onclick="location.href='quWriteForm?userId=${userId}'">문의하기</button>
						</div>
						</c:if>
						
						<div class="widget widget-categories">
							<h6 class="title">
							<c:if test="${userId == 'admin'}">
								<a href="Que_List?userId=${userId}">문의 내역</a>
							</c:if>	
							<c:if test="${userId != 'admin'}">
								<a href="Que_List?userId=${userId}">내 문의 내역</a>
							</c:if>	
								<a href="Que_List?userId=${userId}" style="float:right; ">
								
								<img alt="plus" src="./resources/assets/images/movie/plus.png" style="margin-bottom:3px;" ></a>
							</h6>
							<ul>
								<c:forEach var="list" items="${quList}">
									<li><a href="quView?quNum=${list.quNum}"><span class="span1" style="width:50px;">${list.quTitle}</span><span><i class="far fa-clock"></i> ${list.quDate}</span></a></li>
								</c:forEach>
							</ul>
						</div>
						</c:if>
						
					</aside>
				</div>
			</div>
		</div>
	</section>
	<!-- ==========Blog-Section========== -->

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
	<!--Start of Tawk.to Script-->
	<script type="text/javascript">
		var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
		(function() {
			var s1 = document.createElement("script"), s0 = document
					.getElementsByTagName("script")[0];
			s1.async = true;
			s1.src = 'https://embed.tawk.to/63987312daff0e1306dc6f5f/1gk5o30ah';
			s1.charset = 'UTF-8';
			s1.setAttribute('crossorigin', '*');
			s0.parentNode.insertBefore(s1, s0);
		})();
	</script>
	<!--End of Tawk.to Script-->
</body>
</html>