<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_id = request.getParameter("user_id");	
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	if(user_id == null || user_id.length() == 0){
		/*RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		dispatcher.forward(request, response);*/
%>
		<jsp:forward page="login.jsp"></jsp:forward>
<%		
	}
%>	
	<h1>환영합니다. <%=user_id %></h1>  

</body>
</html>