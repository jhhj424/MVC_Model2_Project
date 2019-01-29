<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
	게시물수정 전 화면
	1. num 파라미터 해당하는 게시물 db에서 읽어 화면에 출력.
	2. 첨부파일 수정도 가능함.
 --%>
<%--
	update.bo
	1. 파라미터 정보 Board 객체로 저장.
	2. 비밀번호가 맞으면
		board 객체를 db에서 변경하기 BoardDao.update(Board)
	      비밀번호가 틀리면
	   	updateForm.bo 페이지 이동하기
	3. 수정 성공 : list.bo 페이지 이동하기
	      수정 실패 : updateForm.bo 페이지 이동하기
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판 수정 화면</title>
<script type="text/javascript">
	function file_delete() {
		document.f.file2.value = "";
		file_desc.innerHTML = "";
	}
</script>
<script type="text/javascript">
function dateSelect(docForm,selectIndex) {
	watch = new Date(docForm.year.options[docForm.year.selectedIndex].text, docForm.month.options[docForm.month.selectedIndex].value,1);
	hourDiffer = watch - 86400000;
	calendar = new Date(hourDiffer);

	var daysInMonth = calendar.getDate();
		for (var i = 0; i < docForm.day.length; i++) {
			docForm.day.options[0] = null;
		}
		for (var i = 0; i < daysInMonth; i++) {
			docForm.day.options[i] = new Option(i+1);
	}
	document.form1.day.options[0].selected = true;
}
</script>

