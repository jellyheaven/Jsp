<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
    %>
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="m"  class="sec01.ex01.MemberBean" scope="page" />
<jsp:setProperty name="m" property="*"  />    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유즈빈즈 사용하여 표현언어 처리</title>
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
			<td>${m.id}</td>
			<td>${m.pwd}</td>
			<td>${m.name}</td>
			<td>${m.email}</td>
		</tr>
	</table>
</body>
</html>