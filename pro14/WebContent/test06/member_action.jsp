<%@page import="sec02.ex01.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*"
    pageEncoding="UTF-8"
    isELIgnored="false"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="m" class="sec02.ex01.MemberBean"></jsp:useBean>
<jsp:setProperty name="m" property="*" />
<%
	MemberDAO dao = new MemberDAO();

	dao.addMember(m);
	
	List membersList = dao.listMembers();
	
	request.setAttribute("membersList", membersList);
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:forward page="membersList.jsp" />
</body>
</html>