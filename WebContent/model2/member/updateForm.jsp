
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
	1. id 파라미터 정보 조회
	2. 로그인이 안된 경우
		로그인 하세요 메세지 출력. logForm.jsp 페이지 이동
	3. admin이 아니고,로그인된 id와 파라미터 id가 다른 경우
		자기정보만 수정가능 메세지 출력. main.jsp 페이지 이동
	4. admin이거나 로그인된 id와 파라미터 id가 같은 경우
		db에서 id에 해당하는 정보를 조회하여 Member 객체에 저장하기
	5. 조회된 Member 객체를 화면에 출력하기
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 정보 수정 화면</title>
<script type="text/javascript">
	function win_open() {
		var op = "width=500, height=150, left=50, top=150";
		open("memberimgForm.jsp", "", op);
	}
	function passchg_winopen(id) {
		var op = "width=500, height=150, left=50, top=150";
		open("passchgForm.jsp?id=" + id, "", op);
	}
</script>
</head>
<body>
	<form action="update.me" name="f" method="post">
		<input type="hidden" name="picture" value="${mem.picture}">
			
<c:if test="${param.id != 'admin'}" >
		<h3 style="text-shadow: 1px 1px 0 #444; background-color: dodgerblue; color: white;" >
			<b><a style="text-decoration: none;" href="../member/info.me?id=${sessionScope.login}">회원정보보기</a></b> | 
					<b><a style="text-decoration: none;"  href="../accompany/myacmgroup.ao?id=${sessionScope.login}">만든동행확인</a></b> | 
					<b><a style="text-decoration: none;"  href="../accompany/acmgroup.ao?id=${sessionScope.login}">신청한동행확인</a></b> |
					<b><a style="text-decoration: none;"  href="../board/myboard.bo?id=${sessionScope.login}">내게시물확인</a></b>
		</h3>
</c:if>
<c:if test="${param.id == 'admin'}" >
		<h4  style="text-shadow: 1px 1px 0 #444; background-color: dodgerblue; color: white;" >
			<b><a style="text-decoration: none;"  href="../member/info.me?id=${sessionScope.login}" >관리자정보 보기</a></b> | 
			<b><a style="text-decoration: none;"  href="../member/list.me?id=${sessionScope.login}" >모든 회원정보 보기</a></b> | 
			<b><a style="text-decoration: none;"  href="../accompany/myacmgroup.ao?id=${sessionScope.login}" >모든 동행그룹 확인</a></b> | 
			<b><a style="text-decoration: none;"  href="../board/myboard.bo?id=${sessionScope.login}" >모든 게시물 확인</a></b>
		</h4>
</c:if>
		<h1 style="text-shadow: 1px 1px 0 #444">
			<b>회원 수정</b>
		</h1>
		<div class="w3-container">
			<div class="w3-ul w3-card-4">
				<table class="table14_11" style="width: 100%">
					<tr>
						<td rowspan="6" align="center" valign="bottom"><img
							src="img/${mem.picture}" width="200" height="240" id="pic"><br>
							<font size="4"><a href="javascript:win_open()">사진수정</a></font></td>
						<td>아이디</td>
						<td><input type="text" name="id" value="${mem.id}" readonly>
						</td>
						<td>비밀번호</td>
						<td><input type="password" name="pass" value="${mem.pass}"></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="text" name="tel" value="${mem.tel}"></td>
						<td>이메일</td>
						<td><input type="text" name="email" value="${mem.email}">
						</td>
					<tr>
						<td>거주지</td>
						<td><input type="text" name="address" value="${mem.address}">
						</td>
						<td>기억에남는여행지</td>
						<td><input type="text" name="remember"
							value="${mem.remember}"></td>
					</tr>
					<tr>
						<td colspan="4" align="center">
						<input type="submit" value="회원수정" class="myButton"> 
							<input type="button" value="비밀번호 수정" 
							onclick="passchg_winopen('${mem.id}')" class="myButton"></td>
					</tr>
					<%-- 		<input type="button" value="비밀번호 변경"
			<%if(login.equals("admin")) {
				%>
				onclick = "location.href = 'repassadminForm.jsp?id=<%=mem.getId()%>'"
			<%} else {%>
			 onclick = "location.href = 'repassForm.jsp?id=<%=mem.getId()%>'"<%} %>>
			</td></tr>
			--%>
				</table>
			</div>
		</div>
	</form>
</body>
</html>