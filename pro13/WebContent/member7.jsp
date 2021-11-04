<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="sec01.ex01.*,java.util.*"
    %>
<%
	//jsp:getProperty 사용 예 7  파마미터를 그대로 값을 넘길때
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="m" class="sec01.ex01.MemberBean" scope="page"></jsp:useBean>
<jsp:setProperty name="m" property="*"  /> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table style="width: 100%">
		<tr align="center" bgcolor="#99ccff">
			<td>아이디</td>	
			<td>비밀번호</td>	
			<td>이름</td>	
			<td>이메일</td>
		</tr>
		<tr align="center" bgcolor="#99ccff">
			<td>
				<jsp:getProperty  name="m" property="id" />
			</td>	
			<td>
				<jsp:getProperty  name="m" property="pwd" />
			</td>	
			<td>
				<jsp:getProperty  name="m" property="name" />
			</td>	
			<td>
				<jsp:getProperty  name="m" property="id" />
			</td>	
			<td>
				<jsp:getProperty  name="m" property="email" />
			</td>	
		</tr>
	</table>
</body>
</html>