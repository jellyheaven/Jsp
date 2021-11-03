<%@ page language="java" contentType="text/html; charset=UTF-8"
	import ="sec02.ex01.*"
	import ="java.util.*"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String _name = request.getParameter("name");
	
	MemberVO memberVO = new MemberVO();
	
	memberVO.setName(_name);
	
	MemberDAO memberDAO = new MemberDAO();
	List member_list = memberDAO.listMembers(memberVO);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 출력창</title>
</head>
<body>
	<table border="1" width="800" align = "center">
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>이메일</td>
			<td>가입일자</td>
		</tr>
		<%
			//여기 반복문 돌릴거고
			final int SIZE = member_list.size();
			for(int i=0; i < SIZE ; i++){
				MemberVO vo = (MemberVO)member_list.get(i);
				String id = vo.getId();
				String pwd = vo.getPwd();
				String name = vo.getName();
				String email = vo.getEmail();
				Date joinDate = vo.getJoinDate();
		%>
			<tr>
				<td align="center">
					<%=id %>
				</td> 
				<td align="center">
					<%=pwd %>
				</td> 
				<td align="center">
					<%=name %>
				</td> 
				<td align="center">
					<%=email %>
				</td> 
				<td align="center">
					<%=joinDate %>
				</td>
			</tr>
			 
		<%  } %>
	</table>
</body>
</html>