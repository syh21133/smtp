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
	<section class="main-page-header speaker-banner bg_img"
		data-background="./resources/assets/images/banner/banner07.jpg">
		<div class="container">
			<div class="speaker-banner-content">
				<h2 class="title">내 정보</h2>
				<ul class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li>내 정보</li>
				</ul>
			</div>
		</div>
	</section>
	<!-- ==========Banner-Section========== -->
	<!-- ==========Contact-Section========== -->
	<section class="contact-section padding-top">
		<div class="contact-container">
			
			<div class="bg-thumb bg_img"
				data-background="resources/proFile/${view.userProfileName}">
				</div>		
			<div class="container">
				<div class="row justify-content-between">
					<div class="col-md-7 col-lg-6 col-xl-5">
						<div class="section-header-3 left-style">
							<h2 class="title">내 정보</h2>
							
						</div>
						<form class="contact-form" id="contact_form_submit">
							<div class="form-group">
								<label for="name">아이디<span>*</span></label>
								<h3 class="name">${view.userId}</h3>
							</div>
							<div class="form-group">
								<label for="email">이름 <span>*</span></label>
								<h3 class="name">${view.userName}</h3>
							</div>
							<div class="form-group">
								<label for="email">생일<span>*</span></label>
								<h3 class="name">${view.userBirth}</h3>
							</div><div class="form-group">
								<label for="email">성별<span>*</span></label>
								<h3 class="name">${view.userGender}</h3>
							</div><div class="form-group">
								<label for="email">이메일<span>*</span></label>
								<h3 class="name">${view.userEmail}</h3>
							</div>
							<div class="form-group">
								<input type="button" value="정보수정" onclick="location.href='memberModify?userId=${view.userId}'" class="custom-button" style="width:40%;">
								<input type="button" value="회원탈퇴" onclick="Del()" class="custom-button" style="width:40%;">
								<input type="button" value="예매내역" onclick="location.href='bookList?userId=${view.userId}'" class="custom-button" style="width:40%;">
							</div>
							</form>
						
					</div>
					<!-- <div class="col-md-5 col-lg-6">
						<div class="padding-top padding-bottom contact-info">
							<div class="info-area">
								<div class="info-item">
									<div class="info-thumb">
										<img src="./resources/assets/images/contact/contact01.png" alt="contact">
									</div>
									<div class="info-content">
										<h6 class="title">phone number</h6>
										<a href="Tel:82828282034">+1234 56789</a>
									</div>
									<br/>
								</div>
								<div class="info-item">
									<div class="info-thumb">
										<img src="./resources/assets/images/contact/contact02.png" alt="contact">
									</div>
									<div class="info-content">
										<h6 class="title">Email</h6>
										<a href="Mailto:info@gmail.com">info@Boleto .com</a>
									</div>
								</div>
							</div>
						</div>
					</div> -->
				</div>
			</div>
		</div>
	</section>
	<!-- ==========Contact-Section========== -->
	<!-- ==========Contact-Counter-Section========== -->
	
	<!-- ==========Contact-Counter-Section========== -->
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
	<script src="resources/assets/js/contact.js"></script>
	<script src="resources/assets/js/main.js"></script>
									<script>
function Del(){
	
	let conf = confirm('탈퇴 하시겠습니까?');
	
	if(conf){
		alert("탈퇴 했습니다.")
		location.href='memberDelete?userId=${view.userId}&admin=${userId}';
	}else{
		alert('취소했습니다.')
	}
}

</script>
</body>
</html>