<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("utf-8");
%>  
<c:set var="title1" value="hello world!" />  
<c:set var="title2" value="쇼핑몰 중심 JSP 입니다." />  
<c:set var="str1" value="중심" />  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>여러가지 문자열 함수 기능</h2>
	title1 = "hello world"<br>
	title2 = "쇼핑몰 중심 JSP 입니다.!"<br>
	str1="중심"<br><br>
	
	함수 fn:length(title1) = ${fn:length(title1)}<br>
	함수 fn:toUpperCase(title1) = ${fn:toUpperCase(title1)}<br>
	함수 fn:toLowerCase(title1) = ${fn:toLowerCase(title1)}<br>
	
	함수 fn:substring(title1) = ${fn:substring(title1,3,6)}<br>
	함수 fn:trim(title1) = ${fn:trim(title1)}<br>
</body>
</html>