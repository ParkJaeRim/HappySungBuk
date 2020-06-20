<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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
	width: 50px;
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
	padding-top: 5px;
	cursor: pointer;
}

.elementryMenu {
	margin-top: 15px;
}

.category .ico_comm {
	display: block;
	margin: 0 auto 2px;
	width: 26px;
	height: 26px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png')
		no-repeat;
}

.category .ico_elementry {
	background-position: -10px 2px;
}
</style>

<%@ include file="../include/header.jsp"%>

</head>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d5e6e1f1140f3ded1483ff360cb5a153"></script>
</head>

<body>
	<div id="mapwrap">
		<!-- 지도가 표시될 div -->
		<div id="map" style="width: 80%; height: 350px;"></div>
		<!-- 지도 위에 표시될 마커 카테고리 -->
		<div class="category">
			<ul>
				<li id="pharmMenu" onclick="changeMarker('pharm')"><span
					class="ico_comm ico_pharm"></span>약국</li>
			</ul>
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

		var pharmPositions = [];

		<c:forEach items="${findPharm}" var="id">
		pharmPositions.push(new kakao.maps.LatLng("${id.lat}", "${id.lng}"));
		</c:forEach>

		var markerImageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png';
		pharmMarkers = [];

		createPharmMarkers();

		changeMarker('pharm');

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

		function createPharmMarkers() {
			for (var i = 0; i < pharmPositions.length; i++) {

				var imageSize = new kakao.maps.Size(22, 26), imageOptions = {
					spriteOrigin : new kakao.maps.Point(10, 36),
					spriteSize : new kakao.maps.Size(36, 98)
				};

				var markerImage = createMarkerImage(markerImageSrc, imageSize,
						imageOptions), marker = createMarker(pharmPositions[i],
						markerImage);

				pharmMarkers.push(marker);
			}
		}

		function setPharmMarkers(map) {
			for (var i = 0; i < pharmMarkers.length; i++) {
				pharmMarkers[i].setMap(map);
			}
		}

		function changeMarker(type) {

			var pharmMenu = document.getElementById('pharmMenu');

			if (type === 'pharm') {
				pharmMenu.className = 'menu_selected';

				setPharmMarkers(map);

			}
		}
	</script>
</body>
<%@ include file="../include/footer.jsp"%>

</html>