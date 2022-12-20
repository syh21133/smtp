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
<style>

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
	<!-- ==========Sign-In-Section========== -->
	<section class="account-section bg_img"
		data-background="./resources/assets/images/account/account-bg.jpg">
		<div class="container">
			<div class="padding-top padding-bottom">
				<div class="account-area">
					<div class="section-header-3">
						<span class="cate">hello</span>
						<h2 class="title">welcome back</h2>
					</div>
					
					<form>
						<div class="form-group">
							<label for="email2">아이디<span>*</span></label><input type="text"
								placeholder="아이디 입력" name="userId" id="userId" required>
						</div>
						<div class="form-group">
							<label for="pass3">비밀번호<span>*</span></label><input
								type="password" placeholder="Password" name="userPw" id="userPw" required><br/>
								<span id="check1"></span>
						</div>
						<div class="form-group checkgroup" style="text-align:center;">
							<label for="Cookie" >로그인 정보 저장</label>
							<input type="checkbox" id="loginCookie" required checked>		
						</div>
						
						<div class="form-group text-center">
							<input type="button" onclick="login1()" id="login" value="로그인" style="background-image: -webkit-linear-gradient(169deg, #5560ff 17%, #aa52a1 63%, #ff4343 100%); font-size:20px;">
						</div>
					</form>
					<div class="option">
						계정이 없습니까? <a href="JoinForm">회원가입</a>
					</div>
					<div class="or">
						<span>Or</span>
					</div>
					<ul class="social-icons">
						<li><a href="#0"><i class="fab fa-facebook-f"></i></a></li>
						<li><a href="#0" class="active"><i class="fab fa-twitter"></i></a></li>
						<li><a href="#0"><i class="fab fa-google"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	<!-- ==========Sign-In-Section========== -->
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

let input = document.getElementById("userId");
let input1 = document.getElementById("userPw");

input.addEventListener("keyup", function (event) {
	
  if (event.keyCode == 13) {
    document.getElementById("login").click(login());
  }
});

input1.addEventListener("keyup", function (event) {
	
	  if (event.keyCode == 13) {
	    document.getElementById("login").click(login());
	  }
	});




function login(){
	
	const Cookie = document.getElementById("loginCookie");
	const loginCookie = Cookie.checked
	let referrer = document.referrer;
	let userId = $("#userId").val();
	let userPw = $("#userPw").val();
	
	
	
	$.ajax({
		type : "POST",
		url : "login",
		async : false,
		data : {
			"userId" : userId,
			"userPw" : userPw,
			loginCookie : loginCookie
		},
		dataType : "json",
		success : function(result){
				if(result==1){
				
				if(referrer.substr(referrer.length-2,referrer.length) == "CS" ){
					location.href=referrer+'?userId='+userId;
				}else{
					location.href=referrer
				}
			
			
			}else{
				location.href="#";
				$("#userPw").val("");
				check1.innerHTML="비밀번호가 일치하지 않습니다";
				check1.style.color = "#ff0000";
			}
			
			
		},
		error : function(){
			location.href="#";
			$("#userId").val("");
			$("#userPw").val("");
			check1.innerHTML="일치하는 아이디가 없습니다";
			check1.style.color = "#ff0000";
			
		}
		
	}); 
	
}
function login1(){
	
	const Cookie = document.getElementById("loginCookie");
	const loginCookie = Cookie.checked
	let referrer = document.referrer;
	let userId = $("#userId").val();
	let userPw = $("#userPw").val();
	
	
	
	$.ajax({
		type : "POST",
		url : "login",
		async : false,
		data : {
			"userId" : userId,
			"userPw" : userPw,
			loginCookie : loginCookie
		},
		dataType : "json",
		success : function(result){
				if(result==1){
				
				if(referrer.substr(referrer.length-2,referrer.length) == "CS" ){
					location.href=referrer+'?userId='+userId;
				}else{
					location.href=referrer
				}
			
			
			}else{
				location.href="#";
				$("#userPw").val("");
				check1.innerHTML="비밀번호가 일치하지 않습니다";
				check1.style.color = "#ff0000";
			}
			
			
		},
		error : function(){
			location.href="#";
			$("#userId").val("");
			$("#userPw").val("");
			check1.innerHTML="일치하는 아이디가 없습니다";
			check1.style.color = "#ff0000";
			
		}
		
	}); 
	
}
</script>
</html>