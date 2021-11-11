<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<c:if test="${empty param.user_id}">
		아이디를 입력하세요. 
		<a href="login.jsp">로그인창</a>
	</c:if>
	<c:if test="${not empty param.user_id}">
		환영합니다.<c:out value="${param.user_id}" />
	</c:if>
</body>
</html>