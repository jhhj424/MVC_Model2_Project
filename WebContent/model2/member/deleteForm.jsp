<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 탈퇴 비밀번호 입력</title>
</head>
<body>
	<%--
	1. 로그인이 안된 경우 : 로그인이 필요합니다 메세지 출력 alert , loginForm.jsp로 페이지 이동
    	
    	2. 로그인 된 경우
    		- 일반 사용자인 경우는 id와 로그인 정보가 일치해야 하고, 관리자는 상관 없음을 검증
    		- 일반 사용자
    		  (1)비밀번호 검증. 틀리면 비밀번호가 틀립니다 alert 출력. deleteForm.jsp로 이동
    		  (2)비밀번호 맞으면 db에서 해당 id의 정보 삭제.
    		     - 로그아웃 하기
    		     - 탈퇴 완료 메세지 출력. loginForm.jsp로 페이지 이동
    		- 관리자
    		  (1) db에서 해당 id의 정보 삭제.
    		    탈퇴메세지 출력. list.jsp로 페이지 이동
 --%>
	<form action="delete.me" name="f" method="post"
		style="margin-top: 70px">
		<input type="hidden" name="id" value="${param.id}">
		<c:if test="${login != 'admin'}">
			<h3
				style="text-shadow: 1px 1px 0 #444; background-color: dodgerblue; color: white;">
				<b><a style="text-decoration: none;"
					href="../member/info.me?id=${sessionScope.login}">회원정보보기</a></b> | <b><a
					style="text-decoration: none;"
					href="../accompany/myacmgroup.ao?id=${sessionScope.login}">만든동행확인</a></b>
				| <b><a style="text-decoration: none;"
					href="../accompany/acmgroup.ao?id=${sessionScope.login}">신청한동행확인</a></b>
				| <b><a style="text-decoration: none;"
					href="../board/myboard.bo?id=${sessionScope.login}">내게시물확인</a></b>
			</h3>
		</c:if>
		<c:if test="${login == 'admin'}">
			<h4
				style="text-shadow: 1px 1px 0 #444; background-color: dodgerblue; color: white;">
				<b><a style="text-decoration: none;"
					href="info.me?id=${sessionScope.login}">관리자정보 보기</a></b> | <b><a
					style="text-decoration: none;"
					href="list.me?id=${sessionScope.login}">모든 회원정보 보기</a></b> | <b><a
					style="text-decoration: none;"
					href="../accompany/myacmgroup.ao?id=${sessionScope.login}">모든
						동행그룹 확인</a></b> | <b><a style="text-decoration: none;"
					href="../board/myboard.bo?id=${sessionScope.login}">모든 게시물 확인</a></b>
			</h4>
		</c:if>
		<h1 style="text-shadow: 1px 1px 0 #444">
			<b>본인확인 비밀번호 입력</b>
		</h1>
		<div class="w3-container">
			<div class="w3-ul w3-card-4">
				<table class="table14_11" style="width: 100%">
					<tr>
						<td><b>비밀번호</b></td>
						<td><input type="password" name="pass"></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="탈퇴하기" class="myButton1"></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</body>
</html>