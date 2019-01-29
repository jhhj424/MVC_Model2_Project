<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%-- jspStudy2/WebContent/model2/member/loginForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 화면</title>
<style rel="stylesheet">
body {
	font: 13px/20px 'Helvetica Neue', Helvetica, Arial, sans-serif;
	color: #333333;
	background: ghostwhite;
}

.signUp {
	position: relative;
	margin: 50px auto;
	width: 300px;
	padding: 33px 25px 29px;
	background: #FFFFFF;
	border-bottom: 1px solid #C4C4C4;
	border-radius: 5px;
	-webkit-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
	box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
}

.signUpTitle {
	margin: -25px -25px 25px;
	padding: 15px 25px;
	line-height: 35px;
	font-size: 26px;
	font-weight: 300;
	color: white;
	text-align: left;
	text-shadow: 0 1px rgba(255, 255, 255, 0.75);
	background: skyblue;
}

input {
	font-family: inherit;
	color: inherit;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.signUpInput {
	width: 100%;
	height: 50px;
	margin-bottom: 25px;
	padding: 0 15px 2px;
	font-size: 17px;
	background: white;
	border: 2px solid #EBEBEB;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 -2px #EBEBEB;
	box-shadow: inset 0 -2px #EBEBEB;
}

.signUpButton {
	position: relative;
	vertical-align: top;
	width: 100%;
	height: 54px;
	padding: 0;
	font-size: 22px;
	color: white;
	text-align: center;
	text-shadow: 0 1px 2px rgba(0, 0, 0, 0.25);
	background: skyblue;
	border: 0;
	border-bottom: 2px solid #D76B60;
	border-radius: 5px;
	cursor: pointer;
	-webkit-box-shadow: inset 0 -2px #D76B60;
	box-shadow: inset 0 -2px #D76B60;
}
.backButton {
	position: relative;
	font-size: 30px;
	color : white;
	text-align: center;
	background-color: skyblue;
	border: px solid grey;
	border-radius: 5px;
	cursor: pointer;
	margin-right: 23%
}
</style>
</head>
<script type="text/javascript">
	function logincheck(f) {
		if (f.id.value == '') {
			alert('아이디를 입력하세요');
			f.id.focus();
			return false;
		}
		if (f.pass.value == '') {
			alert('비밀번호를 입력하세요');
			f.pass.focus();
			return false;
		}
	}
</script>
<body>
	<div style="margin-top: 10%">
		<form action="login.me" method="post"
			onsubmit="return logincheck(this)" class="signUp" id="signupForm">
			<h1 class="signUpTitle"><input type="button" onclick="location.href='javascript:history.go(-1)' " value="←" class="backButton">로그인</h1>
			<input type="text" class="signUpInput" placeholder="아이디" 
			autofocus required name="id"> 
			<input type="password" name="pass" class="signUpInput"
			 placeholder="비밀번호" required> 
			 <input	type="submit" value="로그인" class="signUpButton">
		</form>
	</div>
</body>
</html>