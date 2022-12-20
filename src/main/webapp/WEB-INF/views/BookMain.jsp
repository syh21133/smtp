<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>예매하기</title>
<style>
.scrollToTop {
	height: 55px;
	width: 110px;
	background: rgb(0, 18, 50);
}

.scrollToTop.active {
	height: 55px;
	width: 110px;
}

.scrollforinner {
	background: #31d7a9;
	float: right;
	margin: 5px;
	width: 45px;
	height: 45px;
}

.ifmouseup {
	height: 350px;
}

.ifmouseup>img {
	position: absolute;
}

.ifmouseup>.moviebuttonbox {
	display: none;
	position: relative;
	background-color: rgba(100, 100, 100, 0.5);
	text-align: center;
	/* vertical-align: middle; */
	width: 100%;
	height: 350px;
}

.ifmouseup:hover>.moviebuttonbox {
	display: block;
}

.forverticalmiddle {
	height: 110px;
	width: 70%;
}

.forverticalmiddle2 {
	height: 20px;
	width: 70%;
}

.moviebutton, .ticketbutton {
	width: 70%;
}

.forselectdate {
	width: 170px;
	color: white;
}

.forselectdate::before {
	content: attr(data-placeholder);
	width: 100%;
}

.forselectdate:focus::before, .forselectdate:valid::before {
	display: none;
}

.select-bar1 {
	width: 100%;
	background-color: #ffffff;
	border: 1px solid #2d4186;
	outline: none;
	border-radius: 4px;
	height: 50px;
	color: #dbe2fb;
	cursor: pointer;
	text-transform: none;
	background: transparent;
	border: none;
	color: #ffffff;
	font-size: 10px;
	font-family: inherit;
	font-size: 100%;
	line-height: 1.15;
	margin: 0;
}

