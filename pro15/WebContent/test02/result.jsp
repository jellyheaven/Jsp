<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var ="contextPath" value="${pageContext.request.contextPath }"></c:set>    
<c:set var ="file1" value="${param.param1}" />
<c:set var ="file2" value="${param.param2}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 파일 출력하기</title>
</head>
<body>
 	매개변수 1 : <c:out value="${file1}" /><br>
 	매개변수 2 : <c:out value="${file2}" /><br>
 	<c:if test="${not empty file1}">
 		<img alt="드림1" src="${contextPath}/download.do?fileName=${file1}" width="300" height="300" >
 	</c:if>
 	<br>
 	<c:if test="${not empty file2}">
 		<img alt="드림2" src="${contextPath}/download.do?fileName=${file2}" width="300" height="300" >
 	</c:if>
 	<br>
 	파일내려받기 :
 	<a href="${contextPath}/download.do?fileName=${file2}" alt="드림2">파일 내려받기</a>
</body>
</html>