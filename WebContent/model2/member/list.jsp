<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
	-- AdminUserAction 추상 클래스로 1,2
	1. 로그아웃 상태
	로그인하세요 메세지 출력. loginForm.jsp로 이동
	2. admin이 아닌 경우
	관리자만 조회 가능합니다. 메세지 출력. main.jsp로 이동
	-- ListAction 클래스로 3,4
	3. admin인 경우
	   MemberDao 클래스에 list 메서드 추가하기
	   List<Member> list() 기능 : 모든 멤버 목록을 리턴
	4. db에서 조회한 list를 화면 출력하기
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 목록 보기</title>
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
			<b><a style="text-decoration: none;"  href="../member/info.me?id=${sessionScope.login}" >관리자정보 보기</a></b> | 
			<b><a style="text-decoration: none;"  href="../member/list.me?id=${sessionScope.login}" >모든 회원정보 보기</a></b> | 
			<b><a style="text-decoration: none;"  href="../accompany/myacmgroup.ao?id=${sessionScope.login}" >모든 동행그룹 확인</a></b> | 
			<b><a style="text-decoration: none;"  href="../board/myboard.bo?id=${sessionScope.login}" >모든 게시물 확인</a></b>
		</h4>
</c:if>
	<h1 style="text-shadow: 1px 1px 0 #444">
		<b>회원 목록 조회</b>
	</h1>
	<div class="w3-container">
		<div class="w3-ul w3-card-4">
			<table class="table14_11" style="width: 100%">
				<tr>
					<th>사진</th>
					<th>아이디</th>
					<th>이름</th>
					<th>성별</th>
					<th>전화</th>
					<th>이메일</th>
					<th>요청상태</th>
				</tr>
				<c:forEach var="m" items="${list }">
					<tr>
						<td><img src="img/sm_${m.picture }" width="50" height="50"
							class="w3-bar-item w3-circle w3-hide-small"></td>
						<td><a href="info.me?id=${m.id }"
							style="text-decoration: none">${m.id }</a></td>
						<td>${m.name}</td>
						<td>${m.gender==1?"남자":"여자"}</td>
						<td>${m.tel}</td>
						<td>${m.email}</td>
						<td>
							<button type="button"
								onclick="location.href='updateForm.me?id=${m.id }' "
								class="myButton1">수정</button>
							<button type="button"
								onclick="location.href='delete.me?id=${m.id }' "
								class="myButton1">강제탈퇴</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>