<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�� ���࿡ ��û�� ȸ�� ���</title>
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
			<b>�� ���࿡ ��û�� ȸ�� ���</b>
		</h1>
<div class="w3-container">
<div class="w3-ul w3-card-4" >
<table class="table14_11" style="width: 100%">
	<tr ><th>����</th><th>���̵�</th><th>�̸�</th><th>����</th><th>��ȭ</th><th>�̸���</th><th>��û����</th></tr>
	<c:forEach var="a" items="${accompanylist2}">
	<c:forEach var="m" items="${list }">
	<c:if test="${m.id==a.id }">
	<c:if test="${a.chk!=3 }">
	<tr class="w3-hover-light-grey w3-white"><td><img src="${path}/model2/member/img/sm_${m.picture }" width="50" height="50"></td>
	<td><a href="info.me?id=${m.id }" style="text-decoration:none">${m.id }</a></td><td>${m.name}</td>
	<td>${m.gender==1?"����":"����"}</td>
	<td>${m.tel}</td><td>${m.email}</td>
	<td>
	<c:if test="${a.chk==1 }">
	<button type="button" onclick="location.href='accept.ao?id=${m.id }&num=${param.num }' " class="myButton">
	����</button>
	<button type="button" onclick="location.href='refusal.ao?id=${m.id }&num=${param.num }' " class="myButton">
	����</button>
	</c:if>
	<c:if test="${a.chk==2 }">
	������ ��û
	</c:if>
	</td>
	</tr>
	</c:if>
	</c:if>
	</c:forEach></c:forEach>
</table>
</div>
</div>
</body>
</html>