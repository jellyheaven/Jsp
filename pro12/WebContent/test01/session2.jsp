<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = (String)session.getAttribute("name");
	String addr = (String)session.getAttribute("address");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체테스트3</title>
</head>
<body>
	이름은 <%=name %> 입니다. <br>
	주소는 <%=addr %> 입니다. <br>
</body>
</html>