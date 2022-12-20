<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
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
<title>영화 상세보기</title>
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
	
	
	<!-- 헤더쪽 시작 -->
	<section class="details-banner bg_img"
		data-background="./resources/folderforproject/images/poster/${mvPoster[0].poFilename}">
		<div class="container">
			<div class="details-banner-wrapper">
				<div class="details-banner-thumb">
				
					<img src="./resources/folderforproject/images/poster/${mvPoster[0].poFilename}" alt="movie">
						<a href="https://www.youtube.com/watch?v=${mvTeaser[0].teaFilename}"
											class="video-popup"> <img
											src="./resources/assets/images/movie/video-button.png"
											alt="movie">
										</a>
						
				</div>
				<div class="details-banner-content offset-lg-3">
					<h3 class="title">${movie.mvTitle}</h3>
					<div class="tags">감독 : ${movie.mvDirector}</div>
					<a  class="button">${movie.mvGenre}</a>
					<div class="social-and-duration">
						<div class="duration-area">
							<div class="item">
								<i class="fas fa-calendar-alt"></i><span>개봉일 : ${movie.mvDate}</span>
							</div>
							<div class="item">
								<i class="far fa-clock"></i><span>러닝 타임 : ${movie.mvTime}분</span>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 헤더쪽 끝 -->
	
	
	
	<!-- ==========Banner-Section========== -->
	
	
	<!-- ==========예매하기 버튼있는 div-Section========== -->
	<section class="book-section bg-one">
		<div class="container">
			<div class="book-wrapper offset-lg-3">
				
				
				<!-- 관람 등급, 누적 관객수 시작 -->
				<div class="left-side">
					
					<div class="item">
					<p>관람 등급</p>
						<div class="item-header">
							<div class="thumb">
								<c:choose>
									<c:when test="${movie.mvGrade >= 19}">
										<img src="./resources/folderforproject/images/movie/grade19_shadow.png" alt="movie">
									</c:when>
									
									<c:when test="${movie.mvGrade >= 15}">
										<img src="./resources/folderforproject/images/movie/grade15_shadow.png" alt="movie">
									</c:when>
									
									<c:when test="${movie.mvGrade >= 12}">
										<img src="./resources/folderforproject/images/movie/grade12_shadow.png" alt="movie">
									</c:when>
									
									<c:when test="${movie.mvGrade >= 0}">
										<img src="./resources/folderforproject/images/movie/gradeAll_shadow.png" alt="movie">
									</c:when>
									
									<c:otherwise>
										<img src="./resources/folderforproject/images/movie/gradeAnother_shadow.png" alt="movie">
									</c:otherwise>
								</c:choose>
							</div>
							<div class="counter-area">
							
								<c:if test= "${movie.mvGrade == 0}" >
								<span class="content">전체 관람가</span>
								</c:if>
								
								<c:if test= "${movie.mvGrade != 0 }">
								<span class="content">${movie.mvGrade}세 관람가</span>
								</c:if>
							</div>
						</div>
						
					</div>
					
					<div class="item">
					<p>누적 관객 수</p>
						<div class="item-header">
							<div class="thumb">
								<img src="./resources/assets/images/movie/cake2.png" alt="movie">
							</div>
							<div class="counter-area">
								<span class="content">${movie.mvAttendence}명</span>
							</div>
						</div>
						
					</div>
					
				</div>
				<!-- 관람 등급, 누적 관객수 끝 -->
				
				
				<a href="#" onclick="mvBook();" class="custom-button">예매하기</a>
			</div>
		</div>
	</section>
	<!-- ==========End Book-Section========== -->
	
	
	
	
	<!-- ==========Start Movie-Section========== -->
	<section class="movie-details-section padding-top padding-bottom">
		<div class="container">
			<div class="row justify-content-center flex-wrap-reverse mb--50">
				
				<!-- divlv1 -->
				<!-- sidebar 예고편 -->
				<div class="col-lg-3 col-sm-10 col-md-6 mb-50">
					<div class="widget-1 widget-tags"></div>
					<div class="widget-1 widget-offer">
						<h3 class="title">예고편</h3>

						<c:forEach var="teaList" items="${mvTeaser}" varStatus="stn">
							<div class="offer-body">
								<div class="offer-item">
									<div class="thumb" style="position:relative">
									<a href="https://www.youtube.com/watch?v=${teaList.teaFilename}"
											class="video-popup">
										<img src="https://img.youtube.com/vi/${teaList.teaFilename}/mqdefault.jpg"
											alt="movie"> </a>
											
										<a href="https://www.youtube.com/watch?v=${teaList.teaFilename}"
											class="video-popup" style="position:absolute; top:70px; left:100px;"> <img
											src="./resources/assets/images/movie/button.png"
											alt="movie">
										</a>
									</div>
									<div class="content">
										<h6>
											<a href="#0">"${movie.mvTitle}" Teaser ${stn.count}</a>
										</h6>
									</div>
								</div>
							</div>
						</c:forEach>

					</div>

					<!-- 
					<div class="widget-1 widget-banner">
						<div class="widget-1-body">
							<a href="#0"><img
								src="./resources/assets/images/sidebar/banner/banner01.jpg" alt="banner"></a>
						</div>
					</div>
					 -->

				</div>
				<!-- End sidebar 예고편 -->


				
				<!-- col-lg-9 mb-50 div 시작 -->
				<!-- divlv1 -->
				<div class="col-lg-9 mb-50">
					
					
					<!-- divlv2 -->
					<div class="movie-details">
						<h3 class="title">포스터</h3>
						<!-- divlv3 -->
						<div class="details-photos owl-carousel">
							<!-- divlv4 -->	
							<c:forEach var="list" items="${mvPoster}">
								<div class="thumb">
									<a href="./resources/folderforproject/images/poster/${list.poFilename}"
										class="img-pop"> <img
										src="./resources/folderforproject/images/poster/${list.poFilename}"
										alt="movie" width="200px" height="350px">
									</a>
								</div>
							</c:forEach>
						</div>
						
						
						<!-- divlv3 -->
						<div class="tab summery-review">
							<ul class="tab-menu">
								<li class="active">영화 정보</li>
								<li>리뷰<span id="reviewCnt"></span></li>
							</ul>
							
							
							<!-- divlv4 -->
							<div class="tab-area">
							
								
								<!-- 영화 정보 -->
								<div class="tab-item active">
									
									<!-- 줄거리 -->
									<div class="item">
										<h5 class="sub-title">줄거리</h5>
										<p>${movie.mvContent}</p>
									</div> <!-- End 줄거리 -->
									
									<!-- 출연배우 -->
									<div class="item">
										<div class="header">
											<h5 class="sub-title">출연배우</h5>
											<!-- divlv8 -->
											<div class="navigation">
												<!-- divlv9 -->
												<div class="cast-prev">
													<i class="flaticon-double-right-arrows-angles"></i>
												</div>
												<!-- divlv9 -->
												<div class="cast-next">
													<i class="flaticon-double-right-arrows-angles"></i>
												</div>
											</div>
										</div>
										<!-- divlv7 -->
										<div class="casting-slider owl-carousel">
											<!-- divlv8 -->
											<c:forEach var="list" items="${actorList}">

												<div class="cast-item">
													<div class="cast-thumb">
														<a href="./resources/folderforproject/images/cast/${list.acFile}"
															 class="img-pop"> 
															 <img src="./resources/folderforproject/images/cast/${list.acFile}" alt="cast">
														</a>
													</div>
													<div class="cast-content">
														<h6 class="cast-title">
															<span>${list.acName}</span>
														</h6>
													</div>
												</div>

											</c:forEach>
											<!-- divlv8 -->
										</div><!-- divlv7 -->
									</div><!-- End 출연배우 -->
								</div><!-- End 영화 정보 -->

							
								<!-- 리뷰 -->
								<div class="tab-item">
									
									<!-- 리뷰 작성란 -->
									<div class="blog-comment">
										<div class="leave-comment">
											<h5 class="title">리뷰를 남겨주세요!</h5>
											
											<form class="blog-form">
												<input type="hidden" value="${movie.mvTitle}" id="mvTitle">
												<input type="hidden" value="${userId}" id="rvId">	<!-- 여기 value값에 로그인 아이디  -->
												
												<div class="form-group">
													<textarea id="rvContent" placeholder="영화의 감상평을 남겨주세요." required=""></textarea>
												</div>
											
												<div class="form-group">
													<div class="filter-area">
														<div class="filter-main">
															<div class="left">
																<div class="item">
																	<span class="show">영화 평점 : </span>
																	<select class="select-bar" name="rvGrade" id="rvGrade">
																		<option value="1">1</option>
																		<option value="2">2</option>
																		<option value="3">3</option>
																		<option value="4">4</option>
																		<option value="5" selected>5</option>
																	</select>
																</div>
																<input type="button" onclick="reviewWrite()" value="리뷰 작성">
															</div>
															
														</div>
													</div>
												</div>
												
											</form>
										</div>
									</div>
									

									<!-- 리뷰 샘플 -->
									<div class="movie-review-item" id="rvComment" style="overflow:auto; width:850px; height:450px;">
										
									</div><!-- End 리뷰 샘플 -->
									
									<!-- 여기 페이징처리 할 예정 -->
									<!--
									<div class="pagination-area text-center">
										<a href="#0"><i class="fas fa-angle-double-left"></i><span>Prev</span></a>
										<a href="#0">1</a>
										<a href="#0">2</a>
										<a href="#0" class="active">3</a>
										<a href="#0">4</a>
										<a href="#0">5</a>
										<a href="#0"><span>Next</span><i class="fas fa-angle-double-right"></i></a>
									</div>
									-->
								
								</div><!-- End 리뷰 -->

							</div><!-- End tab area -->

						</div><!-- End tab summery view -->
						
					</div><!-- End movie-details -->
					
				</div><!-- divlv1 -->
				<!-- End col-lg-9 mb-50 -->
				
				
				
				
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

