<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여러가지 비교 연산자</title>
</head>
<body>
	<h1>여러가지 비교 연산자</h1>
	<h1>
		${10==10}<br>
		${20 eq 10}<br>
		${"hello" == "hello"}<br>
		${"hello" eq "hello"}<br>
		${20 != 10}<br>
		${"hello" != "apple"}<br>
		
		${10 < 10 }<br>
		${10 lt 10 }<br>
		${10 > 10 }<br>
		${10 gt 10 }<br>
		${10 <= 10 }<br>
		${10 le 10 }<br>
		${10 >= 10 }<br>
		${10 ge 10 }<br>
	</h1>
</body>
</html>