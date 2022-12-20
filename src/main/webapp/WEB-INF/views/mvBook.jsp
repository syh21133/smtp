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
<link href="resources/assets/css/main.css" rel="stylesheet">
<link rel="shortcut icon" href="resources/assets/images/favicon.png" type="image/x-icon">
<title>Boleto - Online Ticket Booking Website HTML Template</title>

<style>
.select-bar1{
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
}
</style>
</head>
<body>
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
	<!-- ==========Window-Warning-Section========== -->
	<section class="window-warning inActive">
		<div class="lay"></div>
		<div class="warning-item">
			<h6 class="subtitle">Welcome!</h6>
			<h4 class="title">Select Your Seats</h4>
			<div class="thumb">
				<img src="./resources/assets/images/movie/seat-plan.png" alt="movie">
			</div>
			<a href="movie-seat-plan.html" class="custom-button seatPlanButton">Seat
				Plans<i class="fas fa-angle-right"></i>
			</a>
		</div>
	</section>
	<!-- ==========Window-Warning-Section========== -->
	<!-- ==========Banner-Section========== -->
	<section class="details-banner hero-area bg_img"
		data-background="./resources/folderforproject/images/poster/${movie.mvFilename}">
		<div class="container">
			<div class="details-banner-wrapper">
				<div class="details-banner-content">
					<h3 class="title">${movie.mvTitle}</h3>
					<div>
						<a class="button">${movie.mvGenre}</a>
						<a class="button"><c:choose>
									<c:when test="${movie.mvGrade >= 19}">
										<img src="./resources/folderforproject/images/movie/grade19_shadow.png" alt="movie" style="width:30px;height:30px">
									</c:when>
									
									<c:when test="${movie.mvGrade >= 15}">
										<img src="./resources/folderforproject/images/movie/grade15_shadow.png" alt="movie" style="width:30px;height:30px">
									</c:when>
									
									<c:when test="${movie.mvGrade >= 12}">
										<img src="./resources/folderforproject/images/movie/grade12_shadow.png" alt="movie" style="width:30px;height:30px">
									</c:when>
									
									<c:when test="${movie.mvGrade >= 0}">
										<img src="./resources/folderforproject/images/movie/gradeAll_shadow.png" alt="movie" style="width:30px;height:30px">
									</c:when>
									
									<c:otherwise>
										<img src="./resources/folderforproject/images/movie/gradeAnot her_shadow.png" alt="movie" style="width:30px;height:30px">
									</c:otherwise>
								</c:choose><c:if test= "${movie.mvGrade == 0}" >
								전체 관람가
								</c:if>
								
								<c:if test= "${movie.mvGrade != 0 }">
								${movie.mvGrade}세 관람가
								</c:if>
						
						</a>
						
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ==========Banner-Section========== -->
	<!-- ==========Book-Section========== -->
	
	<section class="book-section bg-one">
		<div class="container">
			<form class="ticket-search-form two" action="ticketBook" name="ticketBook">
			<input type="hidden" name="ticTitle" value="${mvtitle}" />
				<div class="form-group ">
					<div class="thumb">
						<img src="./resources/assets/images/ticket/city.png" alt="ticket">
					</div>
					<span class="type">지역</span>
					<select class="select-bar1" id="ciRegion" name="ciRegion" onchange="a()">
						<option value="-">-</option>
					<c:forEach var="list" items="${mvList}">
						<option value="${list.ciRegion}">${list.ciRegion}</option>
						</c:forEach>
						
					</select>
				</div>
				
				
				
				
				<div class="form-group" id="a">
					
					
				</div>
				
				<div class="form-group" id="b">
					
				</div>
			</form>
		</div>
	</section>
	<!-- ==========Book-Section========== -->
	<!-- ==========Movie-Section========== -->
	<div class="ticket-plan-section padding-bottom padding-top">
		<div class="container">
		<form action="ticketBook" name="ticketBook1">
			<div class="row justify-content-center">
				<div class="col-lg-9 mb-5 mb-lg-0">
					<ul class="seat-plan-wrapper bg-five" id="c">
					
					
						<li >
						
						</li>
						
					</ul>
				</div>
				
			</div>
			</form>
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
							Copyright Â© 2020.All Rights Reserved By <a href="#0">Boleto
							</a>
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
	
	
</body>
<script>
	
	function a(){
		
		let ciRegion = $("#ciRegion").val();
		
		
	 	$.ajax({
			type : "POST",
			url : "ciRegion",
			data : {
				"ciRegion" : ciRegion
			},
			dataType : "json",
			success : function(result){
				ciRegion1(result,ciRegion)
			},
			error : function(){
				alert("실패")
			}
			
		}); 
		
	
		
	}
	
	
	function ciRegion1(List,ciRegion){
		
		let output = "";
		
		if(ciRegion == '-'){
			
			output += "<div></div>"
			
		}else{
		
		
		
		output +="<div class='thumb'>";
		output +="<img src='./resources/assets/images/ticket/date.png' alt='ticket'></div>";
		output +="<span class='type'>영화관</span>";
		output +="<select class='select-bar1'id='ciName' name='ciName' onchange='b()'>"
		output +="<option value='-'>-</option>";
				for(let i in List ){
		output +="<option value="+List[i].ciName+">"+List[i].ciName+"</option>";
					}
		output +="</select>";
		
				
		}
			 
		
		 document.getElementById("a").innerHTML = output;
		 document.getElementById("b").innerHTML = "<div></div>";
		 document.getElementById("c").innerHTML = "<div></div>";
		
		
		
		
	}
	
	//바꾸고 싶은거1 : 필요없는 script 지우기
	//2 : hidden에 name, reigion, date값 넣기
