<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	//�ٹٲ�
	pageContext.setAttribute("br","<br/>");
	pageContext.setAttribute("cn","\n");
%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%--
	--- BoardAllAction.info �޼��� ����
	1. num �Ķ���͸� �̿��Ͽ� db���� �ش� �Խù� ������ ��ȸ
		Board BoardDao.selectOne(num)
	2. readcnt ���� +1�� �����ϱ�.
		BoardDao.readcntadd(num)
	--- info.jsp�� ��� : jstl�� el�� ����
	3. Board�� ������ ȭ�鿡 ����ϱ�
 --%>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="EUC-KR">
<title>�Խù� �� ����</title>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	function comment_submit() {
		if (document.f.comment.value == '') {
			alert("����� �Է��ϼ���");
			document.f.comment.focus();
			return;
		}
		document.f.submit();
	}

	$(document).ready(
			function() {
				$("#rec").click(
						function() {
							var data = "num=" + $("#num").val();
							$.ajax({
								url : "recmd.jsp",
								type : "post",
								data : data,
								success : function(data) {
									alert("��õ�� �Ϸ�Ǿ����ϴ�!");
									$(".recview").val("��õ�� : " + data);
								},
								error : function(xhr, status, error) { //�������� ����
									alert("�������� : " + xhr.status + ", error : "
											+ error + ", status : " + status);
								}
							})
						})
			})
</script>
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
</head>
<body class="b1">
	<form action="comment.bo" method="post" name="f">
		<input type="hidden" name="num" id="num" value="${param.num }">
		<input type="hidden" name="id" value="${board.id }"> <input
			type="hidden" name="type" value="${param.type }">
		<c:if test="${empty param.my || param.my==0}">
			<input type="hidden" name="my" value="0">
		</c:if>
		<c:if test="${param.my==1}">
			<input type="hidden" name="my" value="1">
		</c:if>
		<c:if test="${param.my==2 }">
			<input type="hidden" name="my" value="2">
		</c:if>
		<c:if test="${param.my==3 }">
			<input type="hidden" name="my" value="3">
		</c:if>
		<c:if test="${param.my==4 }">
			<input type="hidden" name="my" value="4">
		</c:if>
		<c:if test="${board.type==1 }">
			<h1>
				<b>������ ��õ & ���� �Խ��� �󼼺���</b>
			</h1>
		</c:if>
		<c:if test="${board.type==2 }">
			<h1>
				<b>������ ���� �Խ��� �󼼺���</b>
			</h1>
		</c:if>
		<c:if test="${board.type==3 }">
			<h1>
				<b>����&�亯 �Խ��� �󼼺���</b>
			</h1>
		</c:if>
		<c:if test="${board.type==4 }">
			<h1>
				<b>��������</b>
			</h1>
		</c:if>
		<div class="w3-container">
			<div class="w3-ul w3-card-4">
				<table class="table14_10" style="width: 100%">
					<c:if test="${board.type!=3 && board.type!=4}">
						<tr>
							<td align="center">����</td>
							<td width="20%" colspan="3">${board.subject }</td>
							<td align="center">���౹�� : ${board.country }</td>
							<td align="center">�������� : ${board.loc }</td>
						<tr>
						<tr>
							<td align="center" >�۾���</td>
							<td width="20%" colspan="2">${board.id }</td>
							<td align="center">��߳�¥ : ${board.sdate}</td>
							<td align="center">������¥ : ${board.edate}</td>
							<c:if test="${board.type==1 }">
								<td align="center"><input class="recview"
									style="text-align: center;" readonly
									value="��õ�� : ${board.recmd}"></td>
							</c:if>
							<c:if test="${board.type==2 }">
								<td align="center">�����ο����� : ${anum} / ${board.maxpno}</td>
							</c:if>
						</tr>
					</c:if>
					<c:if test="${board.type==3 || board.type==4}">
						<tr>
							<td align="center" style="min-width: 80px;max-width: 80px;">�۾���</td>
							<td>${board.id }</td>
						<tr>
						<tr>
							<td align="center" style="min-width: 80px;max-width: 80px;">����</td>
							<td>${board.subject }</td>
						</tr>
					</c:if>
					<tr>
						<td valign="middle" align="center" style="min-width: 80px;max-width: 80px;">����</td>
						<td colspan="5">
							<div>
								<c:if test="${!empty board.file1 }">
									<img src="${path}/model2/board/file/${board.file1}" style="max-width: 500px; max-height:500px;">
									<br>
								</c:if>
								<div style="padding: 30px; margin: 30px; text-align: left; min-width: 800px;max-width: 800px">
								${fn:replace(board.content, cn, br)}
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td align="center" style="min-width: 80px;max-width: 80px;">÷������</td>
						<td colspan="5" style="padding-right: 10%"><c:if
								test="${!empty board.file1}">
								<a href="file/${board.file1 }">${board.file1 }</a>
							</c:if> <c:if test="${empty board.file1}">
	[���Ͼ���]
