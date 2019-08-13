<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 선택</title>
</head>
<body>
<div>
	<h3>회원 선택</h3>
	<ul>
		<li>
			<button onclick="location.href='join.jsp?num=1'">일반 회원</button>
		</li>
		<li>
			<button onclick="location.href='join.jsp?num=2'">판매 회원</button>
		</li>
	</ul>
</div>
</body>
</html>