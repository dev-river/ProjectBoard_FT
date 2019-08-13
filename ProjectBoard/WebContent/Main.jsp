<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/MainStyle.css?after" type="text/css">
</head>
<body class="b915 bCenter" style = "background-image: url(img/MainBG.jpg);">
	<div id="MainLayout"> 
		<div id="MainBody">
			<jsp:include page="js/MainLayout/MHead.jsp"/>		
			<jsp:include page="js/MainLayout/MMiddle.jsp"/>		
			<jsp:include page="js/MainLayout/MTail.jsp"/>	
		</div>
	</div>	
</body>
</html>