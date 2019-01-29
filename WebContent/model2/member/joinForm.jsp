<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%-- jspStudy2/WebContent/model2/member/joinForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ���� ȭ��</title>
<style rel="stylesheet">
body {
	font: 13px/20px 'Helvetica Neue', Helvetica, Arial, sans-serif;
	color: #333333;
	background: ghostwhite;
}

.signUp {
	position: relative;
	margin: 50px auto;
	width: 300px;
	padding: 33px 25px 29px;
	background: #FFFFFF;
	border-bottom: 1px solid #C4C4C4;
	border-radius: 5px;
	-webkit-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
	box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
}

.signUpTitle {
	margin: -25px -25px 25px;
	padding: 15px 25px;
	line-height: 35px;
	font-size: 26px;
	font-weight: 300;
	color: white;
	text-align: left;
	text-shadow: 0 1px rgba(255, 255, 255, 0.75);
	background: skyblue;
}

input {
	font-family: inherit;
	color: inherit;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.signUpInput {
	width: 100%;
	height: 50px;
	margin-bottom: 25px;
	padding: 0 15px 2px;
	font-size: 17px;
	background: white;
	border: 2px solid #EBEBEB;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 -2px #EBEBEB;
	box-shadow: inset 0 -2px #EBEBEB;
}

.signUpText {
	font-size: 17px;
	background: white;
	color: grey;
}

.signUpdiv {
	width: 88%;
	height: 30px;
	margin-bottom: 21px;
	padding: 0 15px 2px;
	font-size: 17px;
	background: white;
	border: 2px solid #EBEBEB;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 -2px #EBEBEB;
	box-shadow: inset 0 -2px #EBEBEB;
	padding-top: 4%;
}

.signUpButton {
	position: relative;
	vertical-align: top;
	width: 49%;
	height: 54px;
	padding: 0;
	font-size: 22px;
	color: white;
	text-align: center;
	text-shadow: 0 1px 2px rgba(0, 0, 0, 0.25);
	background: skyblue;
	border: 0;
	border-bottom: 2px solid #D76B60;
	border-radius: 5px;
	cursor: pointer;
	-webkit-box-shadow: inset 0 -2px #D76B60;
	box-shadow: inset 0 -2px #D76B60;
}
.backButton {
	position: relative;
	font-size: 30px;
	color : white;
	text-align: center;
	background-color: skyblue;
	border: px solid grey;
	border-radius: 5px;
	cursor: pointer;
	margin-right: 18%
}
</style>
<script type="text/javascript">
	function joincheck(f) {
		if (f.id.value == '') {
			alert('���̵� �Է��ϼ���');
			f.id.focus();
			return false;
		}
		if (f.pass.value == '') {
			alert('��й�ȣ�� �Է��ϼ���');
			f.pass.focus();
			return false;
		}
		if (f.name.value == '') {
			alert('�̸��� �Է��ϼ���');
			f.name.focus();
			return false;
		}
	}
	function win_open() {
		var op = "width=500, height=150, left=50, top=150";
		open("memberimgForm.jsp", "", op);
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
function Today(year,mon,day){
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
 
 document.writeln("<select name='year' size=1 onChange='dateSelect(this.form,this.form.month.selectedIndex);'>");
     for(i=this_year-100;i<this_year+1;i++){//���� �⵵���� ���ŷ� 100����� �̷��� 0������� ǥ����
         if(i==this_year) document.writeln("<OPTION VALUE="+i+ " selected >" +i); 
         else document.writeln("<OPTION VALUE="+i+ ">" +i); 
     }    
 document.writeln("</select>��");      

 
 document.writeln("<select name='month' size=1 onChange='dateSelect(this.form,this.selectedIndex);'>");
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
 
 document.writeln("<select name='day' size=1>");
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
	<form action="join.me" name="f" method="post"
		onsubmit="return joincheck(this)" class="signUp">
		<input type="hidden" name="picture" value="">
		<h1 class="signUpTitle"><input type="button" onclick="location.href='javascript:history.go(-1)' " value="��" class="backButton">ȸ�� ����</h1>
		<table class="signUpInput">
			<tr>
				<td><img src="" width="150" height="175" id="pic" style="margin-left:20%; margin-top:3%;"> <br>
					<font size="4"><a href="javascript:win_open()" style="margin-left:34%">�������</a></font></td>
			</tr>
		</table>
		<input type="text" class="signUpInput" placeholder="���̵�" autofocus
			required name="id"> <input type="password" name="pass"
			class="signUpInput" placeholder="��й�ȣ" required>
			
<input type="text" name="name" class="signUpInput" placeholder="�̸�" required>

<div class="signUpdiv"><text class="signUpText">����</text> &nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" name="gender" value="1" checked>&nbsp;&nbsp;��&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" name="gender" value="2">&nbsp;&nbsp;��<br><br></div>
<div class="signUpdiv"><text class="signUpText">����&nbsp;&nbsp;&nbsp; </text><script> Today('null','null','null'); </script></div>
<input type="text" name="tel" class="signUpInput" placeholder="��ȭ��ȣ" required>
<input type="text" name="email" class="signUpInput" placeholder="�̸���" required>
<input type="text" name="address" class="signUpInput" placeholder="������" required>
<input type="text" name="remember" class="signUpInput" placeholder="��￡ ���� ������" required>
<input type="submit" value="ȸ������" class="signUpButton"> 
<input type="reset" value="�ٽ��ۼ�" class="signUpButton">
	</form>
</body>
</html>