<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	안녕하세요. 쇼핑몰 중심 JSP 시작입니다.
	<jsp:include page="duke_image.jsp">
		<jsp:param name="name" value="듀크" />
		<jsp:param name="img" value="duke.png" />
	</jsp:include>
</body>
</html>