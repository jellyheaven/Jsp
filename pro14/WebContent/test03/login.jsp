<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" scope="page" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>contextPath</title>
</head>
<body>
	<form action="result.jsp" method="post">
		아이디: <input type="text" name ="user_id" > <br>
		비밀번호:<input type="password" name ="user_pwd" ><br>
		<input type="submit" value="로그인"> 
		<input type="reset" value="다시입력">
	</form>
	<br>
	<a href="${contextPath}/test03/memberForm.jsp">회원가입</a>
</body>
</html>