function b(){
		
		let ciName = $("#ciName").val();
		let ciRegion = $("#ciRegion").val();
		let mvTitle =  '${mvTitle}';
		
		console.log(ciName)
		
		$.ajax({
			type : "POST",
			async : false,
			url : "ciName",
			data : {
				"ciName" : ciName,
				"ciRegion" : ciRegion,
				"mvTitle" : mvTitle
				
			},
			dataType : "json",
			success : function(result){
				ciDate(result)
				
				
			},
			error : function(){
				
				let output = "";
				output += "<div></div>"
				
					document.getElementById("b").innerHTML = output;
				document.getElementById("c").innerHTML = "<div></div>";
							
			}
			
		});
		
	}
function ciDate(List){
	
	console.log(ciName)
	
	let output = "";
	
		
	
	output +="<div class='thumb'>";
	output +="<img src='./resources/assets/images/ticket/date.png' alt='ticket'></div>";
	output +="<span class='type'>날짜</span>";
	output +="<select class='select-bar1' onchange='c()' id='ticDate' >";
	output +="<option value='-'>-</option>";
	
			for(let i in List ){
				
	output +="<option value="+List[i].ticDate+" value2="+List[i].tcinemaNum+">"+List[i].ticDate+"</option>";
	
	
				}
			
	output +="</select>";
	
	
	
	
	


	
	
	document.getElementById("b").innerHTML = output;
	document.getElementById("c").innerHTML = "<div></div>";
	
	
	
}
function c(){
	
	
	
	let ticDate = $("#ticDate").val();
	
	let tcinemaNum =  $("#ticDate > option:selected").attr("value2");
	
	console.log(tcinemaNum);
	console.log(ticDate);
	
 	$.ajax({
		type : "POST",
		url : "ciRoom",
		data : {
			"tcinemaNum" : tcinemaNum,
			"ticDate" : ticDate
		},
		dataType : "json",
		success : function(result){
			ciRoomList(result,ticDate)
		},
		error : function(){
			let output = "";
			output += "<div></div>"
			
				document.getElementById("c").innerHTML = output;
		}
		
	}); 
	

	
} 

	function ciRoomList(List,ticDate){
		
		
	
	
	
	
		let output = "";
		
		for(let i in List ){
			output += "	<li >";
		output += "	<div class='movie-name'>";
		output += "	<div class='icons'>";
		output += "	<i class='ar fa-heart'></i><i class='fas fa-heart'></i>";
		output += "	</div>";
		
		output +="<input type='hidden' id='ciNum' value="+List[i].ciNum+">";
		output += "	<a class='name' >"+List[i].ciRoom+"</a>";
				
		output += "	<div class='location-icon'>";
		output += "		<i class='fas fa-map-marker-alt'></i>";
		output += "	</div>";
		output += "	</div>";

		output += "	<div class='movie-schedule'>";
			
		let ciRoom = List[i].ciRoom;
		let ciNum = List[i].ciNum
		
		let ciTime;
		
		 $.ajax({
			type : "POST",
			url : "ciTime",
			data : {
				"ciNum" : ciNum,
				"ciRoom" : ciRoom,
				"ticDate" : ticDate,
				"ticTitle": '${mvTitle}'
			},
			async : false,
			dataType : "json",
			
			success : function(result){
				
				let output = "";
				
				for(let i in result ){
			
		 	output +="<input type='hidden' id='ciRoom' name='ciRoom' value="+ciRoom+">";
			output +=" <a class='item' onclick=\"ticBook('" +result[i].ticTime+"','"+ciRoom+"','"+ciNum+"')\"> "+result[i].ticTime+"</a>";
			
			console.log(ciRoom)
			
			
					}
			
			ciTime = output	;
			
			},
			error : function(){
				alert("실패")
			}
			
		});  
		 output += ciTime;
		 
		 	output += "	</div>"; 
				
			output += "</li>";	
		 	
	
		
}	
			
		document.getElementById("c").innerHTML = output;
		
		
	
	
}

function ticBook(ticTime,ciRoom,ciNum){
	
	let ciRegion = $("#ciRegion").val()
	let ciName = $("#ciName").val()
	let ticDate = $("#ticDate").val();
	
	console.log(ciNum);
	
	
	if(${userId eq null}){
		alert("로그인 후 이용해 주세요")
		location.href='loginForm'
		
	}else{
	
	let conf = confirm("영화제목 : ${mvTitle}, \n"
						+"날짜 : "+ticDate+" "+ticTime+",\n" 
						+"영화관 : "+ciRegion+" "+ciName+" "+ciRoom +"관 예매 하시겠습니까?");
	

	
	if(conf){
		location.href='ticketBook?ticDate='+ticDate+'&ticTime='+ticTime+'&ticiNum='+ciNum+'&ticTitle=${mvTitle}';
		
	} else {
		
	}
	}
}
	
	
	</script>
</html>