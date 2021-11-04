<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="sec01.ex01.*,java.util.*"
    %>
<%
	//setProerty 사용 예 4 매체변수와 동일시 자동 설정
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="m" class="sec01.ex01.MemberBean" scope="page"></jsp:useBean>

<jsp:setProperty name="m" property="*"  /> 
<%
	//3.DAO를 통해 DB 에 회원정보 추가
	MemberDAO dao = new MemberDAO();
	dao.addMember(m);
	//4.현재 회원 리스트 보여주기
	List memberlist = dao.listMembers();
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
			<td>가입일</td>	
		</tr>
		<%
			final int SIZE = memberlist.size();
			if(SIZE == 0){
		%>
			<tr align="center">
				<td>
					<b><span style="font-size: 9pt;">등록된 회원이 없습니다.</span></b>
				</td>	
			</tr>
		<%		
			}else{
				for(int i = 0; i < SIZE ; i++ ){
					MemberBean bean = (MemberBean)memberlist.get(i);
		%>
			<tr align="center">
				<td><%=bean.getId() %></td>
				<td><%=bean.getPwd() %></td>
				<td><%=bean.getName() %></td>
				<td><%=bean.getEmail() %></td>
				<td><%=bean.getJoinDate() %></td>
			</tr>
		<%
				}//end for
			} //end if
		%>
	</table>
</body>
</html>