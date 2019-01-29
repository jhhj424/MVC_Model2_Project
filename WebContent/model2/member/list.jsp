<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
	-- AdminUserAction �߻� Ŭ������ 1,2
	1. �α׾ƿ� ����
	�α����ϼ��� �޼��� ���. loginForm.jsp�� �̵�
	2. admin�� �ƴ� ���
	�����ڸ� ��ȸ �����մϴ�. �޼��� ���. main.jsp�� �̵�
	-- ListAction Ŭ������ 3,4
	3. admin�� ���
	   MemberDao Ŭ������ list �޼��� �߰��ϱ�
	   List<Member> list() ��� : ��� ��� ����� ����
	4. db���� ��ȸ�� list�� ȭ�� ����ϱ�
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ��� ����</title>
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
			<b><a style="text-decoration: none;"  href="../member/info.me?id=${sessionScope.login}" >���������� ����</a></b> | 
			<b><a style="text-decoration: none;"  href="../member/list.me?id=${sessionScope.login}" >��� ȸ������ ����</a></b> | 
			<b><a style="text-decoration: none;"  href="../accompany/myacmgroup.ao?id=${sessionScope.login}" >��� ����׷� Ȯ��</a></b> | 
			<b><a style="text-decoration: none;"  href="../board/myboard.bo?id=${sessionScope.login}" >��� �Խù� Ȯ��</a></b>
		</h4>
</c:if>
	<h1 style="text-shadow: 1px 1px 0 #444">
		<b>ȸ�� ��� ��ȸ</b>
	</h1>
	<div class="w3-container">
		<div class="w3-ul w3-card-4">
			<table class="table14_11" style="width: 100%">
				<tr>
					<th>����</th>
					<th>���̵�</th>
					<th>�̸�</th>
					<th>����</th>
					<th>��ȭ</th>
					<th>�̸���</th>
					<th>��û����</th>
				</tr>
				<c:forEach var="m" items="${list }">
					<tr>
						<td><img src="img/sm_${m.picture }" width="50" height="50"
							class="w3-bar-item w3-circle w3-hide-small"></td>
						<td><a href="info.me?id=${m.id }"
							style="text-decoration: none">${m.id }</a></td>
						<td>${m.name}</td>
						<td>${m.gender==1?"����":"����"}</td>
						<td>${m.tel}</td>
						<td>${m.email}</td>
						<td>
							<button type="button"
								onclick="location.href='updateForm.me?id=${m.id }' "
								class="myButton1">����</button>
							<button type="button"
								onclick="location.href='delete.me?id=${m.id }' "
								class="myButton1">����Ż��</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>