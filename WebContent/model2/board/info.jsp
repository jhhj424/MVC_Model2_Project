<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	//줄바꿈
	pageContext.setAttribute("br","<br/>");
	pageContext.setAttribute("cn","\n");
%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%--
	--- BoardAllAction.info 메서드 구현
	1. num 파라미터를 이용하여 db에서 해당 게시물 정보를 조회
		Board BoardDao.selectOne(num)
	2. readcnt 값을 +1로 증가하기.
		BoardDao.readcntadd(num)
	--- info.jsp에 출력 : jstl과 el로 변경
	3. Board의 정보를 화면에 출력하기
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
<title>게시물 상세 보기</title>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	function comment_submit() {
		if (document.f.comment.value == '') {
			alert("댓글을 입력하세요");
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
									alert("추천이 완료되었습니다!");
									$(".recview").val("추천수 : " + data);
								},
								error : function(xhr, status, error) { //서버응답 실패
									alert("서버오류 : " + xhr.status + ", error : "
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
				<b>여행지 추천 & 리뷰 게시판 상세보기</b>
			</h1>
		</c:if>
		<c:if test="${board.type==2 }">
			<h1>
				<b>동행자 모집 게시판 상세보기</b>
			</h1>
		</c:if>
		<c:if test="${board.type==3 }">
			<h1>
				<b>질문&답변 게시판 상세보기</b>
			</h1>
		</c:if>
		<c:if test="${board.type==4 }">
			<h1>
				<b>공지사항</b>
			</h1>
		</c:if>
		<div class="w3-container">
			<div class="w3-ul w3-card-4">
				<table class="table14_10" style="width: 100%">
					<c:if test="${board.type!=3 && board.type!=4}">
						<tr>
							<td align="center">제목</td>
							<td width="20%" colspan="3">${board.subject }</td>
							<td align="center">여행국가 : ${board.country }</td>
							<td align="center">여행지역 : ${board.loc }</td>
						<tr>
						<tr>
							<td align="center" >글쓴이</td>
							<td width="20%" colspan="2">${board.id }</td>
							<td align="center">출발날짜 : ${board.sdate}</td>
							<td align="center">도착날짜 : ${board.edate}</td>
							<c:if test="${board.type==1 }">
								<td align="center"><input class="recview"
									style="text-align: center;" readonly
									value="추천수 : ${board.recmd}"></td>
							</c:if>
							<c:if test="${board.type==2 }">
								<td align="center">동행인원정보 : ${anum} / ${board.maxpno}</td>
							</c:if>
						</tr>
					</c:if>
					<c:if test="${board.type==3 || board.type==4}">
						<tr>
							<td align="center" style="min-width: 80px;max-width: 80px;">글쓴이</td>
							<td>${board.id }</td>
						<tr>
						<tr>
							<td align="center" style="min-width: 80px;max-width: 80px;">제목</td>
							<td>${board.subject }</td>
						</tr>
					</c:if>
					<tr>
						<td valign="middle" align="center" style="min-width: 80px;max-width: 80px;">내용</td>
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
						<td align="center" style="min-width: 80px;max-width: 80px;">첨부파일</td>
						<td colspan="5" style="padding-right: 10%"><c:if
								test="${!empty board.file1}">
								<a href="file/${board.file1 }">${board.file1 }</a>
							</c:if> <c:if test="${empty board.file1}">
	[파일없음]
</c:if></td>
					</tr>
					<tr align="center" valign="middle">
						<td colspan="6" align="center" valign="middle"
							style="text-align: center;"><c:if
								test="${sessionScope.login == 'admin'}">
								<button type="button" class="myButton"
									onclick="location.href='updateForm.bo?num=${board.num }&type=${board.type }' ">수정</button>
								<button type="button" class="myButton"
									onclick="location.href='delete.bo?num=${board.num }&type=${board.type }' ">삭제</button>
							</c:if> <c:if
								test="${(sessionScope.login == board.id) && (sessionScope.login!='admin')}">
								<button type="button" class="myButton"
									onclick="location.href='updateForm.bo?num=${board.num }&type=${board.type }' ">수정</button>
								<button type="button" class="myButton"
									onclick="location.href='deleteForm.bo?num=${board.num }&type=${board.type }' ">삭제</button>
							</c:if> <c:if test="${board.type==1 }">
								<c:if test="${param.my==0 || empty param.my}">
									<button type="button" class="myButton"
										onclick="location.href='list.bo?type=1' ">목록</button>
									<button type="button" class="myButton" id="rec"<%-- 
										onclick="location.href='recmd.bo?num=${board.num }' " --%>>추천</button>
								</c:if>
							</c:if> <c:if test="${board.type==2 }">
								<c:if test="${param.my==0 || empty param.my}">
									<button type="button" class="myButton"
										onclick="location.href='list2.bo?type=2' ">목록</button>
									<button type="button" class="myButton"
										onclick="location.href='../accompany/accompany.ao?type=${board.type }&num=${board.num }&id=${sessionScope.login}' ">동행신청</button>
								</c:if>
							</c:if> <c:if test="${board.type==3 }">
								<c:if test="${param.my==0 || empty param.my}">
									<button type="button" class="myButton"
										onclick="location.href='list3.bo?type=3' ">목록</button>
								</c:if>
							</c:if> <c:if test="${board.type==4 }">
								<c:if test="${param.my==0 || empty param.my}">
									<button type="button" class="myButton"
										onclick="location.href='../member/main.me' ">뒤로가기</button>
								</c:if>
							</c:if> <c:if test="${param.my==2}">
								<button type="button" class="myButton"
									onclick="location.href='../board/myboard.bo?id=${sessionScope.login}' ">뒤로가기</button>
							</c:if> <c:if test="${param.my==3}">
								<button type="button" class="myButton"
									onclick="location.href='../accompany/acmgroup.ao?id=${sessionScope.login}' ">뒤로가기</button>
							</c:if> <c:if test="${param.my==4}">
								<button type="button" class="myButton"
									onclick="location.href='../accompany/accompanylist.ao?id=${sessionScope.login}&num=${board.num }' ">신청회원보기</button>
								<button type="button" class="myButton"
									onclick="location.href='../accompany/myacmgroup.ao?id=${sessionScope.login}' ">뒤로가기</button>
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
							<td colspan="5" align="center">등록된 댓글이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${commentCount > 0 }">
						<tr>
							<td colspan="3" style="text-align: center;">달린댓글 :
								${commentCount} 개 / 댓글페이지:${pageNum }</td>
						</tr>
						<c:forEach items="${comment}" var="c">
							<tr>
								<td>${c.id }님</td>
								<td style="min-width: 600px; text-align: left; max-width: 600px"><div style="width: 100%; height: 100%; margin-left: 10%; padding-right: 20%">
								${fn:replace(c.comment, cn, br)}</div></td>
								<td><c:if test="${c.id == sessionScope.login }">
										<f:formatDate value="${c.regdate }"
											pattern="yy/MM/dd HH:mm:ss" />
											<br>
										<button type="button"
											onclick="location.href='commentdel.bo?cnum=${c.cnum}&num=${c.num }&type=${param.type }&my=${param.my==null?0:param.my }' ">댓글삭제</button>
									</c:if> <c:if test="${c.id != sessionScope.login }">
										<f:formatDate value="${c.regdate }"
											pattern="yy/MM/dd HH:mm:ss" />
									</c:if></td>
							</tr>
						</c:forEach>
						<%-- 페이지 부분 출력하기 --%>
						<tr align="center">
							<td colspan="3"><c:if test="${pageNum <=1 }">
									<button type="button" class="comment">이전</button>
								</c:if> <c:if test="${pageNum > 1 }">
									<button type="button"
										onclick="location.href='info.bo?pageNum=${pageNum-1 }&num=${board.num}&type=${board.type}&id=${sessionScope.login }' "
										class="comment">이전</button>
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
									<button type="button" class="comment">다음</button>
								</c:if> <c:if test="${pageNum < maxpage }">
									<button type="button" class="comment"
										onclick="location.href='info.bo?pageNum=${pageNum+1}&num=${board.num}&type=${board.type}&id=${sessionScope.login }' ">다음</button>
									
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
						<td>댓글쓰기</td>
						<td><textarea required="required" rows="2" cols="75"
								name="comment"></textarea></td>
						<td>
							<button type="button"
								onclick="location.href='javascript:comment_submit()' "
								class="comment">댓글등록</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</body>
</html>
