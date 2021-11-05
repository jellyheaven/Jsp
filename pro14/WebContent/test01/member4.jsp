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
<jsp:useBean id="memberlist" class="java.util.ArrayList" scope="page"></jsp:useBean>     

<%
	MemberBean m2 = new MemberBean("son", "1234", "손흥민", "son@test.com");
	memberlist.add(m);
	memberlist.add(m2);
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Collection 객체 사용</title>
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
			<td>${memberlist[0].id}</td>
			<td>${memberlist[0].pwd}</td>
			<td>${memberlist[0].name}</td>
			<td>${memberlist[0].email}</td>
		</tr>
		<tr>
			<td>${memberlist[1].id}</td>
			<td>${memberlist[1].pwd}</td>
			<td>${memberlist[1].name}</td>
			<td>${memberlist[1].email}</td>
		</tr>
		
	</table>
</body>
</html>