<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<c:if test="${id ne null}">
	<h2>해당 아이디는 ${id} 입니다.</h2>
</c:if>
<c:if test="${id eq null && pw eq null}">
	<h2>해당 아이디가 없습니다.</h2>
</c:if>
<%
	String id = request.getParameter("id");
%>
<c:if test="${pw ne null}">
	<h2>해당 <%=id %>의 비밀번호는 ${pw} 입니다.</h2>
</c:if>
</body>
</html>