<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script type="text/javascript">
	
</script>

<style>
#map {
	margin-left: 170px;
	border-radius: 20px;
}

#mapwrap {
	position: relative;
	overflow: hidden;
	border-radius: 20px;
}

.category, .category * {
	margin: 0;
	padding: 0;
	color: #000;
}

.category {
	margin-left: 170px;
	position: absolute;
	overflow: hidden;
	top: 10px;
	left: 10px;
	width: 150px;
	height: 50px;
	z-index: 10;
	border: 1px solid black;
	font-family: 'Malgun Gothic', '맑은 고딕', sans-serif;
	font-size: 12px;
	text-align: center;
	background-color: #fff;
}

.category .menu_selected {
	background: #FF5F4A;
	color: #fff;
	border-left: 1px solid #915B2F;
	border-right: 1px solid #915B2F;
	margin: 0 -1px;
}

.category li {
	list-style: none;
	float: left;
	width: 50px;
	height: 45px;
	margin-top: 5px;
	cursor: pointer;
}

.elementryMenu {
	margin-top: 15px;
}

.category .ico_comm {
	display: block;
	margin-left: 15px;
	height: 25px;
	background:
		url('https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fk.kakaocdn.net%2Fdn%2FVyxbh%2FbtqET52WyTk%2FbhSv9LRayFg6Xbh0CqQBkk%2Fimg.png')
		no-repeat;
	width: 25px;
}

.category .ico_elementry {
	background-position: -10px -4px;
}

.category .ico_middle {
	background-position: -10px -38px;
}

.category .ico_high {
	background-position: -10px -68px;
}
</style>

<%@ include file="../include/header.jsp"%>

</head>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d5e6e1f1140f3ded1483ff360cb5a153"></script>
</head>
<body>
	<div class="big">
		<div id="mapwrap">
			<!-- 지도가 표시될 div -->
			<div id="map" style="width: 80%; height: 350px;"></div>
			<!-- 지도 위에 표시될 마커 카테고리 -->
			<div class="category">
				<ul>
					<li id="elementryMenu" onclick="changeMarker('elementry')"><span
						class="ico_comm ico_elementry"></span>초등학교</li>
					<li id="middleMenu" onclick="changeMarker('middle')"><span
						class="ico_comm ico_middle"></span>중학교</li>
					<li id="highMenu" onclick="changeMarker('high')"><span
						class="ico_comm ico_high"></span>고등학교</li>
				</ul>
			</div>
		</div>
	</div>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = {
			center : new kakao.maps.LatLng(37.6003316, 127.0223175), // 지도의 중심좌표 
			level : 7
		// 지도의 확대 레벨 
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		var elementryPositions = [];
		var middlePositions = [];
		var highPositions = [];

		<c:forEach items="${findElementry}" var="id">
		elementryPositions
				.push(new kakao.maps.LatLng("${id.lat}", "${id.lng}"));
		</c:forEach>

		<c:forEach items="${findMiddle}" var="id">
		middlePositions.push(new kakao.maps.LatLng("${id.lat}", "${id.lng}"));

		</c:forEach>

		<c:forEach items="${findHigh}" var="id">
		highPositions.push(new kakao.maps.LatLng("${id.lat}", "${id.lng}"));
		</c:forEach>

		var markerImageSrc = 'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fk.kakaocdn.net%2Fdn%2FdPPmEC%2FbtqEUGIpjoM%2FdkCkJvvFST7p3ES0eHQ6qK%2Fimg.png';
		elementryMarkers = [], middleMarkers = [], highMarkers = [];

		createElementryMarkers();
		createMiddleMarkers();
		createHighMarkers();

		changeMarker('elementry');

		function createMarkerImage(src, size, options) {
			var markerImage = new kakao.maps.MarkerImage(src, size, options);
			return markerImage;
		}

		function createMarker(position, image) {
			var marker = new kakao.maps.Marker({
				position : position,
				image : image
			});

			return marker;
		}

		function createElementryMarkers() {
			for (var i = 0; i < elementryPositions.length; i++) {
				var imageSize = new kakao.maps.Size(22, 26), imageOptions = {
					spriteOrigin : new kakao.maps.Point(10, 36),
					spriteSize : new kakao.maps.Size(36, 98)
				};

				var markerImage = createMarkerImage(markerImageSrc, imageSize,
						imageOptions), marker = createMarker(
						elementryPositions[i], markerImage);

				elementryMarkers.push(marker);
			}
		}

		function setElementryMarkers(map) {
			for (var i = 0; i < elementryMarkers.length; i++) {
				elementryMarkers[i].setMap(map);
			}
		}

		function createMiddleMarkers() {
			for (var i = 0; i < middlePositions.length; i++) {

				var imageSize = new kakao.maps.Size(22, 26), imageOptions = {
					spriteOrigin : new kakao.maps.Point(10, 72),
					spriteSize : new kakao.maps.Size(36, 98)
				};

				var markerImage = createMarkerImage(markerImageSrc, imageSize,
						imageOptions), marker = createMarker(
						middlePositions[i], markerImage);

				middleMarkers.push(marker);
			}
		}
		function setMiddleMarkers(map) {
			for (var i = 0; i < middleMarkers.length; i++) {
				middleMarkers[i].setMap(map);
			}
		}

		function createHighMarkers() {
			for (var i = 0; i < highPositions.length; i++) {

				var imageSize = new kakao.maps.Size(22, 26), imageOptions = {
					spriteOrigin : new kakao.maps.Point(10, 0),
					spriteSize : new kakao.maps.Size(36, 98)
				};

				var markerImage = createMarkerImage(markerImageSrc, imageSize,
						imageOptions), marker = createMarker(highPositions[i],
						markerImage);

				highMarkers.push(marker);
			}
		}

		function setHighMarkers(map) {
			for (var i = 0; i < highMarkers.length; i++) {
				highMarkers[i].setMap(map);
			}
		}

		function changeMarker(type) {

			var elementryMenu = document.getElementById('elementryMenu');
			var middleMenu = document.getElementById('middleMenu');
			var highMenu = document.getElementById('highMenu');

			if (type === 'elementry') {
				elementryMenu.className = 'menu_selected';
				middleMenu.className = '';
				highMenu.className = '';

				setElementryMarkers(map);
				setMiddleMarkers(null);
				setHighMarkers(null);

			} else if (type === 'middle') { // 주차장 카테고리가 클릭됐을 때

				// 주차장 카테고리를 선택된 스타일로 변경하고
				elementryMenu.className = '';
				middleMenu.className = 'menu_selected';
				highMenu.className = '';

				setElementryMarkers(null);
				setMiddleMarkers(map);
				setHighMarkers(null);

			} else if (type === 'high') {
				elementryMenu.className = '';
				middleMenu.className = '';
				highMenu.className = 'menu_selected';

				setElementryMarkers(null);
				setMiddleMarkers(null);
				setHighMarkers(map);

			}
		}

		function makeOverListener(map, marker, infowindow) {
			return function() {
				infowindow.open(map, marker);
			};
		}

		function makeOutListener(infowindow) {
			return function() {
				infowindow.close();
			};
		}
	</script>

</body>
<%@ include file="../include/footer.jsp"%>

</html>