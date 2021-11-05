<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
    %>
<%
	request.setCharacterEncoding("utf-8");
%>    
<jsp:useBean id="m" class="sec01.ex02.MemberBean"  />
<jsp:setProperty property="*" name="m"/>
<jsp:useBean id="addr" class="sec01.ex02.Address" />
<jsp:getProperty name="addr" property="city" value="서울" />
<jsp:getProperty name="addr" property="zipcode" value="07654" />
<%
	m.setAddr(addr);
%>

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
			<td>도시</td>
			<td>우편번호</td>
		</tr>
		<tr>
			<td>${m.id}</td>
			<td>${m.pwd}</td>
			<td>${m.name}</td>
			<td>${m.email}</td>
			<td>${m.addr.city}</td>
			<td>${m.addr.zipcode}</td>
		</tr>
		
	</table>
</body>
</html>