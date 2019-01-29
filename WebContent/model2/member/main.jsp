<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%--/WebContent/model2/member/main.jsp --%>
<html>
<head>
<title>Travel maker home</title>
<script type="text/javascript">
	function listcall(page) {
		document.sf.pageNum.value = page;
		document.sf.submit();
	}
</script>
<style>
.mydiv {
	width: 400px;
	height: 500px;
	border: thin;
	border-bottom-color: black;
}

.grid {
	/* Grid Fallback */
	display: flex;
	flex-wrap: wrap;
	/* Supports Grid */
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(1000px, 1fr));
	grid-auto-rows: minmax(500px, auto);
	grid-gap: 2em;
}

.module {
	/* Demo-Specific Styles */
	/* background: #eaeaea; */
	background: white;
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100%;
	/* border : 5px solid black; */
	/* Flex Fallback */
	margin-left: 5px;
	margin-right: 5px;
	flex: 1 1 200px;
}

/* If Grid is supported, remove the margin we set for the fallback */
@
supports (display: grid ) { .module {
	margin: 0;
}
}
</style>
</head>
<body>
	<div class="grid">

		<div class="module">
			<iframe width="100%" height="500"
				src="//www.youtube.com/embed/wzM2K0h1j4Y?&amp;autoplay=1&amp;loop=1 frameborder="
				frameborder="0" allowfullscreen></iframe>
		</div>


		<div class="module">
			<table border="1" style="border-collapse: collapse; width: 100%"
				class=table14_11>
				<caption>
					<h1>공지사항</h1>
				</caption>
				<tr align="center" valign="middle">
					<th width="8%">번호</th>
					<th width="50%">제목</th>
					<th width="14%">작성자</th>
					<th width="17%">날짜</th>
					<th width="11%">조회수</th>
				</tr>
				<c:forEach var="b" items="${list}">
					<tr align="center" valign="middle">
						<td>${boardnum}</td>
						<c:set var="boardnum" value="${boardnum -1 }" />
						<td align="left">
							<%-- empty : b.file1 == null || b.file1 == ""  --%> <c:if
								test="${!empty b.file1 }">
								<c:if test="${!empty login}">
									<a href="file/${b.file1 }" style="text-decoration: none;">
										<img src="file/file.PNG" width=15 height=15>
									</a>
								</c:if>
								<%-- @</a> -->
		<%-- @</a>  =>  <img src ="file/file.PNG" width=15 height=15></a> --%>
							</c:if> <c:if test="${empty b.file1 }">&nbsp;&nbsp;&nbsp;</c:if> <%-- info.bo : num 파라미터에 해당하는 게시물을 db에서 조회하기
					info.jsp에 해당 내용을 출력하기 --%> <a
							href="../board/info.bo?num=${b.num}&type=${b.type}"
							style="text-decoration: none">${b.subject }</a> <c:if
								test="${b.type==1 }">
								<img src="${path}/recmd.png" width="12" height="12"
									style="margin-bottom: 4px"> ${b.recmd }
		</c:if>
						</td>
						<td>관리자</td>
						<td><jsp:useBean id="day" class="java.util.Date" /> <%--	<jsp:useBean id="day" class="java.util.Date"/> 으로 
				오늘날짜랑 작성날 비교해도되고 
		----------------------------------------------------------------------------
				BoardAllAction에서  
				SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
				request.setAttribute("today", df.format(new Date()));
				사용해서 값 넘겨와서 비교해도됨
		--%> <f:formatDate value="${day}" pattern="yyyyMMdd" var="today" /> <f:formatDate
								value="${b.regdate }" pattern="yyyyMMdd" var="rdate" /> <c:if
								test="${today == rdate}">
								<f:formatDate value="${b.regdate }" pattern="HH:mm:ss" />
							</c:if> <c:if test="${today != rdate}">
								<f:formatDate value="${b.regdate }" pattern="yy/MM/dd HH:mm:ss" />
							</c:if></td>
						<td>${b.readcnt }</td>
					</tr>
				</c:forEach>
				<%-- 페이지 부분 출력하기 --%>
				<tr align="center">
					<td colspan="5"><c:if test="${pageNum <=1 }">
							<button type="button" class="myButton">이전</button>
						</c:if> <c:if test="${pageNum > 1 }">
							<button type="button"
								onclick="location.href='javascript:listcall(${pageNum-1 })' "
								class="myButton">이전</button>
						</c:if> <c:forEach var="a" begin="${startpage }" end="${endpage }">
							<c:if test="${a==pageNum }">
								<button type="button" class="myButton">${a }</button>
							</c:if>
							<c:if test="${a!=pageNum }">
								<button type="button"
									onclick="location.href='javascript:listcall(${a })' "
									class="myButton">${a }</button>
							</c:if>
						</c:forEach> <c:if test="${pageNum >= maxpage }">
							<button type="button" class="myButton">다음</button>
						</c:if> <c:if test="${pageNum < maxpage }">
							<button type="button"
								onclick="location.href='javascript:listcall(${pageNum+1})' "
								class="myButton">다음
						</c:if></td>
				</tr>
				<c:if test="${sessionScope.login=='admin' }">
				<tr>
					<td colspan="5">
						<button type="button" onclick="location.href='../board/writeForm3.bo' "
							class="myButton1">글쓰기</button>
					</td>
				</tr>
				</c:if>
				<tr>
					<td colspan="5" align="right">
						<form action="../member/main.me?id=${sessionScope.login }"
							method="post" name="sf">
							<input type="hidden" name="pageNum" value="1"><%-- 게시글 검색: <select
								name="column">
								<option value="">선택하세요</option>
								<option value="subject">제목</option>
								<option value="centent">내용</option>
							</select>
							<script type="text/javascript">
								document.sf.column.value = "${param.column}";
							</script>
							<input type="text" name="find" size="40" value="${find }">
							<input type="submit" value="검색" class="myButton1"> --%>
						</form>
					</td>
				</tr>
			</table>
		</div>

	</div>
</body>
</html>