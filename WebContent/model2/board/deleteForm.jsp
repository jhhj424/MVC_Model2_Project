<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%--
	게시물 삭제를 위한 비밀번호 입력 화면
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>모델2 게시판 삭제 화면</title>
</head>
<body>
	<%--
	1. num과 pass 파라미터 2개 변수 저장.
	2. 입력된 비밀번호와 db의 저장된 비밀번호 비교하기
		- 맞는 경우 : 게시물 삭제. BoardDao.delete(num);
			삭제 성공 : 삭제성공 메세지 출력. list.bo로 페이지 이동
			삭제 실해 : 삭제실패 메세지 출력. info.bo로 페이지 이동
		- 틀린경우 : 비밀번호 오류 메세지 출력. deleteForm.bo로 페이지 이동
 --%>
	<form action="delete.bo" method="post" name="f"
		style="margin-top: 70px">
		<input type="hidden" name="num" value="${param.num }"> <input
			type="hidden" name="type" value="${param.type }">
		<div class="w3-container">
			<div class="w3-ul w3-card-4">
				<table class="table14_11" style="width: 100%">
					<caption>
						<h2>게시물 삭제</h2>
					</caption>
					<tr>
						<td>
							<h2>
								<b>게시글 비밀번호</b>
							</h2>
						</td>
						<td><input type="password" name="pass"></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="게시글삭제" class="myButton1"></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</body>
</html>