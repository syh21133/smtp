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
<title>Boleto - Online Ticket Booking Website HTML Template</title>
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
	<section class="details-banner hero-area bg_img seat-plan-banner"
		data-background="./resources/assets/images/banner/banner04.jpg">
		<div class="container">
			<div class="details-banner-wrapper">
				<div class="details-banner-content style-two">
					<h3 class="title">예매하기</h3>
					<div class="tags">
						<a href="#0"></a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ==========Banner-Section========== -->
	<!-- ==========Page-Title========== -->
	<!-- <section class="page-title bg-one">
		<div class="container">
			<div class="page-title-area">
				<div class="item md-order-1">
					<a href="movie-ticket-plan.html" class="custom-button back-button"><i
						class="flaticon-double-right-arrows-angles"></i>back</a>
				</div>
				<div class="item date-item">
					<span class="date">MON, SEP 09 2020</span><select
						class="select-bar"><option value="sc1">09:40</option>
						<option value="sc2">13:45</option>
						<option value="sc3">15:45</option>
						<option value="sc4">19:50</option></select>
				</div>
				<div class="item">
					<h5 class="title">05:00</h5>
					<p>Mins Left</p>
				</div>
			</div>
		</div>
	</section> -->
	<!-- ==========Page-Title========== -->
	<!-- ==========Movie-Section========== -->
	<div class="movie-facility padding-bottom padding-top">
		<div class="container">
			<div class="row" >
			
				<div class="col-lg-4" style="margin:auto">
				
				<form action="tiBook" name="tiBook">
					<div class="booking-summery bg-one" >
						<h4 class="title">예매 확인</h4>
						<input type="hidden" name="botiNum" value="${tiList.ticNum }">
						<input type="hidden" name="bookId" value="${userId}">
						<ul>
							<li><h6 class="subtitle">${mvList.mvTitle}</h6>
								<span class="info">${mvList.mvGrade }세 관람가</span></li>
							<li><h6 class="subtitle">
									<span>${ciList.ciRegion}  ${ciList.ciName}</span><span>${ciList.ciRoom}관</span>
								</h6>
								<div class="info">
									<span>${tiList.ticDate}  ${tiList.ticTime }</span>
								</div></li>
								
								
						</ul>
						<ul class="side-shape">
							<li><h6 class="subtitle">
									<span>combos</span><span>$57</span>
								</h6>
								<span class="info"><span>2 Nachos Combo</span></span></li>
							<li><h6 class="subtitle">
									<span>food & bevarage</span>
								</h6></li>
						</ul>
						<ul>
							<li><span class="info"><span>price</span><span>$207</span></span><span
								class="info"><span>vat</span><span>$15</span></span></li>
						</ul>
					</div>
					</form>
					<div class="proceed-area  text-center">
						<h6 class="subtitle">
							<span>Amount Payable</span><span>$222</span>
						</h6>
						<input type="button" onclick="ticketBook()" class="custom-button back-button" value="확인">
					</div>
				</div>
				
			</div>
		</div>
	</div>
	<!-- ==========Movie-Section========== -->
	<!-- ==========Newslater-Section========== -->
	<footer class="footer-section">
		<div class="container">
			<div class="footer-top">
				<div class="logo">
					<a href="index-1.html"><img
						src="./resources/assets/images/footer/footer-logo.png" alt="footer"></a>
				</div>
				<ul class="social-icons">
					<li><a href="#0"><i class="fab fa-facebook-f"></i></a></li>
					<li><a href="#0" class="active"><i class="fab fa-twitter"></i></a></li>
					<li><a href="#0"><i class="fab fa-pinterest-p"></i></a></li>
					<li><a href="#0"><i class="fab fa-google"></i></a></li>
					<li><a href="#0"><i class="fab fa-instagram"></i></a></li>
				</ul>
			</div>
			<div class="footer-bottom">
				<div class="footer-bottom-area">
					<div class="left">
						<p>
							Copyright Â© 2020.All Rights Reserved By <a
								href="http://www.bootstrapmb.com/">Boleto </a>
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

<script>

function ticketBook(){
	
	tiBook.submit();
	
	
}

</script>

</html>