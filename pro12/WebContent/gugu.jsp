<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	int dan = Integer.valueOf(request.getParameter("dan"));
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" width="800">
		<tr>
			<td align="center" colspan="2"><%=dan %> 단 출력</td> 
		</tr>
		<%
			for(int i = 1; i<10 ; i++){
				
		%>
			<tr align="left" >
				<td width="400">
					<%=dan%> * <%=i %>  
				</td>
				<td width="400">
					<%=i*dan %>
				</td>
			</tr>
		<% } %>
	</table>
</body>
</html>