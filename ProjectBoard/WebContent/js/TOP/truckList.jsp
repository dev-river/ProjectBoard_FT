
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>여기는 다르게 수정했지롱</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/searcharound.css">
<link rel="stylesheet" type="text/css" href="css/MainStyle.css">
</head>
<body class="b915 bCenter" style = "background-image: url(img/MainBG.jpg);">

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
							<div id="searcharoundcode">
							
								<!--작성코드 -->

									<div class="container">
										<h1>카테고리별 검색결과</h1>
										<div style="width: 680px; height: 100%; margin: 5px;">
											<div class="row">
												<div class="col-xs-12"
													style="background-color: white; height: 15px"></div>
											</div>
											<c:forEach items="${tctlist}" var="t">
												<div class="row">
													<div class="col-xs-3 col-xs-offset-1"
														style="height: 180px; border: 1px solid gray; float: left">														
															<a class="truckclick" href="${t.tNum}">
															<img src="./img/truckimg/${t.tName}.png"
															alt="${t.tName} 가게이미지" style="padding-top: 15px;">
														</a>
													</div>
													<div class="col-xs-7" style="height: 180px; float: left">
														<div class="row">
															<div class="col-xs-6"
																style="height: 90px; border: 1px solid gray; float: left">
																<h5>
																	<br>상호명<br><br>
																</h5>
																<a class="truckclick" href="${t.tNum}">
																	<h4 style="font-size:1.5em;">
																		<strong>${t.tName}</strong>
																	</h4></a>
															</div>
															<div class="col-xs-3"
																style="height: 90px; border: 1px solid gray; float: left">
																<h5>
																	<br>카테고리<br><br>
																</h5>
																<h4 style="font-size:1.5em;">
																	<strong>${t.foodCategory}</strong>
																</h4>
															</div>
															<div class="col-xs-3"
																style="height: 90px; border: 1px solid gray; float: left">
																<h5>
																	<br>영업중<br><br>
																</h5>
																<h4 style="font-size:1.5em;">
																	<strong>${t.tOpen}</strong>
																</h4>
															</div>
															<div class="col-xs-12"
																style="height: 90px; border: 1px solid gray; float: left">
																<h5>
																	<br>현재주소<br><br>
																</h5>
																<h4 style="font-size:1.5em;">
																	<strong>${t.tAddress}</strong>
																</h4>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-xs-12"
														style="background-color: white; height: 15px"></div>
												</div>
											</c:forEach>
										</div>
									</div>
								<!-- 작성 부분 -->								
							</div>
						</div>
					</div>
				</div>
				<jsp:include page="../RIGHT/MMRight.jsp" />
			</div>
			</div>
		</div>
	
		<jsp:include page="../MainLayout/MTail.jsp"/>
	</div>
	</div>
<script type="text/javascript">

	/*	
	08-13 : 이미지 혹은 제목 클릭 시 팝업으로 처리하기
	
		기존의 a태그에 클래스값 (여기선 truckclick)
		ex : <a class="truckclick" href="${t.tNum}"> href에 넘길 데이터에 대한 el값 작성
		event.preventDefault로 기존의 href가 작동하지 않게 처리
		var를 이용해 data값에 작성
		window.open으로 팝업 띄움
	*/
	$(document).ready(function() {
		$(".container").on("click", ".truckclick", function(event) {
			event.preventDefault();
			var data=$(this).attr("href");
			/* alert(data); */
			window.open("truckForm.do?tNum="+data, "", "width=700px height=700px");
		});
	});
</script>
</body>
</html>