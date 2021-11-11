<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.*"
    isELIgnored="false"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포매팅 태그 라이브러리 예제</title>
</head>
<body>
	<h2>포매팅 의 넘버 태그 를 이용한 숫자 포매팅 예제</h2>
	<c:set var="price" value="100000" />
	<fmt:formatNumber var="priceNumber" type="number" value="${price}" />
	
	통화로 표현시 : <fmt:formatNumber type="currency" value="${price}" groupingUsed="true" currencySymbol="\\" /><br>
	퍼센트로 표현시 : <fmt:formatNumber type="percent" value="${price}" groupingUsed="false"  /> <br>
	일반숫자로 표현시 ${priceNumber}<br>
	
	<h2>formatDate 예제</h2>
	<c:set var="now" value="<%=new Date() %>" />
	<fmt:formatDate type="date" dateStyle="full" value="${now}" /><br>
	<fmt:formatDate type="date" dateStyle="short" value="${now}" /><br>
	<fmt:formatDate type="time"  value="${now}" /><br>
	<fmt:formatDate type="both" dateStyle="full" timeStyle="full" value="${now}" /><br>
	<fmt:formatDate pattern="YYYY-MM-dd HH:mm:ss" value="${now}" /><br>
	
	<br>
	한국 현재 시간 : <fmt:formatDate type="both" dateStyle="full" timeStyle="full" value="${now}" /><br>
	
	<fmt:timeZone value="America/New York">
		뉴욕 현재 시간: <fmt:formatDate type="both" dateStyle="full" timeStyle="full" value="${now}" />
	</fmt:timeZone>
	
	</body>
</html>