<script type="text/javascript">
function sdate(year,mon,day){
     if(year == "null" && mon == "null" && day == "null"){       
     today = new Date();
     this_year=today.getFullYear();
     this_month=today.getMonth();
     this_month+=1;
     if(this_month <10) this_month="0" + this_month;
 
     this_day=today.getDate();
     if(this_day<10) this_day="0" + this_day;     
 }
 else{  
     var this_year = eval(year);
     var this_month = eval(mon); 
     var this_day = eval(day);
     }
 
  montharray=new Array(31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31); 
  maxdays = montharray[this_month-1]; 
//아래는 윤달을 구하는 것
  if (this_month==2) { 
      if ((this_year/4)!=parseInt(this_year/4)) maxdays=28;  
      else maxdays=29; 
  } 
 
 document.writeln("<select name='syear' size=1 onChange='dateSelect(this.form,this.form.month.selectedIndex);'>");
     for(i=this_year-30;i<this_year+30;i++){//현재 년도에서 과거로 100년까지 미래로 0년까지를 표시함
         if(i==this_year) document.writeln("<OPTION VALUE="+i+ " selected >" +i); 
         else document.writeln("<OPTION VALUE="+i+ ">" +i); 
     }    
 document.writeln("</select>년");      

 
 document.writeln("<select name='smonth' size=1 onChange='dateSelect(this.form,this.selectedIndex);'>");
     for(i=1;i<=12;i++){ 
         if(i<10){
             if(i==this_month) document.writeln("<OPTION VALUE=0" +i+ " selected >0"+i); 
             else document.writeln("<OPTION VALUE=0" +i+ ">0"+i);
         }         
         else{
             if(i==this_month) document.writeln("<OPTION VALUE=" +i+ " selected >" +i);  
             else document.writeln("<OPTION VALUE=" +i+ ">" +i);  
         }                     
    }         
 document.writeln("</select>월");
 
 document.writeln("<select name='sday' size=1>");
     for(i=1;i<=maxdays;i++){ 
         if(i<10){
             if(i==this_day) document.writeln("<OPTION VALUE=0" +i+ " selected >0"+i); 
             else document.writeln("<OPTION VALUE=0" +i+ ">0"+i); 
         }
         
         else{
             if(i==this_day) document.writeln("<OPTION VALUE=" +i+ " selected } >"+i); 
             else document.writeln("<OPTION VALUE=" +i+ ">" +i);  
         }                     
    }         
 document.writeln("</select>일"); 
   
}
</script>
<script type="text/javascript">
function edate(year,mon,day){
     if(year == "null" && mon == "null" && day == "null"){       
     today = new Date();
     this_year=today.getFullYear();
     this_month=today.getMonth();
     this_month+=1;
     if(this_month <10) this_month="0" + this_month;
 
     this_day=today.getDate();
     if(this_day<10) this_day="0" + this_day;     
 }
 else{  
     var this_year = eval(year);
     var this_month = eval(mon); 
     var this_day = eval(day);
     }
 
  montharray=new Array(31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31); 
  maxdays = montharray[this_month-1]; 
//아래는 윤달을 구하는 것
  if (this_month==2) { 
      if ((this_year/4)!=parseInt(this_year/4)) maxdays=28; 
      else maxdays=29; 
  } 
 
 document.writeln("<select name='eyear' size=1 onChange='dateSelect(this.form,this.form.month.selectedIndex);'>");
     for(i=this_year-30;i<this_year+30;i++){//현재 년도에서 과거로 100년까지 미래로 0년까지를 표시함
         if(i==this_year) document.writeln("<OPTION VALUE="+i+ " selected >" +i); 
         else document.writeln("<OPTION VALUE="+i+ ">" +i); 
     }    
 document.writeln("</select>년");      

 
 document.writeln("<select name='emonth' size=1 onChange='dateSelect(this.form,this.selectedIndex);'>");
     for(i=1;i<=12;i++){ 
         if(i<10){
             if(i==this_month) document.writeln("<OPTION VALUE=0" +i+ " selected >0"+i); 
             else document.writeln("<OPTION VALUE=0" +i+ ">0"+i);
         }         
         else{
             if(i==this_month) document.writeln("<OPTION VALUE=" +i+ " selected >" +i);  
             else document.writeln("<OPTION VALUE=" +i+ ">" +i);  
         }                     
    }         
 document.writeln("</select>월");
 
 document.writeln("<select name='eday' size=1>");
     for(i=1;i<=maxdays;i++){ 
         if(i<10){
             if(i==this_day) document.writeln("<OPTION VALUE=0" +i+ " selected >0"+i); 
             else document.writeln("<OPTION VALUE=0" +i+ ">0"+i); 
         }
         
         else{
             if(i==this_day) document.writeln("<OPTION VALUE=" +i+ " selected } >"+i); 
             else document.writeln("<OPTION VALUE=" +i+ ">" +i);  
         }                     
    }         
 document.writeln("</select>일"); 
   
}
</script>
</head>
<body>
	<form action="update.bo" method="post" name="f"
		enctype="multipart/form-data">
		<input type="hidden" name="num" value="${board.num }"> <input
			type="hidden" name="type" value="${param.type}"> <input
			type="hidden" name="file2" value="${board.file1}">
		<table border="1" style="border-collapse: collapse;"
			class="w3-table  ">
			<caption>
				<c:if test="${board.type==1 }">
					<h1>
						<b>여행지 추천 & 리뷰 게시판 글 수정</b>
					</h1>
				</c:if>
				<c:if test="${board.type==2 }">
					<h1>
						<b>동행자 모집 게시판 상세보기 글 수정</b>
					</h1>
				</c:if>
				<c:if test="${board.type==3 }">
					<h1>
						<b>질문&답변 게시판 상세보기 글 수정</b>
					</h1>
				</c:if>
				<c:if test="${board.type==4 }">
					<h1>
						<b>공지사항 글 수정</b>
					</h1>
				</c:if>
			</caption>
			<c:if test="${board.type!=3 && board.type!=4 }">
				<tr>
					<td align="center">글쓴이</td>
					<td><input type="text" name="name" value="${board.id }"
						readonly></td>
					<td align="center" width="10%">여행국가</td>
					<td><input type="text" name="country"
						value="${board.country }"></td>
					<td align="center">여행지역</td>
					<td><input type="text" name="loc" value="${board.loc }"></td>
				<tr>
				<tr>
					<td align="center">비밀번호</td>
					<td><input type="password" name="pass" required="required"
						value=""></td>
					<td align="center">출발날짜</td>
					<td><script> sdate(${syear},${smonth},${sday}); </script></td>
					<td align="center">도착날짜</td>
					<td><script> edate(${eyear},${emonth},${eday}); </script></td>
				</tr>
				<tr>
					<td align="center">제목</td>
					<td colspan="4" align="left"><input type="text" name="subject"
						value="${board.subject }"></td>
					<c:if test="${board.type==1 }">
						<td align="center" width="100px">추천수 : ${board.recmd}</td>
					</c:if>
					<c:if test="${board.type==2 }">
						<td align="center" width="15px">동행인원정보 : 0 / <input
							type="text" value="${board.maxpno}" name="maxpno" style="width: 50px; text-align: center;"></td>
					</c:if>
				</tr>
			</c:if>
			<c:if test="${board.type==3 || board.type==4}">
				<tr>
					<td align="center">글쓴이</td>
					<td align="left"><input type="text" name="name"
						value="${board.id}" readonly></td>
				</tr>
				<tr>
					<td align="center">비밀번호</td>
					<td align="left"><input type="password" name="pass"
						value=""></td>
				</tr>
				<tr>
					<td align="center">제목</td>
					<td colspan="4" align="left"><input type="text" name="subject"
						value="${board.subject }"></td>
				</tr>
			</c:if>
			<tr>
				<td align="center">내용</td>
				<td colspan="5"><textarea required="required" rows="15"
						cols="92" name="content">${board.content }</textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td colspan="5"><c:if test="${!empty board.file1 }">
						<div id="file_desc">${board.file1}<a
								href="javascript:file_delete()">[첨부파일삭제]</a>
						</div>
					</c:if> <c:if test="${empty board.file1 }">
					</c:if> <input type="file" name="file1"></td>
			</tr>
			<tr>
				<td colspan="6" align="center" style="text-align: center;">
					<button type="button" class="myButton1"
						onclick="location.href='javascript:document.f.submit()' ">게시물수정</button>
					<button type="button" class="myButton1"
						onclick="location.href='javascript:history.go(-1)' ">뒤로가기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>