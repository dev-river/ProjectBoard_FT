<%@page import="domain.TruckDTO"%>
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
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1e2d727a78288495ec61df34db40e1ca&libraries=services"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/MainStyle.css" type="text/css">
<link rel="stylesheet" href="css/searcharound.css" type="text/css">


</head>
<body class="b915 bCenter" style="background-image: url(img/MainBG.jpg);">
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
										<h2
											style="background-color: grey; border-radius: 15px; margin: 5px; text-align: center; font-size: 2em;">내
											주변 트럭 찾기</h2>
										<div class="saSearch">
											<div class="option">
												<div class="row">
													<form style="float: right; margin-right: 20px;"
														onsubmit="searchPlaces(); return false;">
														<input class="form-control" placeholder="장소 검색"
															type="text" style="display: inline-block; width: 180px;"
															id="keyword" size="15">
														<button style="margin-bottom: 4px;" class="btn"
															type="submit">검색하기</button>
													</form>
												</div>
											</div>

										</div>

										<div class="">
											<div id="map" class="saMap"
												style="width: 100%; height: 430px;"></div>
										</div>

										<hr>

										<div class="saNum"></div>

										<div class="saList" style="margin-left: 5px;">
											<div class="row">
												<table class="table table-hover">
													<thead>
														<tr>
															<th>이름</th>
															<th>주소</th>
															<th>시간</th>
														</tr>
													</thead>
													<tbody id="trucklist">

													</tbody>
												</table>
											</div>
										</div>




										<!-- <div class="spliteOne">
										<div class="ib_box P01"></div>
									</div> -->
									</div>
								</div>
							</div>
							<div id="Right">
								<div id="RightMenu">
									<div class="RightMenuGroups">
										<div class="menu_item list01">
											<h2 class="item_title">인기게시글!</h2>
											<div class="item_body listbody">
												<ul class="list">
													<li class="row"><a href="#" class="link">자유게시판</a></li>
													<li class="row"><a href="#" class="link">자유게시판</a></li>
													<li class="row"><a href="#" class="link">자유게시판</a></li>
													<li class="row"><a href="#" class="link">자유게시판</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div id="MainTail">
					<div id="copyRights"></div>
				</div>

			</div>
		</div>
	</div>
	<script>
		var markers = [];
		var pl = [];
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 5
		// 지도의 확대 레벨 
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 지도 타입과 줌컨트롤 추가
		var mapTypeControl = new kakao.maps.MapTypeControl();
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		/*--현재 위치 받아오기---------------------------------------------------------------------------*/
		if (navigator.geolocation) {

			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {

				lat = position.coords.latitude, // 위도
				lon = position.coords.longitude; // 경도

				var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다

				// 마커와 인포윈도우를 표시합니다
				displayMarker(locPosition);

			});

		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

			var locPosition = new kakao.maps.LatLng(33.450701, 126.570667);

			displayMarker(locPosition);
		}

		// 지도에 마커와 인포윈도우를 표시하는 함수입니다
		function displayMarker(locPosition) {

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				title : '내 위치',
				map : map,
				position : locPosition
			});
			kakao.maps.event.addListener(marker, 'click', function() {
				alert('현재 내 위치입니다.');
			});

			// 지도 중심좌표를 접속위치로 변경합니다
			map.setCenter(locPosition);
		}
		/*--불러온 가게정보들 마크하기---------------------------------------------------------------------------*/
		var geocoder = new kakao.maps.services.Geocoder();
		<c:forEach items="${list}" var="truck" >
		// 주소로 좌표를 검색합니다
		geocoder
				.addressSearch(
						"${truck.tAddress}",
						function(result, status) {

							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {

								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);

								/*--거리 구하기-------------------------------------------------------------*/
								var startLatLng = new kakao.maps.LatLng(lat,
										lon);
								var endLatLng = new kakao.maps.LatLng(
										result[0].y, result[0].x);
								var polyline = new kakao.maps.Polyline({
									path : [ startLatLng, endLatLng ]
								});

								// 1.5km 이내에 있는 트럭들 표시
								if (polyline.getLength() < 1000) {
									// 결과값으로 받은 위치를 마커로 표시합니다
									var marker = new kakao.maps.Marker({
										clickable : true,
										map : map,
										position : coords,
										image : new kakao.maps.MarkerImage(
												"../img/truckmark.png",
												new kakao.maps.Size(24, 35))
									// 마커 이미지 
									});
									markers.push(marker);

									/*-- 가져온 트럭 리스트에 출력 ---------------------------------------------------------------------------*/
									itemStr = '<tr id="${truck.tName}"><td>${truck.tName}</td>'
											+ '<td>${truck.tAddress}</td>'
											+ '<td>${truck.tTime}</td><tr>';
									$("#trucklist").append(itemStr);

									/*--인포윈도우 추가---------------------------------------------------------------------------*/
									var iwContent = '<div style="padding:5px;"><a href="#${truck.tName}">${truck.tName}</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
									iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

									// 인포윈도우를 생성합니다
									var infowindow = new kakao.maps.InfoWindow(
											{
												content : iwContent,
												removable : iwRemoveable
											});

									// 마커에 클릭이벤트를 등록합니다
									kakao.maps.event.addListener(marker,
											'click', function() {
												// 마커 위에 인포윈도우를 표시합니다
												infowindow.open(map, marker);
											});
								}

							} else {
								alert("검색결과가 없습니다.")
							}

						});
		</c:forEach>

		/*--지도 드래그 이벤트---------------------------------------------------------------------------*/
		kakao.maps.event
				.addListener(
						map,
						'dragend',
						function() {
							$('#trucklist tr').remove();
							// 지도 중심좌표를 얻어옵니다 
							var latlng = map.getCenter();
							lat = latlng.getLat();
							lon = latlng.getLng();
							for (var i = 0; i < markers.length; i++) {
								markers[i].setMap(null);
							}
							<c:forEach items="${list}" var="truck" varStatus="status">

							// 주소로 좌표를 검색합니다
							geocoder
									.addressSearch(
											"${truck.tAddress}",
											function(result, status) {

												// 정상적으로 검색이 완료됐으면 
												if (status === kakao.maps.services.Status.OK) {

													var coords = new kakao.maps.LatLng(
															result[0].y,
															result[0].x);

													/*--거리 구하기-------------------------------------------------------------*/
													var startLatLng = new kakao.maps.LatLng(
															lat, lon);
													var endLatLng = new kakao.maps.LatLng(
															result[0].y,
															result[0].x);
													var polyline = new kakao.maps.Polyline(
															{
																path : [
																		startLatLng,
																		endLatLng ]
															});

													// 1.5km 이내에 있는 트럭들 표시
													if (polyline.getLength() < 1000) {
														// 결과값으로 받은 위치를 마커로 표시합니다
														var marker = new kakao.maps.Marker(
																{
																	clickable : true,
																	map : map,
																	position : coords,
																	image : new kakao.maps.MarkerImage(
																			"fttruck.png",
																			new kakao.maps.Size(
																					24,
																					35))
																// 마커 이미지 
																});
														markers.push(marker);

														/*-- 가져온 트럭 리스트에 출력 ---------------------------------------------------------------------------*/
														itemStr = '<tr id="${truck.tName}"><td>${truck.tName}</td>'
																+ '<td>${truck.tAddress}</td>'
																+ '<td>${truck.tTime}</td><tr>';
														$("#trucklist").append(
																itemStr);

														/*--인포윈도우 추가---------------------------------------------------------------------------*/
														var iwContent = '<div style="padding:5px;"><a href="#${truck.tName}">${truck.tName}</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
														iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

														// 인포윈도우를 생성합니다
														var infowindow = new kakao.maps.InfoWindow(
																{
																	content : iwContent,
																	removable : iwRemoveable
																});

														// 마커에 클릭이벤트를 등록합니다
														kakao.maps.event
																.addListener(
																		marker,
																		'click',
																		function() {
																			// 마커 위에 인포윈도우를 표시합니다
																			infowindow
																					.open(
																							map,
																							marker);
																		});
													}

												} else {
													alert("검새결과가 없습니다.")
												}

											});
							</c:forEach>

						});

		/*--지도 검색 위치이동---------------------------------------------------------------------------*/
		var ps = new kakao.maps.services.Places();

		function searchPlaces() {
			var keyword = document.getElementById('keyword').value;
			if (!keyword.replace(/^\s+|\s+$/g, '')) {
				alert('키워드를 입력해주세요!');
				return false;
			}
			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			ps.keywordSearch(keyword, placesSearchCB);
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {
				displayPlaces(data);
			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
				alert('검색 결과가 존재하지 않습니다.');
				return;
			} else if (status === kakao.maps.services.Status.ERROR) {
				alert('검색 결과 중 오류가 발생했습니다.');
				return;
			}
		}

		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {
			bounds = new kakao.maps.LatLngBounds(), listStr = '';
			// 마커를 생성하고 지도에 표시합니다
			var placePosition = new kakao.maps.LatLng(places[0].y, places[0].x), itemEl = document
					.createElement('li');
			// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			// LatLngBounds 객체에 좌표를 추가합니다
			bounds.extend(placePosition);
			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}
	</script>	
</body>
</html>