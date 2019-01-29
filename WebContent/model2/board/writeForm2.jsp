<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>동행 게시판 글쓰기</title>

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
<script type="text/javascript">
	function board_submit() {
		if (document.f.name.value == '') {
			alert("글쓴이를 입력하세요");
			document.f.name.focus();
			return;
		}
		if (document.f.pass.value == '') {
			alert("비밀번호를 입력하세요");
			document.f.pass.focus();
			return;
		}
		if (document.f.subject.value == '') {
			alert("제목을 입력하세요");
			document.f.subject.focus();
			return;
		}
		if (document.f.content.value == '') {
			alert("내용을 입력하세요");
			document.f.content.focus();
			return;
		}
		document.f.submit();
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
     for(i=this_year-100;i<this_year+1;i++){//현재 년도에서 과거로 100년까지 미래로 0년까지를 표시함
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
     for(i=this_year-100;i<this_year+1;i++){//현재 년도에서 과거로 100년까지 미래로 0년까지를 표시함
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
	<form action="write2.bo" method="post" enctype="multipart/form-data"
		name="f" style="margin-left: 30px">
		<input type="hidden" name="type" value="2">
				<table class="table14_10" style="width: 100%">
			<caption>
				<h1>
					<b>동행 게시판 글쓰기</b>
				</h1>
			</caption>
			<tr>
				<td align="center" style="width:20%;">글쓴이</td>
				<td style="text-align:center; width :50px; "><input style="width: 100px;" type="text" name="name" value="${login}" readonly></td>
				<td align="center">여행국가</td>
				<td><input type="text" name="country" value="대한민국"></td>
				<td align="center">여행지역</td>
				<td><input type="text" name="loc" value="서울"></td>
			</tr>
			<tr>
				<td align="center">비밀번호</td>
				<c:if test="${login!= 'admin'}" >
				<td style="text-align: left;"><input style="width: 100px;" type="password" name="pass"></td>				
				</c:if>
				<c:if test="${login== 'admin'}" >
				<td style="text-align: left;"><input style="width: 100px;" type="password" name="pass" value="${pass}"></td>
				</c:if>
				<td align="center">출발날짜</td>
				<td><script> sdate('null','null','null'); </script></td>
				<td align="center">도착날짜</td>
				<td><script> edate('null','null','null'); </script></td>
			</tr>
			<tr>
				<td align="center">제목</td>
				<td colspan="3" style="text-align: left;"><input style="width: 400px;" type="text" name="subject"
					style="width: 94%;"></td>
				<td align="center">최대인원</td>
				<td><select name="maxpno">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4" selected="selected">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
				</select></td>
			</tr>
			<tr>
				<td align="center">내용</td>
				<td colspan="5"><textarea rows="15" cols="85" name="content"></textarea></td>
			</tr>
			<tr>
				<td align="center">첨부파일</td>
				<td colspan="5" style="text-align: left;"><input type="file" name="file1"></td>
			</tr>
			<tr>
				<td colspan="6" align="center">
					<button type="button"
						onclick="location.href='javascript:board_submit()' "
						class="myButton1">게시물등록</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>