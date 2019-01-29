<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /WebContent/medel2/info.jsp --%>
    <%request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 정보 보기</title>
</head>
<body>
<c:if test="${login != 'admin'}" >
		<h3 style="text-shadow: 1px 1px 0 #444; background-color: dodgerblue; color: white;" >
			<b><a style="text-decoration: none;" href="../member/info.me?id=${sessionScope.login}">회원정보보기</a></b> | 
					<b><a style="text-decoration: none;"  href="../accompany/myacmgroup.ao?id=${sessionScope.login}">만든동행확인</a></b> | 
					<b><a style="text-decoration: none;"  href="../accompany/acmgroup.ao?id=${sessionScope.login}">신청한동행확인</a></b> |
					<b><a style="text-decoration: none;"  href="../board/myboard.bo?id=${sessionScope.login}">내게시물확인</a></b>
		</h3>
</c:if>
<c:if test="${login == 'admin'}" >
		<h4  style="text-shadow: 1px 1px 0 #444; background-color: dodgerblue; color: white;" >
			<b><a style="text-decoration: none;"  href="info.me?id=${sessionScope.login}" >관리자정보 보기</a></b> | 
			<b><a style="text-decoration: none;"  href="list.me?id=${sessionScope.login}" >모든 회원정보 보기</a></b> | 
			<b><a style="text-decoration: none;"  href="../accompany/myacmgroup.ao?id=${sessionScope.login}" >모든 동행그룹 확인</a></b> | 
			<b><a style="text-decoration: none;"  href="../board/myboard.bo?id=${sessionScope.login}" >모든 게시물 확인</a></b>
		</h4>
</c:if>
<h1 style="text-shadow: 1px 1px 0 #444">
		<b>회원 정보 보기</b>
	</h1><div class="w3-container">
			<div class="w3-ul w3-card-4">
				<table class="table14_11" style="width: 100%">
<tr ><td rowspan="6" style="width: 23%;">
	<img src="img/${mem.picture}"  width="300" height="360"></td>
	<td><b>아이디</b></td><td>${mem.id}</td><td><b>이름</b></td><td>${mem.name}</td></tr>
	<tr><td><b>성별</b></td><td>${mem.gender ==1?"남자":"여자"}</td><td><b>전화</b></td><td>${mem.tel}</td></tr>
	<tr><td><b>이메일</b></td><td>${mem.email}</td><td><b>생일</b></td><td>${mem.birth}</td></tr>
	<tr><td><b>거주지</b></td><td>${mem.address}</td><td><b>기억에남는여행지</b></td><td>${mem.remember}</td></tr>
	<%-- id에해당하는 회원정보 수정전 화면
	1. 로그인여부, 자기정보 여부 검증. O
	2. id에 해당하는 회원정보를 db에서 읽기. O
	3. updateForm.jsp 화면에 내용 출력
	 --%>
	<tr><td colspan="4" align="center">
	<button type="button" class="myButton" onclick="location.href='updateForm.me?id=${mem.id }' ">
	수정</button>
	<c:if test="${mem.id != 'admin'}" >
		<button type="button" class="myButton" onclick="location.href='deleteForm.me?id=${mem.id }' ">
	탈퇴</button>
	</c:if>
	</td></tr>
</table>
</div>
</div>
</body>
</html>