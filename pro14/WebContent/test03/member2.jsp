<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="sec01.ex01.*"
    isELIgnored="false"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="memberlist" class="java.util.ArrayList"/>
<jsp:useBean id="memberMap" class="java.util.HashMap"/>

<%
	memberMap.put("id", "park2");
	memberMap.put("pwd", "4321");
	memberMap.put("name","박지성");
	memberMap.put("email","park2@test.com");
	
	MemberBean m1= new MemberBean("son","1234","손흥민","son@test.com");
	MemberBean m2= new MemberBean("ki","4321","기성용","ki@test.com");
	
	memberlist.add(m1);
	memberlist.add(m2);
	
	memberMap.put("memberslist",memberlist);
%>

<c:set var="membersList" value="${memberMap.memberslist}" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>c:set 테스트 2</title>
</head>
<body>
	<table style="width: 100%">
		<tr align="center" bgcolor="#99ccff">
			<td>아이디</td>	
			<td>비밀번호</td>	
			<td>이름</td>	
			<td>이메일</td>
			
		</tr>
		<tr>
			<td>${memberMap.id}</td>
			<td>${memberMap.pwd}</td>
			<td>${memberMap.name}</td>
			<td>${memberMap.email}</td>
		</tr>
		<tr>
			<td>${membersList[0].id}</td>
			<td>${membersList[0].pwd}</td>
			<td>${membersList[0].name}</td>
			<td>${membersList[0].email}</td>
		</tr>
		<tr>
			<td>${membersList[1].id}</td>
			<td>${membersList[1].pwd}</td>
			<td>${membersList[1].name}</td>
			<td>${membersList[1].email}</td>
		</tr>
	</table>
</body>
</html>