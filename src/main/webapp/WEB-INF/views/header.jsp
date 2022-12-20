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
<link rel="stylesheet"
	href="resources/assets/css/jquery.animatedheadline.css">
<link rel="stylesheet" href="resources/assets/css/main.css">
<link rel="shortcut icon" href="resources/assets/images/favicon.png"
	type="image/x-icon">
<title>header</title>
<style>
.header-button1 {
	background-image: -webkit-linear-gradient(169deg, #5560ff 17%, #aa52a1 63%, #ff4343 100%);
	padding: 10px 49px;
	font-weight: 600;
	border-radius: 25px;
	display: inline-block;
	-webkit-box-shadow: 0px 10px 15px 0px rgba(59, 55, 188, 0.5);
	box-shadow: 0px 10px 15px 0px rgba(59, 55, 188, 0.5);
	width: 100px;
	text-align: center;
}
</style>
</head>
<body>

	<!-- ==========Header-Section========== -->

	<c:choose>


		<c:when test="${userId!=null}">
			<header class="header-section">
				<div class="container">


					<div class="header-wrapper">
						<div class="logo">
							<a href="index"><img
								src="./resources/assets/images/logo/logo.png" alt="logo"></a>
						</div>



						<ul class="menu">

							<li style="width: 200px;"><a href="movieList">영화목록</a></li>

							<li style="width: 200px;"><a href="forSearchTicket">예매하기</a>
							</li>

							<li style="width: 200px;"><a href="CS?userId=${userId}">고객센터</a></li>






							<li><a class="header-button1" href="#">${userId}</a>
								<ul class="submenu">
									<li><a href="memberMyView?userId=${userId}">내정보</a></li>
									<li><a href="memberLogout">로그아웃</a></li>
								</ul></li>
						</ul>
						<div class="header-bar d-lg-none">
							<span></span><span></span><span></span>
						</div>

					</div>




				</div>
			</header>
		</c:when>
		<c:otherwise>
			<header class="header-section">
				<div class="container">
					<div class="header-wrapper">
						<div class="logo">
							<a href="index"><img
								src="./resources/assets/images/logo/logo.png" alt="logo"></a>
						</div>


						<ul class="menu">
							<li style="width: 200px;"><a href="movieList">영화목록</a></li>

							<li style="width: 200px;"><a href="forSearchTicket">예매하기</a>
							</li>

							<li style="width: 200px;"><a href="CS">고객센터</a></li>






							<li><a class="header-button1" href="loginForm">로그인</a>
								<ul class="submenu">
									<li><a href="loginForm">로그인</a></li>
									<li><a href="JoinForm">회원가입</a></li>
								</ul></li>
						</ul>

						<div class="header-bar d-lg-none">
							<span></span><span></span><span></span>
						</div>
					</div>
				</div>
			</header>
		</c:otherwise>
	</c:choose>
	<!-- ==========Header-Section========== -->
</body>
</html>