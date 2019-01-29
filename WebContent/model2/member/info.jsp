<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /WebContent/medel2/info.jsp --%>
    <%request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ���� ����</title>
</head>
<body>
<c:if test="${login != 'admin'}" >
		<h3 style="text-shadow: 1px 1px 0 #444; background-color: dodgerblue; color: white;" >
			<b><a style="text-decoration: none;" href="../member/info.me?id=${sessionScope.login}">ȸ����������</a></b> | 
					<b><a style="text-decoration: none;"  href="../accompany/myacmgroup.ao?id=${sessionScope.login}">���絿��Ȯ��</a></b> | 
					<b><a style="text-decoration: none;"  href="../accompany/acmgroup.ao?id=${sessionScope.login}">��û�ѵ���Ȯ��</a></b> |
					<b><a style="text-decoration: none;"  href="../board/myboard.bo?id=${sessionScope.login}">���Խù�Ȯ��</a></b>
		</h3>
</c:if>
<c:if test="${login == 'admin'}" >
		<h4  style="text-shadow: 1px 1px 0 #444; background-color: dodgerblue; color: white;" >
			<b><a style="text-decoration: none;"  href="info.me?id=${sessionScope.login}" >���������� ����</a></b> | 
			<b><a style="text-decoration: none;"  href="list.me?id=${sessionScope.login}" >��� ȸ������ ����</a></b> | 
			<b><a style="text-decoration: none;"  href="../accompany/myacmgroup.ao?id=${sessionScope.login}" >��� ����׷� Ȯ��</a></b> | 
			<b><a style="text-decoration: none;"  href="../board/myboard.bo?id=${sessionScope.login}" >��� �Խù� Ȯ��</a></b>
		</h4>
</c:if>
<h1 style="text-shadow: 1px 1px 0 #444">
		<b>ȸ�� ���� ����</b>
	</h1><div class="w3-container">
			<div class="w3-ul w3-card-4">
				<table class="table14_11" style="width: 100%">
<tr ><td rowspan="6" style="width: 23%;">
	<img src="img/${mem.picture}"  width="300" height="360"></td>
	<td><b>���̵�</b></td><td>${mem.id}</td><td><b>�̸�</b></td><td>${mem.name}</td></tr>
	<tr><td><b>����</b></td><td>${mem.gender ==1?"����":"����"}</td><td><b>��ȭ</b></td><td>${mem.tel}</td></tr>
	<tr><td><b>�̸���</b></td><td>${mem.email}</td><td><b>����</b></td><td>${mem.birth}</td></tr>
	<tr><td><b>������</b></td><td>${mem.address}</td><td><b>��￡���¿�����</b></td><td>${mem.remember}</td></tr>
	<%-- id���ش��ϴ� ȸ������ ������ ȭ��
	1. �α��ο���, �ڱ����� ���� ����. O
	2. id�� �ش��ϴ� ȸ�������� db���� �б�. O
	3. updateForm.jsp ȭ�鿡 ���� ���
	 --%>
	<tr><td colspan="4" align="center">
	<button type="button" class="myButton" onclick="location.href='updateForm.me?id=${mem.id }' ">
	����</button>
	<c:if test="${mem.id != 'admin'}" >
		<button type="button" class="myButton" onclick="location.href='deleteForm.me?id=${mem.id }' ">
	Ż��</button>
	</c:if>
	</td></tr>
</table>
</div>
</div>
</body>
</html>