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
<title>ȸ�� Ż�� ��й�ȣ �Է�</title>
</head>
<body>
	<%--
	1. �α����� �ȵ� ��� : �α����� �ʿ��մϴ� �޼��� ��� alert , loginForm.jsp�� ������ �̵�
    	
    	2. �α��� �� ���
    		- �Ϲ� ������� ���� id�� �α��� ������ ��ġ�ؾ� �ϰ�, �����ڴ� ��� ������ ����
    		- �Ϲ� �����
    		  (1)��й�ȣ ����. Ʋ���� ��й�ȣ�� Ʋ���ϴ� alert ���. deleteForm.jsp�� �̵�
    		  (2)��й�ȣ ������ db���� �ش� id�� ���� ����.
    		     - �α׾ƿ� �ϱ�
    		     - Ż�� �Ϸ� �޼��� ���. loginForm.jsp�� ������ �̵�
    		- ������
    		  (1) db���� �ش� id�� ���� ����.
    		    Ż��޼��� ���. list.jsp�� ������ �̵�
 --%>
	<form action="delete.me" name="f" method="post"
		style="margin-top: 70px">
		<input type="hidden" name="id" value="${param.id}">
		<c:if test="${login != 'admin'}">
			<h3
				style="text-shadow: 1px 1px 0 #444; background-color: dodgerblue; color: white;">
				<b><a style="text-decoration: none;"
					href="../member/info.me?id=${sessionScope.login}">ȸ����������</a></b> | <b><a
					style="text-decoration: none;"
					href="../accompany/myacmgroup.ao?id=${sessionScope.login}">���絿��Ȯ��</a></b>
				| <b><a style="text-decoration: none;"
					href="../accompany/acmgroup.ao?id=${sessionScope.login}">��û�ѵ���Ȯ��</a></b>
				| <b><a style="text-decoration: none;"
					href="../board/myboard.bo?id=${sessionScope.login}">���Խù�Ȯ��</a></b>
			</h3>
		</c:if>
		<c:if test="${login == 'admin'}">
			<h4
				style="text-shadow: 1px 1px 0 #444; background-color: dodgerblue; color: white;">
				<b><a style="text-decoration: none;"
					href="info.me?id=${sessionScope.login}">���������� ����</a></b> | <b><a
					style="text-decoration: none;"
					href="list.me?id=${sessionScope.login}">��� ȸ������ ����</a></b> | <b><a
					style="text-decoration: none;"
					href="../accompany/myacmgroup.ao?id=${sessionScope.login}">���
						����׷� Ȯ��</a></b> | <b><a style="text-decoration: none;"
					href="../board/myboard.bo?id=${sessionScope.login}">��� �Խù� Ȯ��</a></b>
			</h4>
		</c:if>
		<h1 style="text-shadow: 1px 1px 0 #444">
			<b>����Ȯ�� ��й�ȣ �Է�</b>
		</h1>
		<div class="w3-container">
			<div class="w3-ul w3-card-4">
				<table class="table14_11" style="width: 100%">
					<tr>
						<td><b>��й�ȣ</b></td>
						<td><input type="password" name="pass"></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="Ż���ϱ�" class="myButton1"></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</body>
</html>