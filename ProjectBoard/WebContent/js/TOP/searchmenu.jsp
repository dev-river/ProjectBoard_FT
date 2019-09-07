<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>이것도 타이틀 수정했지롱</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/searcharound.css">
<link rel="stylesheet" type="text/css" href="css/MainStyle.css">
</head>

<%
	String prefix = "/ProjectBoard";

	List foodCategoryList = new ArrayList();
	foodCategoryList.add("Korea"); // 한식
	foodCategoryList.add("China"); // 중식
	foodCategoryList.add("Japan"); // 일식
	foodCategoryList.add("Boonsik"); // 분식
	foodCategoryList.add("Western"); // 양식
	foodCategoryList.add("Lunchbox"); // 도시락
	foodCategoryList.add("Dessert"); // 디저트
	foodCategoryList.add("ETC"); // 기타

	request.setAttribute("foodCategoryList", foodCategoryList);
%>


<body class="b915 bCenter"
	style="background-image: url(img/MainBG.jpg);">

	<div id="MainLayout">
		<div id="MainBody">

			<jsp:include page="../MainLayout/MHead.jsp" />

			<div id="MainMiddle">
				<div class="middle">
					<div class="middle2">
						<jsp:include page="../LEFT/MMLeft.jsp" />
						<div id="Main">
							<div id="home" class="pcMain">
								<div class="ibuilderModules">
									<div class="container">
										<div style="width: 680px; height: 100%; margin: 5px;">
										<h2 style="background-color: grey; border-radius: 15px; margin: 5px; text-align: center; font-size: 2em; color: white; padding: 5px;">
											메뉴별 트럭찾기</h2>
											<div class="row">
												<c:forEach var="type" items="${foodCategoryList}" begin="0"
													end="${foodCategoryList.size()}" step="1">
													<a href="truckList.do?foodCategory=${type}"
														style="float: left; width: 25%">
														<div id="HP_MouseOverEffect" style="width: 100%; height: 160px; border: 1px solid black; text-align: center;">
														<img alt="${type}" src="./img/menuimg/${type}.png" style="padding-top: 5px"></div>
													</a>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<jsp:include page="../RIGHT/MMRight.jsp" />
					</div>
				</div>
			</div>

			<jsp:include page="../MainLayout/MTail.jsp" />
		</div>
	</div>
	<script type="text/javascript">
	
	/* 마우스 오버시 해당 div img 변경 */
		$(function() { 
		    $("#HP_MouseOverEffect img").hover(function(){ 
		        $(this).attr("src", $(this).attr("src").replace(".png", "_on.png")); 
		    }, function(){ 
		        $(this).attr("src", $(this).attr("src").replace("_on.png", ".png")); 
		    }); 
		});
	</script>
</body>
</html>