<!-- jQuery 사용을 위한 import -->
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous">
</script>

<script>
	// 리뷰 불러오기 ajax
	let mvTitle = '${movie.mvTitle}';
	
	$.ajax({
		type : "GET",
		url : "reviewList",
		data : {
			"mvTitle" : mvTitle
		},
		dataType : "json",
		success : function(list){
			reviewList(list);
			reviewCnt();
		},
		error : function(){
			alert("댓글 불러오기 통신 실패");
		}
	});
	
	// 리뷰 갯수 불러오기
	function reviewCnt(){
		let output = "";
		let rvTitle = $("#mvTitle").val();
		
		// 리뷰 갯수 불러오기 ajax
		$.ajax({
			type : "GET",
			url : "reviewCnt",
			data : {
				"mvTitle" : rvTitle
			},
			dataType : "json",
			success : function(cnt){
				output += cnt;
				document.getElementById("reviewCnt").innerHTML = output;
			},
			error : function(){
				alert("리뷰 갯수 가져오기 실패");
			}
		});
		
	}
	
	// 리뷰 불러오기 함수
	function reviewList(list){
		let output = "";
		
		for(let i in list){
			output += "<div class='author' style='margin-bottom: 20px;'>";
			output += "<div class='thumb'>";					// 여기 유저 프로필
			output += "<a href='#0'><img src='../resources/proFile/"+list[i].userProfileName+"' alt='cast'></a>";
			output += "</div>";
			output += "<div class='movie-review-info'>";
			output += "<span class='reply-date'>"+list[i].rvDate+"</span>";
			output += "<h6 class='subtitle'><a href='#0'>"+list[i].rvId+"</a></h6>";
			
			// 수정,삭제
			if(list[i].rvId == '${userId}' || '${userId}' == 'admin'){
				output += "<span class='reply-date'>"
				output += "<input type='button' value='리뷰삭제' onclick='rvDelete(\""+list[i].rvTitle+"\","+list[i].rvNum+")' style='width:70px; height:30px'>";
				output += "</span>";
			}
			// End 수정, 삭제 
			
			output += "</div>";
			output += "</div>";
			
			output += "<div class='movie-review-content'>";
			output += "<div class='review' style='margin-bottom: 10px;'>";
			
			for(let j=1; j<=list[i].rvGrade; j++){
				output += "<i class='flaticon-favorite-heart-button'></i>";				
			}
			output += "</div>";
			
			output += "<span class='reply-date'>";
			output += "<p>"+list[i].rvContent+"</p>";
			output += "</span>";
			
			output += "</div>";
		}
		
		document.getElementById("rvComment").innerHTML = output;
	}
	
	// 리뷰 작성 함수
	function reviewWrite(){
		let rvTitle = $("#mvTitle").val();
		let rvContent = $("#rvContent").val();
		let rvGrade = $("#rvGrade").val();
		let rvId = $("#rvId").val();					// 향후 로그인된 세션 아이디 넣어야됨
		
		//console.log(mvTitle);
		//console.log(rvContent);
		//console.log(rvGrade);
		//console.log(rvId);
		
		// 로그인 아이디가 존재할 경우
		if(rvId != ""){
			
			if(rvContent != ""){
				$.ajax({
					type : "POST",
					url : "rvWrite",
					data :{
						"rvTitle" : rvTitle,
						"rvContent" : rvContent,
						"rvGrade" : rvGrade,
						"rvId" : rvId
					},
					dataType : "json",
					success : function(list){
						reviewList(list);
						reviewCnt();
						$("#rvContent").val("");
					},
					error : function(){
						alert('리뷰 작성 실패');
					}
				});				
			}
		} else {
			alert('로그인 후 사용해주시기 바랍니다.');
		}
	}
	
	// 리뷰 삭제 함수
	function rvDelete(rvTitle, rvNum) {
		let result = confirm('리뷰를 삭제 하시겠습니까?');
		
		if(result){
			$.ajax({
				type : "POST",
				url : "rvDelete",
				data :{
					"rvTitle" : rvTitle,
					"rvNum" : rvNum
				},
				dataType : "json",
				success : function(list){
					reviewList(list);
					reviewCnt();
				},
				error : function(){
					alert('리뷰 삭제 실패');
				}
			});			
		}
	}
	
	function mvBook(){
		
		if(${userId eq null}){
			
			alert('로그인 후 이용해 주세요.')
			location.href='loginForm'
			
		}else{
			
			location.href='mvBook?mvTitle=${movie.mvTitle}'
		}
	}
	
	
	
	
</script>




</html>