.select-bar1 option {
	background: black;
	color: #fff;
	padding: 3px 0;
	<
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
	<div class="scrollToTop">
		<div class="scrollforinner">
			<a href="#0"><i class="fas fa-angle-up"></i></a>
		</div>
		<div class="scrollforinner">
			<a href="" onclick="useform()"><i class="fas fa-search"></i></a>
		</div>
	</div>
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
					예매하기
				</h1>
				<p>영화 예매</p>
			</div>
		</div>
	</section>
	<!-- ==========Banner-Section========== -->
	<!-- ==========Ticket-Search========== -->
	<!-- 여기서부터 -->

	<section class="book-section bg-one">
		<div class="container">
			<form class="ticket-search-form two" action="ticketBook" name="ticketBook" onsubmit="return false">
				<input type="hidden" name="ticTitle" value="${mvtitle}" />
				<div class="form-group large">
					<input type="text" placeholder="Search fo Movies" id="keyword">
					<button type="button" onclick="useform()">
						<i class="fas fa-search"></i>
					</button>
				</div>
				<div class="form-group ">
					<div class="thumb">
						<img src="./resources/assets/images/ticket/city.png" alt="ticket">
					</div>
					<span class="type">지역</span> <select class="select-bar1"
						id="ciRegion" name="ciRegion" onchange="a()">
						<option value="all">all</option>
						<c:forEach var="list" items="${region}">
							<option value="${list.ciRegion}">${list.ciRegion}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group" id="a"></div>

				<div class="form-group" id="b"></div>
			</form>
		</div>
	</section>
	<!-- ==========Ticket-Search========== -->

	<!-- ==========Movie-Section========== -->
	<form action="forSearchTicket" name="forSearchTicketController">
		<input type="hidden" name="ciRegion" id="hiddenciRegion" value="all">
		<input type="hidden" name="ticDate" id="hiddenticDate" value="all">
		<input type="hidden" name="ciName" id="hiddenciName" value="all">
		<input type="hidden" name="keyword" id="hiddenkeyword" value="">
		<section class="movie-section padding-top padding-bottom">
			<div class="container">
				<div class="row flex-wrap-reverse justify-content-center">
					<div class="col-sm-10 col-md-8 col-lg-3">
						<div class="widget-1 widget-banner">
							<div class="widget-1-body">
								<a href="#0"><img
									src="./resources/assets/images/banner/banner01.jpg"
									alt="banner"></a>
							</div>
						</div>
						<div class="widget-1 widget-check">
							<div class="widget-header">
								<h5 class="m-title">Filter By</h5>
								<a href="#0" class="clear-check">Clear All</a>
							</div>
							<div class="widget-1-body">

								<h6 class="subtitle">genre</h6>
								<div class="check-area">
									<div class="form-group">
										<input type="checkbox" name="genre" id="genre1" value="스릴러">
										<label for="genre1">스릴러</label>
									</div>
									<div class="form-group">
										<input type="checkbox" name="genre" id="genre2" value="멜로">
										<label for="genre2">멜로</label>
									</div>
									<div class="form-group">
										<input type="checkbox" name="genre" id="genre3" value="로맨스">
										<label for="genre3">로맨스</label>
									</div>
									<div class="form-group">
										<input type="checkbox" name="genre" id="genre4" value="드라마">
										<label for="genre4">드라마</label>
									</div>
									<div class="form-group">
										<input type="checkbox" name="genre" id="genre5" value="애니메이션">
										<label for="genre5">애니메이션</label>
									</div>
									<div class="form-group">
										<input type="checkbox" name="genre" id="genre6" value="액션">
										<label for="genre6">액션</label>
									</div>
									<div class="form-group">
										<input type="checkbox" name="genre" id="genre7" value="모험">
										<label for="genre7">모험</label>
									</div>
									<div class="form-group">
										<input type="checkbox" name="genre" id="genre8" value="SF">
										<label for="genre8">SF</label>
									</div>
									<div class="form-group">
										<input type="checkbox" name="genre" id="genre9" value="미스터리">
										<label for="genre9">미스터리</label>
									</div>
									<div class="form-group">
										<input type="checkbox" name="genre" id="genre10" value="공포">
										<label for="genre10">공포</label>
									</div>
									<div class="form-group">
										<input type="checkbox" name="genre" id="genre11" value="코미디">
										<label for="genre11">코미디</label>
									</div>
								</div>
								<div class="add-check-area">
									<a href="#0">view more <i class="plus"></i></a>
								</div>

							</div>
						</div>

						<div class="widget-1 widget-banner">
							<div class="widget-1-body">
								<a href="#0"><img
									src="./resources/assets/images/banner/banner02.jpg"
									alt="banner"></a>
							</div>
						</div>
					</div>
					<div class="col-lg-9 mb-50 mb-lg-0">
						<div class="filter-tab tab">
							<div class="filter-area">
								<div class="filter-main">
									<div class="left">
										<div class="item">
											<span class="show">Show :</span><select class="select-bar"
												name="limit">
												<option value="12">12</option>
												<option value="15">15</option>
												<option value="18">18</option>
												<option value="21">21</option>
												<option value="24">24</option>
												<option value="27">27</option>
												<option value="30">30</option>
											</select>
										</div>
										<div class="item">
											<span class="show">Sort By :</span><select class="select-bar"
												name="methodForSort">
												<option value="sort_title">가나다순</option>
												<option value="sort_view">관람객순</option>
												<option value="sort_date">최근개봉일</option>
												<option value="sort_mvgrade">관람등급</option>
											</select>
										</div>
									</div>

									<!-- 여기가 보기방식 -->
									<ul class="grid-button tab-menu">
										<li id="forarraysort" onclick="fa_th()"><i
											class="fas fa-th"></i></li>
										<li class="active" onclick="fa_bars()"><i
											class="fas fa-bars"></i></li>
									</ul>
									<input type="hidden" name="methodarray" id="methodarray"
										value="1">
								</div>
							</div>
							<div class="tab-area">
								<div class="tab-item">
									<div class="row mb-10 justify-content-center">
										<!-- 여기부터 영화 목록-->
										<c:forEach var="list" items="${pagingList}">

											<div class="col-sm-6 col-lg-4">
												<div class="movie-grid">
													<div class="movie-thumb c-thumb ifmouseup">
														<img
															src="./resources/folderforproject/images/poster/${list.mvFilename}"
															alt="movie">
														<div class="moviebuttonbox">
															<div class="forverticalmiddle"></div>
															<input type="button" class="moviebutton" value="상세보기"
																onclick="location.href='mvView?mvTitle=${list.mvTitle}'">

															<c:choose>
																<c:when test="${userId eq null}">
																</c:when>
																<c:otherwise>
																	<div class="forverticalmiddle2"></div>
																	<input type="button" class="ticketbutton" value="예매하기"
																		onclick="location.href='mvBook?mvTitle=${list.mvTitle}'">
																</c:otherwise>
															</c:choose>
														</div>

													</div>
													<div class="movie-content bg-one">
														<h5 class="title m-0">
															<a href="">${list.mvTitle}</a>
														</h5>
														<ul class="movie-rating-percent">
															<li><div class="thumb">
																	<c:choose>
																		<c:when test="${list.mvGrade >= 19}">
																			<img
																				src="./resources/folderforproject/images/movie/grade19_shadow.png"
																				alt="movie" height="30px;">
																		</c:when>

																		<c:when test="${list.mvGrade >= 15}">
																			<img
																				src="./resources/folderforproject/images/movie/grade15_shadow.png"
																				alt="movie" height="30px;">
																		</c:when>

																		<c:when test="${list.mvGrade >= 12}">
																			<img
																				src="./resources/folderforproject/images/movie/grade12_shadow.png"
																				alt="movie" height="30px;">
																		</c:when>

																		<c:when test="${list.mvGrade >= 0}">
																			<img
																				src="./resources/folderforproject/images/movie/gradeAll_shadow.png"
																				alt="movie" height="30px;">
																		</c:when>

																		<c:otherwise>
																			<img
																				src="./resources/folderforproject/images/movie/gradeAnother_shadow.png"
																				alt="movie" height="30px;">
																		</c:otherwise>
																	</c:choose>
																</div> <c:if test="${list.mvGrade == 0}">
																	<span class="content">전체 관람가</span>
																</c:if> <c:if test="${list.mvGrade != 0 }">
																	<span class="content">${list.mvGrade}세 관람가</span>
																</c:if></li>
															<li><div class="thumb">
																	<img src="./resources/assets/images/movie/cake.png"
																		alt="movie" height="30px;">
																</div> <span class="content">${list.mvAttendence}명</span></li>
														</ul>
													</div>
												</div>
											</div>

										</c:forEach>
										<!-- 여기까지가 영화 목록 -->

										<c:forEach var="i"
											begin="${searchforticket.tiCount-(searchforticket.page-1)*searchforticket.limit}"
											end="${searchforticket.limit-1}" step="1">
											<div class="col-sm-6 col-lg-4">
												<div class="movie-grid"></div>
											</div>
										</c:forEach>
										<!-- 여기까지가 영화 각각의 내용 -->
									</div>
								</div>
								<!-- 여기부턴 배치방식이 바뀝니다. -->
								<div class="tab-item active">
									<div class="movie-area mb-10">
										<!-- 여기부터 영화 목록-->
										<c:forEach var="list" items="${pagingList}">
											<div class="movie-list">
												<div class="movie-thumb c-thumb">
													<a href="mvView?mvTitle=${list.mvTitle}"
														class="w-100 bg_img h-100"
														data-background="./resources/folderforproject/images/poster/${list.mvFilename}">
														<img class="d-sm-none"
														src="./resources/assets/images/movie/movie01.jpg"
														alt="movie">
													</a>
												</div>
												<div class="movie-content bg-one">
													<h5 class="title">
														<a href="mvView?mvTitle=${list.mvTitle}">${list.mvTitle}</a>
													</h5>
													<p class="duration">${list.hour}hrs${list.minutes}min</p>
													<div class="movie-tags">
														<a href="#0">장르 : ${list.mvGenre}</a><a href="#0">감독 :
															${list.mvDirector}</a>
													</div>
													<div class="release">
														<span>Release Date :</span><a href="#0">${list.mvDate}</a>
													</div>
													<ul class="movie-rating-percent">
														<li><div class="thumb">
																<c:choose>
																	<c:when test="${list.mvGrade >= 19}">
																		<img
																			src="./resources/folderforproject/images/movie/grade19_shadow.png"
																			alt="movie" height="30px;">
																	</c:when>

																	<c:when test="${list.mvGrade >= 15}">
																		<img
																			src="./resources/folderforproject/images/movie/grade15_shadow.png"
																			alt="movie" height="30px;">
																	</c:when>

																	<c:when test="${list.mvGrade >= 12}">
																		<img
																			src="./resources/folderforproject/images/movie/grade12_shadow.png"
																			alt="movie" height="30px;">
																	</c:when>

																	<c:when test="${list.mvGrade >= 0}">
																		<img
																			src="./resources/folderforproject/images/movie/gradeAll_shadow.png"
																			alt="movie" height="30px;">
																	</c:when>

																	<c:otherwise>
																		<img
																			src="./resources/folderforproject/images/movie/gradeAnother_shadow.png"
																			alt="movie" height="30px;">
																	</c:otherwise>
																</c:choose>
															</div> <c:if test="${list.mvGrade == 0}">
																<span class="content">전체 관람가</span>
															</c:if> <c:if test="${list.mvGrade != 0 }">
																<span class="content">${list.mvGrade}세 관람가</span>
															</c:if></li>
														<li><div class="thumb">
																<img src="./resources/assets/images/movie/cake.png"
																	alt="movie" height="30px;">
															</div> <span class="content">${list.mvAttendence}명</span></li>
													</ul>
													<div class="book-area">
														<div class="book-ticket">

															<c:choose>
																<c:when test="${userId eq null}">
																</c:when>
																<c:otherwise>
																	<div class="react-item mr-auto">
																		<a href="mvBook?mvTitle=${list.mvTitle}">
																			<div class="thumb">
																				<img src="./resources/assets/images/icons/book.png"
																					alt="icons">
																			</div> <span>book ticket</span>
																		</a>
																	</div>
																</c:otherwise>
															</c:choose>

														</div>
													</div>
												</div>
											</div>
										</c:forEach>
										<!-- 여기까지가 영화 목록 -->
										<c:forEach var="i" begin="${searchforticket.tiCount}"
											end="${searchforticket.limit-1}" step="1">
											<div class="movie-list"></div>
										</c:forEach>
										<!-- 여기까지가 영화 각각의 내용 -->
									</div>
								</div>
							</div>

							<div class="pagination-area text-center">
								<!-- [이전]페이지에 대한 처리 -->
								<c:if test="${searchforticket.page<=1}">
									<a><i class="fas fa-angle-double-left"></i><span>Prev</span></a>
								</c:if>
								<c:if test="${searchforticket.page>1}">
									<a
										href="forSearchTicket?ciRegion=${searchforticket.ciRegion}&ticDate=${searchforticket.ticDate}&ciName=${searchforticket.ciName}&methodForSort=${searchforticket.methodForSort}&
							${searchforticket.formvGenre}&
							keyword=${searchforticket.keyword}&page=${searchforticket.page-1}&limit=${searchforticket.limit}&methodarray=${searchforticket.methodarray}">
										<i class="fas fa-angle-double-left"></i><span>Prev</span>
									</a>
								</c:if>

								<c:forEach var="i" begin="${searchforticket.startPage}"
									end="${searchforticket.endPage}" step="1">
									<c:choose>
										<c:when test="${searchforticket.page==i}">
											<a class="active">${i}</a>
										</c:when>
										<c:otherwise>
											<a
												href="forSearchTicket?ciRegion=${searchforticket.ciRegion}&ticDate=${searchforticket.ticDate}&ciName=${searchforticket.ciName}&methodForSort=${searchforticket.methodForSort}&${searchforticket.formvGenre}&keyword=${searchforticket.keyword}&page=${i}&limit=${searchforticket.limit}&methodarray=${searchforticket.methodarray}">${i}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${searchforticket.page>=searchforticket.maxPage}">
									<a><span>Next</span><i class="fas fa-angle-double-right"></i></a>
								</c:if>
								<c:if test="${searchforticket.page<searchforticket.maxPage}">
									<a
										href="forSearchTicket?ciRegion=${searchforticket.ciRegion}&ticDate=${searchforticket.ticDate}&ciName=${searchforticket.ciName}&methodForSort=${searchforticket.methodForSort}&${searchforticket.formvGenre}&keyword=${searchforticket.keyword}&page=${searchforticket.page+1}&limit=${searchforticket.limit}&methodarray=${searchforticket.methodarray}">
										<span>Next</span><i class="fas fa-angle-double-right"></i>
									</a>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</form>
	<!-- ==========Movie-Section========== -->
	<!-- ==========Newslater-Section========== -->
	<footer class="footer-section">
		<div class="container">
			<div class="footer-top">
				<div class="logo">
					<a href=""><img
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
	<script src="https://code.jquery.com/jquery-3.6.1.js"
		integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
		crossorigin="anonymous">
		
	</script>
	<script>
		let ondate = false;
		let onname = false;
		
		
		//검색하기 버튼을 클릭하면 작동합니다.
		function useform() {
			console.log('검색하기');
			//지역 가져오기
			let ciRegion = $("#ciRegion").val();

			//날짜 선택창이 열렸다면 작동
			//날짜 가져오기
			if (ondate) {
				let ticDate = $("#ticDate").val();
				document.getElementById("hiddenticDate").value = ticDate;
			}

			//영화관 선택창이 열렸다면 작동
			//영화관이름 가져오기
			if (onname) {
				let ciName = $("#ciName").val();
				document.getElementById("hiddenciName").value = ciName;
			}
			//키워드 가져오기
			let keyword = $("#keyword").val();
			document.getElementById("hiddenciRegion").value = ciRegion;

			document.getElementById("hiddenkeyword").value = keyword;
			//form태그의 submit이 작동합니다.
			forSearchTicketController.submit();
		}
		
		//enter키 누르면 검색
		$("#keyword").keyup(function(e){if(e.keyCode == 13){
			useform();
		}});
		
		//지역값을 가져옵니다.
		//ciRegion1을 실행합니다.
		function a() {
			let ciRegion = $("#ciRegion").val();
			$.ajax({
				type : "POST",
				url : "ciRegion",
				data : {
					"ciRegion" : ciRegion
				},
				dataType : "json",
				success : function(result) {
					ciRegion1(result, ciRegion)
				},
				error : function() {
					alert("실패")
				}
			});
		}
		
		//enter키 누르면 검색
		$("#id").keyup(function(e){if(e.keyCode == 13) useform });
		//a에서 ajax가 작동되면 id="a"에 추가합니다.
		function ciRegion1(List, ciRegion) {
			onname = true;
			let output = "";
			if (ciRegion == '-') {
				output += "<div></div>"
			} else {
				output += "<div class='thumb'>";
				output += "<img src='./resources/assets/images/ticket/date.png' alt='ticket'></div>";
				output += "<span class='type'>영화관</span>";
				output += "<select class='select-bar1'id='ciName' name='ciName' onchange='b()'>"
				output += "<option value='all'></option>";
				for ( let i in List) {
					output += "<option value="+List[i].ciName+">"
							+ List[i].ciName + "</option>";
				}
				output += "</select>";
			}
			document.getElementById("a").innerHTML = output;
			document.getElementById("b").innerHTML = "<div></div>";
			document.getElementById("c").innerHTML = "<div></div>";
		}

		//지역, 영화관을 가져옵니다.
		//ciRegion1을 실행합니다.
		function b() {
			let ciName = $("#ciName").val();
			let ciRegion = $("#ciRegion").val();

			console.log(ciName)

			$.ajax({
				type : "POST",
				async : false,
				url : "ciName2",
				data : {
					"ciName" : ciName,
					"ciRegion" : ciRegion
				},
				dataType : "json",
				success : function(result) {
					ciDate(result)
				},
				error : function() {
					let output = "";
					output += "<div></div>"
					document.getElementById("b").innerHTML = output;
					document.getElementById("c").innerHTML = "<div></div>";
				}
			});
		}
		function ciDate(List) {
			ondate = true;
			console.log(ciName)

			let output = "";
			output += "<div class='thumb'>";
			output += "<img src='./resources/assets/images/ticket/date.png' alt='ticket'></div>";
			output += "<span class='type'>날짜</span>";
			output += "<select class='select-bar1' id='ticDate' >";
			output += "<option value='all'>-</option>";

			for ( let i in List) {

				output += "<option value="+List[i].ticDate+" value2="+List[i].tcinemaNum+">"
						+ List[i].ticDate + "</option>";
			}
			output += "</select>";
			document.getElementById("b").innerHTML = output;
			document.getElementById("c").innerHTML = "<div></div>";
		}
	</script>
</body>
</html>