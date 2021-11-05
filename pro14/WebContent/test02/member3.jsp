<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table style="width: 100%">
		<tr align="center" bgcolor="#99ccff">
			<td>아이디</td>	
			<td>비밀번호</td>	
			<td>이름</td>	
			<td>이메일</td>
		</tr>
		<tr>
			<td>${memberlist[0].id}</td>
			<td>${memberlist[0].pwd}</td>
			<td>${memberlist[0].name}</td>
			<td>${memberlist[0].email}</td>
		</tr>
		<tr>
			<td>${memberlist[1].id}</td>
			<td>${memberlist[1].pwd}</td>
			<td>${memberlist[1].name}</td>
			<td>${memberlist[1].email}</td>
		</tr>
	</table>
</body>
</html>