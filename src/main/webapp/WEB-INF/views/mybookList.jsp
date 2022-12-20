<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>예매 내역</title>
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
	<!-- ==========Sports-Details-Banner========== -->
	<section
		class="details-banner event-details-banner hero-area bg_img seat-plan-banner style-two"
		data-background="./resources/assets/images/banner/banner10.jpg">
		<div class="container">
			<div class="details-banner-wrapper">
				<div class="details-banner-content style-two">
					<h3 class="title">
						<span class="d-block">내 예매 내역</span>
					</h3>
					<div class="tags">
						<span>예매 내역 확인</span>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ==========Sports-Details-Banner========== -->
	<!-- ==========Page-Title========== -->
	<!-- <section class="page-title bg-one">
		<div class="container">
			<div class="page-title-area">
				<div class="item md-order-1">
					<a href="#0" class="custom-button back-button"><i
						class="flaticon-double-right-arrows-angles"></i>back</a>
				</div>
				<div class="item date-item">
					<span class="date">MON, SEP 09 2020</span>
				</div>
				<div class="item">
					<h5 class="title">05:00</h5>
					<p>Mins Left</p>
				</div>
			</div>
		</div>
	</section> -->
	<!-- ==========Page-Title========== -->
	<!-- ==========Event-Section========== -->
	<div class="event-facility padding-bottom padding-top">
		<div class="container">
			<div class="row">
				
				<c:forEach var="list" items="${bookList}">
				
				<div class="col-lg-4" style="padding:15px;">
					<div class="booking-summery bg-one">
						<h4 class="title">${list.bookNum}</h4>
						<ul>
							<li><h4 class="subtitle">${list.mvTitle}</h4>
								<span class="info">${list.mvGrade}세 이상 관람가</span></li>
							<li><h6 class="subtitle">
									<span>${list.ciRegion}  ${list.ciName}</span><span>${list.ciRoom}관</span>
								</h6>
								<div class="info">
									<span>${list.ticDate}  ${list.ticTime}</span>
								</div></li>
							
								</ul>
						
						<ul class="side-shape">
							<li><h6 class="subtitle">
									<span>예매한 날짜</span><span></span>
								</h6>
								<span class="info"><span>${list.ticDate}</span></span></li>
							<li><h6 class="subtitle">
									<span>food & bevarage</span>
								</h6></li>
						</ul>
						<ul>
							<li><span class="info"><span>price</span><span>$207</span></span><span
								class="info"><span>vat</span><span>$15</span></span></li>
						</ul>
					</div>
					<div class="proceed-area  text-center">
						<h6 class="subtitle">
							<span>Amount Payable</span><span>$222</span>
						</h6>
						<a href="deletebook?bookNum=${list.bookNum}&userId=${paging.userId}&page=${paging.page}&limit=${paging.limit}" class="custom-button back-button">delete</a>
					</div>
				</div>
				
				</c:forEach>
				
				
			</div>
			
			<div style="text-align:center">
			<c:if test="${paging.page <=1}"> <a class="btn btn-secondary">〈이전</a></c:if>
	<c:if test="${paging.page > 1}"><a href="bookList?userId=${userId}&page=${paging.page-1}&limit=${paging.limit}" class="btn btn-secondary" >〈이전</a></c:if>
	
	
	<c:forEach var="b" begin="${paging.startPage}" end="${paging.endPage}" step="1">
		<c:choose>
		
			<c:when test="${paging.page eq b}"> <a class="btn btn-secondary">${b}</a> </c:when>
			
			
			<c:otherwise>
				<a href="bookList?userId=${userId}&page=${b}&limit=${paging.limit}" class="btn btn-secondary">${b}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
	
	<c:if test="${paging.page >= paging.maxPage}"> <a class="btn btn-secondary"> 다음〉</a>
	
	</c:if>
	<c:if test="${paging.page < paging.maxPage}">
	<a href="bookList?userId=${userId}&page=${paging.page+1}&limit=${paging.limit}" class="btn btn-secondary"> 다음〉</a>
	
	</c:if>
	</div>
		</div>
	</div>
	<!-- ==========Event-Section========== -->
	<!-- ==========Newslater-Section========== -->
	<footer class="footer-section">
		<div class="newslater-section padding-bottom">
			
		</div>
		<div class="container">
			
			<div class="footer-bottom">
				<div class="footer-bottom-area">
					<div class="left">
						<p>
							Copyright Â© 2020.All Rights Reserved By <a href="#0">Boleto</a>
						</p>
					</div>
					<ul class="links">
						<li><a href="#0">About</a></li>
						<li><a href="#0">Terms Of Use</a></li>
						<li><a href="#0">Privacy Policy</a></li>
						<li><a href="#0">FAQ</a></li>
						<li><a href="#0">Feedback</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
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
	<script src="resources/assets/js/main.js"></script>
</body>
</html>