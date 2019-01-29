<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="EUC-KR">
<title>������ ��õ&���� �Խ��� �۾���</title>
<script type="text/javascript">
	function board_submit() {
		if (document.f.name.value == '') {
			alert("�۾��̸� �Է��ϼ���");
			document.f.name.focus();
			return;
		}
		if (document.f.pass.value == '') {
			alert("��й�ȣ�� �Է��ϼ���");
			document.f.pass.focus();
			return;
		}
		if (document.f.subject.value == '') {
			alert("������ �Է��ϼ���");
			document.f.subject.focus();
			return;
		}
		if (document.f.content.value == '') {
			alert("������ �Է��ϼ���");
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
//�Ʒ��� ������ ���ϴ� ��
  if (this_month==2) { 
      if ((this_year/4)!=parseInt(this_year/4)) maxdays=28;  
      else maxdays=29; 
  } 
 
 document.writeln("<select name='syear' size=1 onChange='dateSelect(this.form,this.form.month.selectedIndex);'>");
     for(i=this_year-100;i<this_year+1;i++){//���� �⵵���� ���ŷ� 100����� �̷��� 0������� ǥ����
         if(i==this_year) document.writeln("<OPTION VALUE="+i+ " selected >" +i); 
         else document.writeln("<OPTION VALUE="+i+ ">" +i); 
     }    
 document.writeln("</select>��");      

 
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
 document.writeln("</select>��");
 
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
 document.writeln("</select>��"); 
   
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
//�Ʒ��� ������ ���ϴ� ��
  if (this_month==2) { 
      if ((this_year/4)!=parseInt(this_year/4)) maxdays=28; 
      else maxdays=29; 
  } 
 
 document.writeln("<select name='eyear' size=1 onChange='dateSelect(this.form,this.form.month.selectedIndex);'>");
     for(i=this_year-100;i<this_year+1;i++){//���� �⵵���� ���ŷ� 100����� �̷��� 0������� ǥ����
         if(i==this_year) document.writeln("<OPTION VALUE="+i+ " selected >" +i); 
         else document.writeln("<OPTION VALUE="+i+ ">" +i); 
     }    
 document.writeln("</select>��");      

 
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
 document.writeln("</select>��");
 
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
 document.writeln("</select>��"); 
   
}
</script>
</head>
<body>
	<form action="write.bo" method="post" enctype="multipart/form-data"
		name="f" style="margin-left: 30px">
		<input type="hidden" name="type" value="1">
				<table class="table14_10" style="width: 100%">
			<caption>
				<h1>
					<b>������ ��õ & ���� �Խ��� �۾���</b>
				</h1>
			</caption>
			<tr>
				<td align="center">�۾���</td>
				<td style="text-align: left;"><input type="text" name="name" value="${login}" readonly>
				<input type="hidden" name="type" value="1"></td>
				<td align="center">���౹��</td>
				<td><input type="text" name="country" value="���ѹα�"></td>
				<td align="center" >��������</td>
				<td><input type="text" name="loc" value="����"></td>
			</tr>
			<tr>
				<td align="center">��й�ȣ</td>
				<c:if test="${login!= 'admin'}" >
				<td style="text-align: left;"><input type="password" name="pass" required="required"></td>				
				</c:if>
				<c:if test="${login== 'admin'}" >
				<td style="text-align: left;"><input type="password" name="pass" value="${pass}"></td>
				</c:if>
				<td align="center">��߳�¥</td>
				<td><script> sdate('null','null','null'); </script></td>
				<td align="center">������¥</td>
				<td><script> edate('null','null','null'); </script></td>
			</tr>
			<tr>
				<td align="center">����</td>
				<td colspan="5" style="text-align: left;"><input required="required" type="text" name="subject" style="width: 50%; "></td>
			</tr>
			<tr>
				<td align="center">����</td>
				<td colspan="5"><textarea required="required" rows="15" cols="100" name="content"></textarea></td>
			</tr>
			<tr>
				<td align="center">÷������</td>
				<td colspan="5" style="text-align: left;"><input type="file" name="file1"></td>
			</tr>
			<tr>
				<td colspan="6" align="center">
					<button type="button"
						onclick="location.href='javascript:board_submit()' "
						class="myButton1">�Խù����</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>