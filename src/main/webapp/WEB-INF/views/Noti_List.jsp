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
<title>공지사항</title>
<style>
.span1{
overflow: hidden; 
text-overflow: ellipsis; 
white-space: nowrap;
width:200px;
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
	<%@include file="../views/header.jsp" %>
	<!-- ==========Header-Section========== -->
	<!-- ==========Banner-Section========== -->
	<section class="main-page-header speaker-banner bg_img"
		data-background="./resources/assets/images/banner/banner07.jpg">
		<div class="container">
			<div class="speaker-banner-content">
				<h2 class="title">공지사항</h2>
				<ul class="breadcrumb">
					<li><a href="index">Home</a></li>
					<li><a href="">고객센터</a></li>
					<li>공지사항</li>
				</ul>
			</div>
		</div>
	</section>
	<!-- ==========Banner-Section========== -->
	<!-- ==========Blog-Section========== -->
	<section class="blog-section padding-top padding-bottom">
		<div class="container">
			<div class="row justify-content-center mb-30-none">
				<div class="col-lg-8 mb-50 mb-lg-0">
					<article>
						
						<div class="blog-author">
							
							<div class="author-content">
								<h5 class="title">ICIA
								</h5>
								<p>공지사항입니다.</p>
							</div>
						</div>
						
						<!-- 공지사항 목록 -->
						<div class="blog-comment">
							<h5 class="title">공지사항 목록</h5>
							<ul class="comment-area">
								<!-- 공지사항 샘플 -->
								<c:forEach var="list" items="${notice}" varStatus="stn">
								<li>
									<input type="hidden" value="${list.notiNum}" name="notiNum" id="notiNum">
									<input type="hidden" value="${list.notiContent}" name="notiContent" id="notiContent">
									
									<div class="blog-content" style="width:100%">
										
											<span>${paging.count - ((paging.page - 1)*paging.limit + stn.count)}&nbsp; </span>
											<a href="notiView?notiNum=${list.notiNum}" class="span1">${list.notiTitle}</a>
										
										
										<span style="float:right;">
										<i class="far fa-clock"></i>
										<span>${list.notiDate}&nbsp;</span>
										</span>
										
										
									</div>
									
									
								</li>
								</c:forEach><!-- End 공지사항 샘플 -->
							</ul>
							
							<!-- 페이징처리 -->
							<div class="pagination-area text-center">
							
								<!-- 이전 페이지 처리 -->
								<c:if test="${paging.page <= 1}">
									<a><i class="fas fa-angle-double-left"></i><span>이전</span></a>
								</c:if>
								<c:if test="${paging.page > 1}">
									<a href="Noti_List?page=${paging.page -1}&limit=${paging.limit}&category=${category}&keyword=${keyword}"><i class="fas fa-angle-double-left"></i><span>이전</span></a>
								</c:if>
								
								<!-- 페이지번호에 대한 처리 -->
								<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
									<c:choose>
										<c:when test="${paging.page == i}">
											<a href="#0" class="active">${i}</a>
										</c:when>
										
										<c:otherwise>
											<a href="Noti_List?page=${i}&limit=${paging.limit}">${i}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								
								<!-- 다음 페이지 처리 -->
								<c:if test="${paging.page >= paging.maxPage}">
									<a href="#0"><span>다음</span><i class="fas fa-angle-double-right"></i></a>
								</c:if>
								<c:if test="${paging.page < paging.maxPage}">
									<a href="Noti_List?page=${paging.page + 1}&limit=${paging.limit}"><span>다음</span><i class="fas fa-angle-double-right"></i></a>	
								</c:if>
								
							</div><!-- End 페이징처리 -->
							
						</div><!-- End 공지사항 목록 -->
					</article>
				</div>
				
				<!-- 사이드바 -->
				<div class="col-lg-4 col-sm-10 col-md-8">
					<aside>
					
						<!-- 검색처리 예정 -->
						<div class="widget widget-search">
							<h5 class="title">공지사항 검색</h5>
							
							<!-- 검색 form -->
							<form class="search-form">
								<input type="text" name="keyword" id="keyword" placeholder="검색하실 키워드를 입력하세요" style="margin-bottom: 15px" required>

								<div class="filter-main">
									<div class="left w-100 justify-content-between">
										<div class="item" style="margin-bottom: 20px">
											<span class="show">검색 조건 :</span>
											<select class="select-bar" name="category" id="category" style="display: none;">
												<option value="제목">제목</option>
												<option value="제목,내용" selected>제목+내용</option>
												<!-- 문의, 자주찾는질문에서는 추가
												<option value="작성자">작성자</option>
												 -->
											</select>
										</div>
									</div>
								</div>
								
								<button type="button" onclick="search()">
									<i class="flaticon-loupe"></i>검색
								</button>

							</form><!-- End form -->
						</div><!-- End 검색처리 -->
						
						<!-- 공지작성(관리자) -->
						<c:if test="${userId == 'admin'}">
						<div class="widget widget-search">
							<button onclick="location.href='notiWriteForm?userId=${userId}'">공지 작성</button>
						</div>
						</c:if><!-- End 공지작성(관리자) -->
						
					</aside><!-- End 사이드바 -->
				</div><!-- End 사이드바 div -->
				
			</div>
		</div>
	</section>
	<!-- ==========Blog-Section========== -->
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
</body>


<!-- jQuery 사용을 위한 import -->
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous">
</script>

<script>
	
	function search(){
		let category = $("#category").val();
		let keyword = $("#keyword").val();
		
		location.href = "Noti_List?category="+category+"&keyword="+keyword;
	}
	
</script>







</html>