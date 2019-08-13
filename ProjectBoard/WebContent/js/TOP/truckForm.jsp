<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div style="width: 680px; height: 100%; margin: 5px;">
				<h2 style="text-align: center; font-size: 2em">트럭 정보</h2>
				<table border="1">
					<c:forEach items="${tNumlist}" var="list">
						<tr>
							<th>가게배너이미지</th>
							<td>
								<img src="${list.tName}.png"
								alt="${list.tName} 가게배너이미지" style="padding-top: 15px;"> <!-- img src="./img/truckbannerimg/${list.tName}.png" 일단 빼둠 -->
							</td>
						</tr>
						<tr>
							<th>가게이미지</th>
							<td>
								<img src="./img/truckimg/${list.tName}.png"
								alt="${list.tName} 가게이미지" style="padding-top: 15px;">
							</td>
						</tr>
						<tr>
							<th>가게등록번호</th>
							<td>${list.tNum}</td>
						</tr>
						<tr>
							<th>가게전화번호</th>
							<td>${list.tPhone}</td>
						</tr>
						<tr>
							<th>가게소개</th>
							<td>${list.tIntro}</td>
						</tr>
						<tr>
							<th>가게정보</th>
							<td>${list.tInfo}</td>
						</tr>
						<tr>
							<th>가게이름</th>
							<td>${list.tName}</td>
						</tr>
						<tr>
							<th>영업상태</th>
							<td>${list.tOpen}</td>
						</tr>
						<tr>
							<th>영업시간</th>
							<td>${list.tTime}</td>
						</tr>
						<tr>
							<th>음식카테고리</th>
							<td>${list.foodCategory}</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>${list.tAddress}</td>
						</tr>
						<tr>
							<th>공지</th>
							<td>${list.tNotice}</td>
						</tr>
						<tr>
							<th>메뉴</th>
							<td>${list.tMenu}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<!-- tNumlist -->
		</div>
	</div>
	</div>
</body>
</html>