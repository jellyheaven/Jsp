<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="sec01.ex01.* , java.util.*"
    isELIgnored="false"
    %>
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="m"  class="sec01.ex01.MemberBean" scope="page" />
<jsp:setProperty name="m" property="*"  />
<jsp:useBean id="memberlist" class="java.util.ArrayList" scope="page"/>     
<jsp:useBean id="memberMap" class="java.util.HashMap" scope="page"/>

<%
	memberMap.put("id", "park2");
	memberMap.put("pwd", "4321");
	memberMap.put("name", "박지성");
	memberMap.put("email", "park2@test.com");
	
	MemberBean m2 = new MemberBean("son", "1234", "손흥민", "son@test.com");
	memberlist.add(m);
	memberlist.add(m2);
	
	memberMap.put("memberlist", memberlist);
	
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HashMap 사용 실습</title>
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
			<td>${memberMap.memberlist[0].id}</td>
			<td>${memberMap.memberlist[0].pwd}</td>
			<td>${memberMap.memberlist[0].name}</td>
			<td>${memberMap.memberlist[0].email}</td>
		</tr>
		<tr>
			<td>${memberMap.memberlist[1].id}</td>
			<td>${memberMap.memberlist[1].pwd}</td>
			<td>${memberMap.memberlist[1].name}</td>
			<td>${memberMap.memberlist[1].email}</td>
		</tr>
		
	</table>
</body>
</html>