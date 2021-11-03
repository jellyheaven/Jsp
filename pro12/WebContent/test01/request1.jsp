<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("name", "이순신");
	request.setAttribute("address", "서울시 강남구");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	페이지 이동
	<%
		//request 서버에서 포워딩 
		RequestDispatcher dispatcher = request.getRequestDispatcher("request2.jsp");
	
		dispatcher.forward(request, response);
	%>
</body>
</html>