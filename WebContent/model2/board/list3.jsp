<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%--
	1. pageNum �Ķ���� ����. pageNum �Ķ���Ͱ� ������ 1�� ����
	2. ���������� 10�Ǿ� �Խù� ���
		=> db���� �ش� �������� ��µǴ� �Խù��� ��ȸ. ��������
	3. �Խù� ȭ�鿡 ���
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����&�亯 �Խ���</title>
<script type="text/javascript">
	function listcall(page) {
		document.sf.pageNum.value=page;
		document.sf.submit();
	}
</script>
</head>
<body>
		<h1 style="text-shadow: 1px 1px 0 #444; color: dodgerblue;">
			<b>����&�亯 �Խ���</b>
		</h1>
<table border="1" style="border-collapse: collapse; width: 100%" class="table14_11">
<c:if test="${boardcount==0 }">
<tr><td colspan="5" align="center">��ϵ� �Խñ��� �����ϴ�.</td></tr>
</c:if>
<c:if test="${boardcount > 0 }">
<tr><td colspan="5" align="right">
			<b>�۰��� : ${boardcount}</b>
		</td></tr>
<tr align="center" valign="middle">
	<th width="8%">��ȣ</th><th width="50%">����</th>
	<th width="14%">�ۼ���</th><th width="17%">��¥</th>
	<th width="11%">��ȸ��</th>
</tr>
<c:forEach var="b" items="${list}">
<tr align="center" valign="middle">
	<td>${boardnum}</td>
	<c:set var="boardnum" value="${boardnum -1 }"/>
	<td align="left"> 
	<%-- empty : b.file1 == null || b.file1 == ""  --%>
	<c:if test="${!empty b.file1 }">
	<c:if test="${!empty login}">
		<a href = "file/${b.file1 }" style="text-decoration: none;">
		<img src ="file/file.PNG" width=15 height=15></a>
		</c:if><%-- @</a> -->
		<%-- @</a>  =>  <img src ="file/file.PNG" width=15 height=15></a> --%>
	</c:if>
	<c:if test="${empty b.file1 }">&nbsp;&nbsp;&nbsp;</c:if>
	<%-- info.bo : num �Ķ���Ϳ� �ش��ϴ� �Խù��� db���� ��ȸ�ϱ�
					info.jsp�� �ش� ������ ����ϱ� --%>
		<a href="info.bo?num=${b.num}&type=${b.type}" style="text-decoration:none">${b.subject }</a>
		</td><td>${b.id }</td><td>
		<jsp:useBean id="day" class="java.util.Date"/>
		<%--	<jsp:useBean id="day" class="java.util.Date"/> ���� 
				���ó�¥�� �ۼ��� ���ص��ǰ� 
		----------------------------------------------------------------------------
				BoardAllAction����  
				SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
				request.setAttribute("today", df.format(new Date()));
				����ؼ� �� �Ѱܿͼ� ���ص���
		--%>
		<f:formatDate value="${day}" pattern="yyyyMMdd" var="today"/>
		<f:formatDate value="${b.regdate }" pattern="yyyyMMdd" var = "rdate" />
		<c:if test="${today == rdate}">
			<f:formatDate value="${b.regdate }" pattern="HH:mm:ss"/></c:if>
		<c:if test="${today != rdate}">
			<f:formatDate value="${b.regdate }" pattern="yy/MM/dd HH:mm:ss"/></c:if>
			</td><td>${b.readcnt }
	</td></tr></c:forEach>
	<%-- ������ �κ� ����ϱ� --%>
	<tr align="center"><td colspan="5">
	<c:if test="${pageNum <=1 }">
		<button type="button"  class="myButton">
	����</button></c:if>
	<c:if test="${pageNum > 1 }">
		<button type="button" onclick="location.href='javascript:listcall(${pageNum-1 })' " class="myButton">
		����</button>
	</c:if>
	<c:forEach var="a" begin="${startpage }" end="${endpage }">
		<c:if test="${a==pageNum }">
		<button type="button"  class="myButton">
		${a }</button></c:if>
		<c:if test="${a!=pageNum }">
		<button type="button" onclick="location.href='javascript:listcall(${a })' " class="myButton">
		${a }</button>
		</c:if>
	</c:forEach>
	<c:if test="${pageNum >= maxpage }">
	<button type="button" class="myButton">
	����</button></c:if>
	<c:if test="${pageNum < maxpage }">
		<button type="button" onclick="location.href='javascript:listcall(${pageNum+1})' " class="myButton">
		����
	</c:if>
	</td></tr>
	</c:if><tr><td colspan="5">
<button type="button" onclick="location.href='writeForm3.bo' " class="myButton1">
�۾���</button></td></tr>
<tr><td colspan="5" align="right">
<form action="list.bo" method="post" name="sf">
	<input type="hidden" name="pageNum" value="1">�Խñ� �˻�:
	<input type="hidden" name="type" value="3">
	<select name="column">
		<option value="">�����ϼ���</option>
		<option value="subject">����</option>
		<option value="centent">����</option>
		<option value="id">�ۼ���</option>
	</select>
	<script type="text/javascript">
		document.sf.column.value="${param.column}";
	</script>
	<input type="text" name="find" size="40" value="${find }">
	<input type="submit" value="�˻�" class="myButton1">
</form></td></tr>
</table>
</body>
</html>