</c:if></td>
					</tr>
					<tr align="center" valign="middle">
						<td colspan="6" align="center" valign="middle"
							style="text-align: center;"><c:if
								test="${sessionScope.login == 'admin'}">
								<button type="button" class="myButton"
									onclick="location.href='updateForm.bo?num=${board.num }&type=${board.type }' ">����</button>
								<button type="button" class="myButton"
									onclick="location.href='delete.bo?num=${board.num }&type=${board.type }' ">����</button>
							</c:if> <c:if
								test="${(sessionScope.login == board.id) && (sessionScope.login!='admin')}">
								<button type="button" class="myButton"
									onclick="location.href='updateForm.bo?num=${board.num }&type=${board.type }' ">����</button>
								<button type="button" class="myButton"
									onclick="location.href='deleteForm.bo?num=${board.num }&type=${board.type }' ">����</button>
							</c:if> <c:if test="${board.type==1 }">
								<c:if test="${param.my==0 || empty param.my}">
									<button type="button" class="myButton"
										onclick="location.href='list.bo?type=1' ">���</button>
									<button type="button" class="myButton" id="rec"<%-- 
										onclick="location.href='recmd.bo?num=${board.num }' " --%>>��õ</button>
								</c:if>
							</c:if> <c:if test="${board.type==2 }">
								<c:if test="${param.my==0 || empty param.my}">
									<button type="button" class="myButton"
										onclick="location.href='list2.bo?type=2' ">���</button>
									<button type="button" class="myButton"
										onclick="location.href='../accompany/accompany.ao?type=${board.type }&num=${board.num }&id=${sessionScope.login}' ">�����û</button>
								</c:if>
							</c:if> <c:if test="${board.type==3 }">
								<c:if test="${param.my==0 || empty param.my}">
									<button type="button" class="myButton"
										onclick="location.href='list3.bo?type=3' ">���</button>
								</c:if>
							</c:if> <c:if test="${board.type==4 }">
								<c:if test="${param.my==0 || empty param.my}">
									<button type="button" class="myButton"
										onclick="location.href='../member/main.me' ">�ڷΰ���</button>
								</c:if>
							</c:if> <c:if test="${param.my==2}">
								<button type="button" class="myButton"
									onclick="location.href='../board/myboard.bo?id=${sessionScope.login}' ">�ڷΰ���</button>
							</c:if> <c:if test="${param.my==3}">
								<button type="button" class="myButton"
									onclick="location.href='../accompany/acmgroup.ao?id=${sessionScope.login}' ">�ڷΰ���</button>
							</c:if> <c:if test="${param.my==4}">
								<button type="button" class="myButton"
									onclick="location.href='../accompany/accompanylist.ao?id=${sessionScope.login}&num=${board.num }' ">��ûȸ������</button>
								<button type="button" class="myButton"
									onclick="location.href='../accompany/myacmgroup.ao?id=${sessionScope.login}' ">�ڷΰ���</button>
							</c:if></td>
					</tr>
				</table>
			</div>
		</div>
		<br>
		<div class="w3-container">
			<div class="w3-ul w3-card-4">
				<table class="table14_10" style="width: 100%">
					<c:if test="${commentCount==0 }">
						<tr>
							<td colspan="5" align="center">��ϵ� ����� �����ϴ�.</td>
						</tr>
					</c:if>
					<c:if test="${commentCount > 0 }">
						<tr>
							<td colspan="3" style="text-align: center;">�޸���� :
								${commentCount} �� / ���������:${pageNum }</td>
						</tr>
						<c:forEach items="${comment}" var="c">
							<tr>
								<td>${c.id }��</td>
								<td style="min-width: 600px; text-align: left; max-width: 600px"><div style="width: 100%; height: 100%; margin-left: 10%; padding-right: 20%">
								${fn:replace(c.comment, cn, br)}</div></td>
								<td><c:if test="${c.id == sessionScope.login }">
										<f:formatDate value="${c.regdate }"
											pattern="yy/MM/dd HH:mm:ss" />
											<br>
										<button type="button"
											onclick="location.href='commentdel.bo?cnum=${c.cnum}&num=${c.num }&type=${param.type }&my=${param.my==null?0:param.my }' ">��ۻ���</button>
									</c:if> <c:if test="${c.id != sessionScope.login }">
										<f:formatDate value="${c.regdate }"
											pattern="yy/MM/dd HH:mm:ss" />
									</c:if></td>
							</tr>
						</c:forEach>
						<%-- ������ �κ� ����ϱ� --%>
						<tr align="center">
							<td colspan="3"><c:if test="${pageNum <=1 }">
									<button type="button" class="comment">����</button>
								</c:if> <c:if test="${pageNum > 1 }">
									<button type="button"
										onclick="location.href='info.bo?pageNum=${pageNum-1 }&num=${board.num}&type=${board.type}&id=${sessionScope.login }' "
										class="comment">����</button>
								</c:if> <c:forEach var="a" begin="${startpage }" end="${endpage }">
									<c:if test="${a==pageNum }">
										<button type="button" class="comment">${a }</button>
									</c:if>
									<c:if test="${a!=pageNum }">
										<button type="button"
											onclick="location.href='info.bo?pageNum=${a }&num=${board.num}&type=${board.type}&id=${sessionScope.login }' "
											class="comment">${a }</button>
									</c:if>
								</c:forEach> <c:if test="${pageNum >= maxpage }">
									<button type="button" class="comment">����</button>
								</c:if> <c:if test="${pageNum < maxpage }">
									<button type="button" class="comment"
										onclick="location.href='info.bo?pageNum=${pageNum+1}&num=${board.num}&type=${board.type}&id=${sessionScope.login }' ">����</button>
									
								</c:if></td>
						</tr>
					</c:if>
				</table>
			</div>
		</div>
		<br>
		<div class="w3-container">
			<div class="w3-ul w3-card-4">
				<table class="table14_10" style="width: 100%">
					<tr>
						<td>��۾���</td>
						<td><textarea required="required" rows="2" cols="75"
								name="comment"></textarea></td>
						<td>
							<button type="button"
								onclick="location.href='javascript:comment_submit()' "
								class="comment">��۵��</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</body>
</html>
