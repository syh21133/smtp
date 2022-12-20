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
<title>영화 목록</title>
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
	<section class="banner-section">
		<div class="banner-bg bg_img bg-fixed"
			data-background="./resources/assets/images/banner/banner02.jpg"></div>
		<div class="container">
			<div class="banner-content">
				<h1 class="title bold">
					영화 목록
				</h1>
				<p>영화 전체보기</p>
			</div>
		</div>
	</section>
	<!-- ==========Banner-Section========== -->
	<!-- ==========Ticket-Search========== -->

	<!-- ==========Ticket-Search========== -->
	<!-- ==========Movie-Section========== -->
	<section class="movie-section padding-top padding-bottom">
		<div class="container">
			<div class="row flex-wrap-reverse justify-content-center">

				<div class="col-lg-9 mb-50 mb-lg-0">
					<div class="filter-tab tab">

						<div class="tab-area">
							<div class="tab-item active">
								<div class="row mb-10 justify-content-center">

									<c:forEach var="list" items="${mvList}">

										<div class="col-sm-6 col-lg-4">
											<div class="movie-grid">
												<div class="movie-thumb c-thumb">
													<a href="mvView?mvTitle=${list.mvTitle}"><img
														src="./resources/folderforproject/images/poster/${list.mvFilename}"
														alt="movie"></a>
												</div>
												<div class="movie-content bg-one">
													<h5 class="title m-0">
														<a href="mvView?mvTitle=${list.mvTitle}">${list.mvTitle}</a>
													</h5>
													<ul class="movie-rating-percent">
														<li><span class="content">${list.mvGenre}</span></li>
														<li><c:if test="${list.mvGrade == 0}">
																<span class="content">전체 관람가</span>
															</c:if> <c:if test="${list.mvGrade != 0 }">
																<span class="content">${list.mvGrade}세 관람가</span>
															</c:if></li>


													</ul>
												</div>
											</div>
										</div>

									</c:forEach>

								</div>
							</div>



						</div>

						<div class="pagination-area text-center">
							<c:if test="${paging.page <=1}">
								<a><i class="fas fa-angle-double-left"></i>이전</a>
							</c:if>
							<c:if test="${paging.page > 1}">
								<a href="movieList?page=${paging.page-1}&limit=${paging.limit}"><i
									class="fas fa-angle-double-left"></i> 이전</a>
							</c:if>


							<c:forEach var="b" begin="${paging.startPage}"
								end="${paging.endPage}" step="1">
								<c:choose>

									<c:when test="${paging.page eq b}">
										<a class="active">${b}</a>
									</c:when>


									<c:otherwise>
										<a href="movieList?page=${b}&limit=${paging.limit}">${b}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>


							<c:if test="${paging.page >= paging.maxPage}">
								<a>다음<i class="fas fa-angle-double-right"></i>
								</a>

							</c:if>
							<c:if test="${paging.page < paging.maxPage}">

								<a href="movieList?page=${paging.page+1}&limit=${paging.limit}">다음<i
									class="fas fa-angle-double-right"></i></a>

							</c:if>
						</div>





					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ==========Movie-Section========== -->
	<!-- ==========Newslater-Section========== -->
	<footer class="footer-section">
		<div class="container">
			<div class="footer-top">
				<div class="logo">
					<a href="index-1.html"><img
						src="./resources/assets/images/footer/footer-logo.png"
						alt="footer"></a>
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
</html>