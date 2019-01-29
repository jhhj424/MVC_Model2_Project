<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<title><decorator:title /></title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
body {
	font-family: "Comic Sans MS", Georgia, fantasy;
}

h1, h2, h3, h4, h5, h6 {
	font-family: "Playfair Display";
	letter-spacing: 5px;
	font-weight: bold;
	color: dodgerblue;
}

h1.myfont {
	font-size: 80px;
	font-weight: bold;
	font-style: inherit;
	color: white;
	align-content: center;
}

.myButton {
	-moz-box-shadow: inset 0px 1px 0px 0px #bbdaf7;
	-webkit-box-shadow: inset 0px 1px 0px 0px #bbdaf7;
	box-shadow: inset 0px 1px 0px 0px #bbdaf7;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #79bbff
		), color-stop(1, #378de5));
	background: -moz-linear-gradient(top, #79bbff 5%, #378de5 100%);
	background: -webkit-linear-gradient(top, #79bbff 5%, #378de5 100%);
	background: -o-linear-gradient(top, #79bbff 5%, #378de5 100%);
	background: -ms-linear-gradient(top, #79bbff 5%, #378de5 100%);
	background: linear-gradient(to bottom, #79bbff 5%, #378de5 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#79bbff',
		endColorstr='#378de5', GradientType=0);
	background-color: #79bbff;
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	border-radius: 6px;
	border: 1px solid #84bbf3;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: Arial;
	font-size: 15px;
	font-weight: bold;
	padding: 6px 24px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #528ecc;
}

.myButton:hover {
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #378de5
		), color-stop(1, #79bbff));
	background: -moz-linear-gradient(top, #378de5 5%, #79bbff 100%);
	background: -webkit-linear-gradient(top, #378de5 5%, #79bbff 100%);
	background: -o-linear-gradient(top, #378de5 5%, #79bbff 100%);
	background: -ms-linear-gradient(top, #378de5 5%, #79bbff 100%);
	background: linear-gradient(to bottom, #378de5 5%, #79bbff 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#378de5',
		endColorstr='#79bbff', GradientType=0);
	background-color: #378de5;
}

.myButton:active {
	position: relative;
	top: 1px;
}

.table14_11 table {
	width: 100%;
	margin: 15px 0;
	border: 0;
}

.table14_11 th {
	font-weight: bold;
	background-color: #cde6fe;
	color: #2052fe;
	font-size: large;
}

.table14_11, .table14_11 th, .table14_11 td {
	font-size: 1.15em;
	text-align: center;
	padding: 4px;
	border-collapse: collapse;
	font-style: normal;
}

.table14_11 th, .table14_11 td {
	border: 1px solid #ffffff;
	border-width: 1px
}

.table14_11 th {
	border: 1px solid #cde6fe;
	border-width: 1px 0 1px 0
}

.table14_11 td {
	border: 1px solid #eeeeee;
	border-width: 1px 0 1px 0
}

.table14_11 tr {
	border: 1px solid #ffffff;
}

.table14_11 tr:nth-child(odd) {
	background-color: #f7f7f7;
}

.table14_11 tr:nth-child(even) {
	background-color: #ffffff;
}

.myButton1 {
	-moz-box-shadow: inset 0px 1px 0px 0px #97c4fe;
	-webkit-box-shadow: inset 0px 1px 0px 0px #97c4fe;
	box-shadow: inset 0px 1px 0px 0px #97c4fe;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #3d94f6
		), color-stop(1, #1e62d0));
	background: -moz-linear-gradient(top, #3d94f6 5%, #1e62d0 100%);
	background: -webkit-linear-gradient(top, #3d94f6 5%, #1e62d0 100%);
	background: -o-linear-gradient(top, #3d94f6 5%, #1e62d0 100%);
	background: -ms-linear-gradient(top, #3d94f6 5%, #1e62d0 100%);
	background: linear-gradient(to bottom, #3d94f6 5%, #1e62d0 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#3d94f6',
		endColorstr='#1e62d0', GradientType=0);
	background-color: #3d94f6;
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	border-radius: 6px;
	border: 1px solid #337fed;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: Arial;
	font-size: 15px;
	font-weight: bold;
	padding: 6px 24px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #1570cd;
}

.myButton1:hover {
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #1e62d0
		), color-stop(1, #3d94f6));
	background: -moz-linear-gradient(top, #1e62d0 5%, #3d94f6 100%);
	background: -webkit-linear-gradient(top, #1e62d0 5%, #3d94f6 100%);
	background: -o-linear-gradient(top, #1e62d0 5%, #3d94f6 100%);
	background: -ms-linear-gradient(top, #1e62d0 5%, #3d94f6 100%);
	background: linear-gradient(to bottom, #1e62d0 5%, #3d94f6 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#1e62d0',
		endColorstr='#3d94f6', GradientType=0);
	background-color: #1e62d0;
}

.myButton1:active {
	position: relative;
	top: 1px;
}

img.t1 {
	max-width: 3000px;
	min-width: 1200px;
	max-height: 300px;
	min-height: 100px;
}
</style>
<body>

	<!-- Navbar (sit on top) -->
	<div class="w3-top">
		<div class="w3-bar w3-white w3-padding w3-card"
			style="letter-spacing: 4px;">
			<a href="${path}/model2/hello.jsp"> <img src="${path}/home.png"
				class="w3-left w3-margin-right" style="margin-top: 9px" width="20px"
				height="20px"></a> <a href="${path}/model2/member/main.me"
				class="w3-bar-item w3-button">Travel maker</a>
			<!-- Right-sided navbar links. Hide them on small screens -->
			<div class="w3-right w3-hide-small">
				<c:if test="${empty sessionScope.login}">
					<a href="${path}/model2/member/loginForm.jsp"
						class="w3-bar-item w3-button"> 로그인 </a>
					<a href="${path}/model2/member/joinForm.jsp"
						class="w3-bar-item w3-button"> 회원가입 </a>
				</c:if>
			</div>
			<div class="w3-right w3-hide-small">
				<c:if test="${!empty sessionScope.login}">
					<a href="${path}/model2/member/logout.me"
						class="w3-bar-item w3-button"> ${sessionScope.login}님! 로그아웃</a>
					<a href="${path}/model2/member/info.me?id=${sessionScope.login}"
						class="w3-bar-item w3-button">내정보</a>
				</c:if>
			</div>
			<div style="margin-left: 35%">
				<div class="w3-left w3-hide-small">
					<a href="${path}/model2/board/list.bo?type=1"
						class="w3-bar-item w3-button w3-margin-left"> 여행지 추천 리뷰 </a> <a
						href="${path}/model2/board/list2.bo?type=2"
						class="w3-bar-item w3-button w3-margin-left"> 동행자 모집 </a> <a
						href="${path}/model2/board/list3.bo?type=3"
						class="w3-bar-item w3-button w3-margin-left"> 회원 질문 답변 </a>
				</div>
			</div>
		</div>
	</div>
	<!-- Header -->
	<header class="w3-display-container w3-content w3-wide" id="home"
		style="max-width: 3000px; min-width: 1000px; margin-top: 100px; max-height: 300px; min-height: 100px;">
		<!-- <img src="#" alt="Hamburger Catering" width="100%"> -->
		<!-- <div class="w3-display-topmiddle w3-padding-large">
		<br><br>
			<h1 class="myfont">&nbsp;&nbsp;트래블메이커</h1><br>
			<h5 style="color:white">여러분의 즐겁고 안전한 여행을 트래블메이커가 함께합니다.</h5>
		</div> -->
		<div style="text-align: center;">
			<img src="${path}/images/acom.png"
				alt="Hamburger Catering" class="t1">
		</div>
	</header>

	<!-- Page content -->
	<div class="w3-content w3-center" style="margin-top: 50px">
		<decorator:body />
		<!-- <div class="w3-row w3-padding-16 w3-center" style="margin-top: 50px">
		</div> -->
	</div>
	<hr>
	<!-- End page content -->
	<!-- Footer -->
	<footer class="w3-center w3-light-grey w3-padding-32">
		<tr>
			<td height="30" class="body_01 "><a href="#" class="menu3"
				style="margin-left: 50px">이용약관</a> | <a href="#" class="menu3">개인정보보호정책</a>
				| <a href="${path}/model2/member/loginForm.jsp" class="menu3">로그인</a>
				| <a href="${path}/model2/member/joinForm.jsp" class="menu3">회원가입</a>
			</td>
		</tr>
		<div class="w3-center w3-padding-32">
			상호명: Travel maker | 대표자: 신지호 | 전화: 010-3412-0161 | 사업자등록번호:
			457-85-00300<br>주소: (우)08505 서울시 금천구 가산디지털2로 115, 509호, 811호
			(가산동, 대륭테크노타운 3차) | 통신판매업신고번호: 제 2014-서울금천-0864 호<br> 홈페이지 제작자:
			신지호 | <a href="#">jhhj424@naver.com</a> | Copyright(C) 2015 GooDee
			ALL Right Reserved.
		</div>
	</footer>
</body>
</html>
