<%@ page language="java"
		 contentType="text/html; charset=UTF-8"
    	 pageEncoding="UTF-8"
		 import="java.util.*"
		 session = "true"
		 autoFlush="true"
		 isThreadSafe="true"
		 info = "(ShoppingMall....)"
		 isErrorPage="false"    	 
    	 errorPage=""
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 디렉티브 연습</title>
</head>
<body>
	<h1> 디렉티브 태그 선언!!</h1>
	info : 페이지 설명을 지정 <br>
	language : 페이지에서 사용할 언어 <br>
	contentType : 출력 형식 <br>
	import : 자바 패키지 클래스 임포트 <br>
	session : HttpSession 객체 사용여부 <br>
	buffer : 사용할 버퍼 크기 지정 <br>
	autoFlush : 내용이 출력되기전 버퍼가 다 채워질 경우 동작 지정 <br>
	errorPage : 처리도중 예외 발생할 경우 예외처리 담당 JSP 페이지 지정 <br>
	isErrorPage : 현재  페이지가 예외 처리 담당 JSP 여부 <br>
	pageEncoding : 문자열 인코딩 <br>
	isELIgnored : EL 사용유무 지정 <br>
</body>
</html>