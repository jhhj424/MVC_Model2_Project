<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%--
	�Խù� ������ ���� ��й�ȣ �Է� ȭ��
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��2 �Խ��� ���� ȭ��</title>
</head>
<body>
	<%--
	1. num�� pass �Ķ���� 2�� ���� ����.
	2. �Էµ� ��й�ȣ�� db�� ����� ��й�ȣ ���ϱ�
		- �´� ��� : �Խù� ����. BoardDao.delete(num);
			���� ���� : �������� �޼��� ���. list.bo�� ������ �̵�
			���� ���� : �������� �޼��� ���. info.bo�� ������ �̵�
		- Ʋ����� : ��й�ȣ ���� �޼��� ���. deleteForm.bo�� ������ �̵�
 --%>
	<form action="delete.bo" method="post" name="f"
		style="margin-top: 70px">
		<input type="hidden" name="num" value="${param.num }"> <input
			type="hidden" name="type" value="${param.type }">
		<div class="w3-container">
			<div class="w3-ul w3-card-4">
				<table class="table14_11" style="width: 100%">
					<caption>
						<h2>�Խù� ����</h2>
					</caption>
					<tr>
						<td>
							<h2>
								<b>�Խñ� ��й�ȣ</b>
							</h2>
						</td>
						<td><input type="password" name="pass"></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="�Խñۻ���" class="myButton1"></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</body>
</html>