<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
    import = "java.util.*, sec01.ex01.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");

	List memberList = new ArrayList();
	
	MemberBean m1 = new MemberBean("son","1234","손흥민","son@test.com");
	MemberBean m2 = new MemberBean("ki","4321","기성용","ki@test.com");
	MemberBean m3 = new MemberBean("park","1212","박지성","park@test.com");
		
	memberList.add(m1);
	memberList.add(m2);
	memberList.add(m3);
	
%>    
<c:set var="membersList" value="<%= memberList %>" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반복문 리스트 3</title>
</head>
<body>
	<table style="width: 100%">
		<tr align="center" bgcolor="#99ccff">
			<td>아이디</td>	
			<td>비밀번호</td>	
			<td>이름</td>	
			<td>이메일</td>
		</tr>
		<c:forEach var="member" items="${membersList}">
			<tr>
				<td>${member.id}</td>
				<td>${member.pwd}</td>
				<td>${member.name}</td>
				<td>${member.email}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>