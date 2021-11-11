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
		<c:if test="${param.user_id == 'admin'}">
			<h1>관리자 로그인 했습니다.</h1>
			<input type="button" value="회원정보 삭제하기">
			<input type="button" value="회원정보 수정하기">
		</c:if>
		<c:if test="${param.user_id != 'admin'}">
			환영합니다.<c:out value="${param.user_id}" />
		</c:if>
	</c:if>
</body>
</html>