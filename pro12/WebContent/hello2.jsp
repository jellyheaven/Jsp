<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	//선언문
	String name= "이순신";

	public String getName(){
		return name;
	}
%>    

<%
	//스크립트릿 이용
	String age = request.getParameter("age");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트릿 연습</title>
</head>
<body>
	<h1>나이 <%=age %> </h1>
</body>
</html>