<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 사진 등록 화면</title>
</head>
<body>
<h3>업로드위치:model2/member/img</h3>
<form action="memberimg.me" method="post" enctype="multipart/form-data">
<input type="file" name="picture">
<input type="submit" value="사진등록">
</form>
</body>
</html>