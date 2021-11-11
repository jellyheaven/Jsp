<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>    
<c:set var="dan" value="${param.dan}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" width="800">
		<tr>
			<td align="center" colspan="2">
				<c:out value="${ dan }" />단 출력
			</td> 
		</tr>
		<c:forEach var="i"  begin="1" end="9" step="1"> 
			<tr align="left" >
				<td width="400">
			  		<c:out value="${ dan }" /> * <c:out value="${ i }" />
				</td>
				<td width="400">
					<c:out value="${ dan*i }" />
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>