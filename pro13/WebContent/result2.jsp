<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	String msg = "아이디를 입력하지 않았습니다.아이디를 입력해 주세요.";
%>    
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
		<jsp:forward page="login2.jsp">
			<jsp:param value="<%=msg %>" name="msg"/>
		</jsp:forward>
<%		
	}
%>	
	<h1>환영합니다. <%=user_id %></h1>  
</body>
</html>