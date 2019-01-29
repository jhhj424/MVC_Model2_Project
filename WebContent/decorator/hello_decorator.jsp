<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<style>
.a {
	
}
</style>
<title><decorator:title /></title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>

	<div class="w3-display-container" style="margin-bottom: 50px">
		<img src="${path}/bgimg.jpg" style="width: 100%; height: 400px;" >
		<div
			class="w3-display-bottomleft w3-container w3-white w3-hover-black w3-hide-small"
			style="bottom: 10%; opacity: 0.8; width: 75%">
			<h1>
				함께 여행을 만들어가는<br> <b>Travel maker </b>
			</h1>
		</div>
	</div>

	<div class="w3-row w3-container" style="margin: 50px 0; margin-left:15%">
		<div class="w3-half w3-container"  style="width:39%">
			<div class="w3-topbar w3-border-black a">
				<img src="${path}/world.jpg" style="width: 100%; height:400px;" onclick="location.href='${path}/model2/member/main.me' ">
				<div class="w3-center">
					<h1><b>사이트 메인</b></h1>
					<h3>여행의 길이 열립니다.</h3>
				</div>
			</div>
		</div>

		<div class="w3-half w3-container" style="width:39%">
			<div class="w3-topbar w3-border-black">
				<img src="${path}/in.jpg" style="width: 100%; height:400px;" onclick="location.href='${path}/model2/member/joinForm.jsp' ">
				<div class="w3-center">
					<h1><b>회원가입</b></h1>
					<h3>우리들과 함께 하세요.</h3>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
