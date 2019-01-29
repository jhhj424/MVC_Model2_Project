<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ��û�� ���� �׷� ����</title>
</head>

<body>
<style type="text/css">
.comment {
	-moz-box-shadow: 0px 0px 0px 2px #9fb4f2;
	-webkit-box-shadow: 0px 0px 0px 2px #9fb4f2;
	box-shadow: 0px 0px 0px 2px #9fb4f2;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #7892c2
		), color-stop(1, #476e9e));
	background: -moz-linear-gradient(top, #7892c2 5%, #476e9e 100%);
	background: -webkit-linear-gradient(top, #7892c2 5%, #476e9e 100%);
	background: -o-linear-gradient(top, #7892c2 5%, #476e9e 100%);
	background: -ms-linear-gradient(top, #7892c2 5%, #476e9e 100%);
	background: linear-gradient(to bottom, #7892c2 5%, #476e9e 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#7892c2',
		endColorstr='#476e9e', GradientType=0);
	background-color: #7892c2;
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	border-radius: 10px;
	border: 1px solid #4e6096;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: Arial;
	font-size: 13px;
	padding: 7px 12px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #283966;
}

.comment:hover {
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #476e9e
		), color-stop(1, #7892c2));
	background: -moz-linear-gradient(top, #476e9e 5%, #7892c2 100%);
	background: -webkit-linear-gradient(top, #476e9e 5%, #7892c2 100%);
	background: -o-linear-gradient(top, #476e9e 5%, #7892c2 100%);
	background: -ms-linear-gradient(top, #476e9e 5%, #7892c2 100%);
	background: linear-gradient(to bottom, #476e9e 5%, #7892c2 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#476e9e',
		endColorstr='#7892c2', GradientType=0);
	background-color: #476e9e;
}

.comment:active {
	position: relative;
	top: 1px;
}
</style>
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
		<b>���� ��û�� ���� �׷�</b>
	</h1>
	<table border="1" style="border-collapse: collapse; width: 100%" class="table14_11">
		<c:if test="${boardcount==0 }">
			<tr>
				<td colspan="5" align="center">��û�� ���� �׷��� �����ϴ�.</td>
			</tr>
		</c:if>
		<c:if test="${boardcount > 0 }">
			<tr>
				<td colspan="5" align="right"><b>���� ��û �� : ${boardcount} / 10</b>
				<input type="hidden" name="num" value="0">
				</td>
			</tr>
			<tr align="center" valign="middle">
				<th width="8%">��ȣ</th>
				<th width="50%">����</th>
				<th width="14%">�ۼ���</th>
				<th width="17%">��¥</th>
				<th width="11%">��û����</th>
			</tr>
			<c:forEach var="b" items="${aclist}">
				<tr align="center" valign="middle">
					<td>${boardnum}</td>
					<c:set var="boardnum" value="${boardnum -1 }" />
					<td align="left">
						<%-- empty : b.file1 == null || b.file1 == ""  --%> <c:if
							test="${!empty b.file1 }">
							<c:if test="${!empty login}">
								<a href="file/${b.file1 }" style="text-decoration: none;"> <img
									src="file/file.PNG" width=15 height=15></a>
							</c:if>
							<%-- @</a> -->
		<%-- @</a>  =>  <img src ="file/file.PNG" width=15 height=15></a> --%>
						</c:if> <c:if test="${empty b.file1 }">&nbsp;&nbsp;&nbsp;</c:if> <%-- info.bo : num �Ķ���Ϳ� �ش��ϴ� �Խù��� db���� ��ȸ�ϱ�
					info.jsp�� �ش� ������ ����ϱ� --%> <a
						href="../board/info.bo?num=${b.num}&type=${b.type}&my=${3}"
						style="text-decoration: none">${b.subject }</a> <c:if
							test="${b.type==1 }">
							<img src="${path}/recmd.png" width="12" height="12"
								style="margin-bottom: 4px"> ${b.recmd }
		</c:if>
					</td>
					<td>${b.id }</td>
					<td><jsp:useBean id="day" class="java.util.Date" /> <%--	<jsp:useBean id="day" class="java.util.Date"/> ���� 
				���ó�¥�� �ۼ��� ���ص��ǰ� 
		----------------------------------------------------------------------------
				BoardAllAction����  
				SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
				request.setAttribute("today", df.format(new Date()));
				����ؼ� �� �Ѱܿͼ� ���ص���
		--%> <f:formatDate value="${day}" pattern="yyyyMMdd" var="today" /> <f:formatDate
							value="${b.regdate }" pattern="yyyyMMdd" var="rdate" /> <c:if
							test="${today == rdate}">
							<f:formatDate value="${b.regdate }" pattern="HH:mm:ss" />
						</c:if> <c:if test="${today != rdate}">
							<f:formatDate value="${b.regdate }" pattern="yy/MM/dd HH:mm:ss" />
						</c:if></td>
					<c:forEach items="${accompanylist }" var="c">
						<c:if test="${c.num==b.num }">
							<td><c:if test="${c.chk==1 }">�����...</c:if> <c:if
									test="${c.chk==3 }">����
												<button type="button" class="comment"
										onclick="location.href='delete.ao?id=${sessionScope.login}&num=${b.num}' ">�������</button>					
								</c:if> <c:if test="${c.chk==2 }">�³�</c:if></td>
						</c:if>
					</c:forEach>
				</tr>
			</c:forEach>
			<%-- ������ �κ� ����ϱ� --%>
			<%-- <tr align="center">
				<td colspan="5"><c:if test="${pageNum <=1 }">
						<button type="button" class="w3-button w3-round w3-black">
							����</button>
					</c:if> <c:if test="${pageNum > 1 }">
						<button type="button"
							onclick="location.href='javascript:listcall(${pageNum-1 })' "
							class="w3-button w3-round w3-black">����</button>
					</c:if> <c:forEach var="a" begin="${startpage }" end="${endpage }">
						<c:if test="${a==pageNum }">
							<button type="button" class="w3-button w3-round w3-black">
								${a }</button>
						</c:if>
						<c:if test="${a!=pageNum }">
							<button type="button"
								onclick="location.href='javascript:listcall(${a })' "
								class="w3-button w3-round w3-black">${a }</button>
						</c:if>
					</c:forEach> <c:if test="${pageNum >= maxpage }">
						<button type="button" class="w3-button w3-round w3-black">
							����</button>
					</c:if> <c:if test="${pageNum < maxpage }">
						<button type="button"
							onclick="location.href='javascript:listcall(${pageNum+1})' "
							class="w3-button w3-round w3-black">����
					</c:if></td>
			</tr> --%>
		</c:if>
		<tr>
			<td colspan="5" align="right">
				<%-- <form action="acmgroup.ao?id=${sessionScope.login }" method="post" name="sf">
					<input type="hidden" name="pageNum" value="1">�Խñ� �˻�: <select
						name="column">
						<option value="">�����ϼ���</option>
						<option value="subject">����</option>
						<option value="centent">����</option>
						<option value="name">�ۼ���</option>
					</select>
					<script type="text/javascript">
						document.sf.column.value = "${param.column}";
					</script>
					<input type="text" name="find" size="50" value="${find }">
					<input type="submit" value="�˻�">
				</form> --%>
			</td>
		</tr>
	</table>
</body>
</html>