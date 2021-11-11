<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.util.*"
    pageEncoding="UTF-8"
    isELIgnored="false"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	List dataList = new ArrayList();
	dataList.add("hello");
	dataList.add("world");
	dataList.add("안녕하세요!!");	
%>    
<c:set var="dt_list" value="<%=dataList %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반복문 리스트 </title>
</head>
<body>
	<c:forEach var = "i" begin="1" end="10" step="1" varStatus="loop">
		i = ${i} &nbsp;&nbsp; 반복횟수 ${loop.count} <br>
	</c:forEach>

	<c:forEach var = "i" begin="1" end="10" step="2" >
		5 * ${i} = ${5*i} <br>
	</c:forEach>

	<c:forEach var="data" items="${dt_list}">
		${data}<br>
	</c:forEach>
	
	<c:set var ="fiuits" value="사과,파인애플,바나나, 망고, 큘"></c:set>
	<c:forTokens var="token" items="${fiuits}" delims=",">
		${token}<br>
	</c:forTokens>
</body>
</html>