<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model2/member/memberimg.jsp --%>
<script>
	img = opener.document.getElementById("pic");
	img.src = "img/${filename}";
	opener.document.f.picture.value='${filename}';
	self.close();
</script>