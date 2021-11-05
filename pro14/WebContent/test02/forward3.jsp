<%@ page language="java" contentType="text/html; charset=UTF-8"
    import ="sec01.ex01.*, java.util.*"
    pageEncoding="UTF-8"
    %>
<%
	request.setCharacterEncoding("utf-8");
	
	List memberlist = new ArrayList();
	MemberBean member1 = new MemberBean("lee","1234","이순신","lee@test.com");
	MemberBean member2 = new MemberBean("son","1234","손흥민","son@test.com");
	memberlist.add(member1);
	memberlist.add(member2);
	request.setAttribute("memberlist", memberlist);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:forward page="member3.jsp"></jsp:forward>
</body>
</html>