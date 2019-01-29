
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
	1. id �Ķ���� ���� ��ȸ
	2. �α����� �ȵ� ���
		�α��� �ϼ��� �޼��� ���. logForm.jsp ������ �̵�
	3. admin�� �ƴϰ�,�α��ε� id�� �Ķ���� id�� �ٸ� ���
		�ڱ������� �������� �޼��� ���. main.jsp ������ �̵�
	4. admin�̰ų� �α��ε� id�� �Ķ���� id�� ���� ���
		db���� id�� �ش��ϴ� ������ ��ȸ�Ͽ� Member ��ü�� �����ϱ�
	5. ��ȸ�� Member ��ü�� ȭ�鿡 ����ϱ�
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ���� ���� ȭ��</title>
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
			<b><a style="text-decoration: none;" href="../member/info.me?id=${sessionScope.login}">ȸ����������</a></b> | 
					<b><a style="text-decoration: none;"  href="../accompany/myacmgroup.ao?id=${sessionScope.login}">���絿��Ȯ��</a></b> | 
					<b><a style="text-decoration: none;"  href="../accompany/acmgroup.ao?id=${sessionScope.login}">��û�ѵ���Ȯ��</a></b> |
					<b><a style="text-decoration: none;"  href="../board/myboard.bo?id=${sessionScope.login}">���Խù�Ȯ��</a></b>
		</h3>
</c:if>
<c:if test="${param.id == 'admin'}" >
		<h4  style="text-shadow: 1px 1px 0 #444; background-color: dodgerblue; color: white;" >
			<b><a style="text-decoration: none;"  href="../member/info.me?id=${sessionScope.login}" >���������� ����</a></b> | 
			<b><a style="text-decoration: none;"  href="../member/list.me?id=${sessionScope.login}" >��� ȸ������ ����</a></b> | 
			<b><a style="text-decoration: none;"  href="../accompany/myacmgroup.ao?id=${sessionScope.login}" >��� ����׷� Ȯ��</a></b> | 
			<b><a style="text-decoration: none;"  href="../board/myboard.bo?id=${sessionScope.login}" >��� �Խù� Ȯ��</a></b>
		</h4>
</c:if>
		<h1 style="text-shadow: 1px 1px 0 #444">
			<b>ȸ�� ����</b>
		</h1>
		<div class="w3-container">
			<div class="w3-ul w3-card-4">
				<table class="table14_11" style="width: 100%">
					<tr>
						<td rowspan="6" align="center" valign="bottom"><img
							src="img/${mem.picture}" width="200" height="240" id="pic"><br>
							<font size="4"><a href="javascript:win_open()">��������</a></font></td>
						<td>���̵�</td>
						<td><input type="text" name="id" value="${mem.id}" readonly>
						</td>
						<td>��й�ȣ</td>
						<td><input type="password" name="pass" value="${mem.pass}"></td>
					</tr>
					<tr>
						<td>��ȭ��ȣ</td>
						<td><input type="text" name="tel" value="${mem.tel}"></td>
						<td>�̸���</td>
						<td><input type="text" name="email" value="${mem.email}">
						</td>
					<tr>
						<td>������</td>
						<td><input type="text" name="address" value="${mem.address}">
						</td>
						<td>��￡���¿�����</td>
						<td><input type="text" name="remember"
							value="${mem.remember}"></td>
					</tr>
					<tr>
						<td colspan="4" align="center">
						<input type="submit" value="ȸ������" class="myButton"> 
							<input type="button" value="��й�ȣ ����" 
							onclick="passchg_winopen('${mem.id}')" class="myButton"></td>
					</tr>
					<%-- 		<input type="button" value="��й�ȣ ����"
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