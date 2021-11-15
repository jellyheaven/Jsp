<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("utf-8");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#checkJson").click(function(){
		$.ajax({
			type:"post",
			async:false,
			url:"${contextPath}/json3",
			success : function(data, status){
				var jsonInfo = JSON.parse(data);
				
				var memberInfo = "회원정보 <br>";
				memberInfo += "==========<br>";
				
				for ( var i in jsonInfo.members) {
					memberInfo += "이름: "+jsonInfo.members[i].name +"<br>";
					memberInfo += "나이: "+jsonInfo.members[i].age +"<br>";
					memberInfo += "성별: "+jsonInfo.members[i].gender +"<br>";
					memberInfo += "별명: "+jsonInfo.members[i].nickname +"<br>";
				}
				
				var booksInfo = "도서정보 <br>";
				booksInfo += "==========<br>";
				
				for ( var i in jsonInfo.members) {
					booksInfo += "제목: "+jsonInfo.books[i].title +"<br>";
					booksInfo += "나이: "+jsonInfo.books[i].writer +"<br>";
					booksInfo += "성별: "+jsonInfo.books[i].price +"<br>";
					booksInfo += "별명: "+jsonInfo.books[i].genre +"<br>";
					imageURL = jsonInfo.books[i].image;
					booksInfo += "<img src='"+imageURL+"' > <br><br>";
				}
				
				
				$("#output").html(jsonInfo+"<br>"+booksInfo);
				
			},
			error: function(data, status){
				alert('에러가 발생했습니다.');
			},
			complete:function(data, status){}
		}); //end ajax
	});
});
</script>
</head>
<body>
	<a id="checkJson" style="cursor:pointer">전송</a><br><br>
	<div id="output"></div>
</body>
</html>