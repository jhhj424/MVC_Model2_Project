<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<style type="text/css">
html, body.b1 {
	font-family: Verdana, sans-serif;
	font-size: 11px;
	line-height: 1.5;
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

.table14_10, .table14_10 th, .table14_10 td {
	font-size: 0.99em;
	text-align: center;
	padding: 4px;
	border-collapse: collapse;
	font-style: normal;
}

.table14_10 th, .table14_10 td {
	border: 1px solid #ffffff;
	border-width: 1px
}

.table14_10 th {
	border: 1px solid #cde6fe;
	border-width: 1px 0 1px 0
}

.table14_10 tr {
	border: 1px solid #ffffff;
}

.table14_10 tr:nth-child(odd) {
	background-color: #f7f7f7;
}

.table14_10 tr:nth-child(even) {
	background-color: #ffffff;
}

.table14_10 td {
	border: 1px solid #eeeeee;
	border-width: 2px 2px 2px 2px;
}
</style>
<title>질문&답변 게시판 글쓰기</title>
<script type="text/javascript">
	function board_submit() {
		if (document.f.name.value == '') {
			alert("글쓴이를 입력하세요");
			document.f.name.focus();
			return;
		}
		if (document.f.pass.value == '') {
			alert("비밀번호를 입력하세요");
			document.f.pass.focus();
			return;
		}
		if (document.f.subject.value == '') {
			alert("제목을 입력하세요");
			document.f.subject.focus();
			return;
		}
		if (document.f.content.value == '') {
			alert("내용을 입력하세요");
			document.f.content.focus();
			return;
		}
		document.f.submit();
	}
</script>
</head>
<body>
	<input type="hidden" name="type" value="3">
	<form action="write3.bo" method="post" enctype="multipart/form-data"
		name="f" style="margin-left: 30px">
		<table class="table14_10" style="width: 100%">
			<caption>
				<c:if test="${sessionScope.login=='admin' }">
					<h1>
						<b>공지사항 글쓰기</b><input type="hidden" name="type" value="4">
					</h1>
				</c:if>
				<c:if test="${sessionScope.login!='admin' }">
					<h1>
						<b>질문&답변 게시판 글쓰기</b><input type="hidden" name="type" value="3">
					</h1>
				</c:if>
			</caption>
			<tr>
				<td align="center">글쓴이</td>
				<td style="text-align: left;"><input type="text" name="name"
					value="${login}" readonly></td>
			</tr>
			<tr>
				<td align="center">비밀번호</td>
				<c:if test="${login!= 'admin'}">
					<td style="text-align: left;"><input type="password"
						name="pass"></td>
				</c:if>
				<c:if test="${login== 'admin'}">
					<td style="text-align: left;"><input type="password"
						name="pass" value="${pass}"></td>
				</c:if>
			</tr>
			<tr>
				<td align="center">제목</td>
				<td style="text-align: left;"><input type="text" name="subject"></td>
			</tr>
			<tr>
				<td align="center">내용</td>
				<td><textarea rows="15" cols="100" name="content"></textarea></td>
			</tr>
			<tr>
				<td align="center">첨부파일</td>
				<td style="text-align: left;"><input type="file" name="file1"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="button"
						onclick="location.href='javascript:board_submit()' "
						class="myButton1">게시물등록</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>