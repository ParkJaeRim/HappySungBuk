<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<style>

/* 실제 집 이미지  */
.banner {
	height: 400px;
	background-position: 70% 30%;
	background-repeat: no-repeat;
	opacity: 0.6;
	max-height: 100%;
	background-size: 100%;
	overflow: hidden;
	background-image: url("https://comelite-arch.com/wp-content/uploads/2018/04/Modern-House-Design-1.jpg");
}

#map {
	border-radius: 15px;
	margin-top: 50px;
	width: 80%;
	height: 500px;
	margin-left: 170px;
}

.label {
	margin-bottom: 96px;
}

.label * {
	display: inline-block;
	vertical-align: top;
}

.label .left {
	background:
		url("https://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_l.png")
		no-repeat;
	display: inline-block;
	height: 24px;
	overflow: hidden;
	vertical-align: top;
	width: 7px;
}

.label .center {
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_bg.png)
		repeat-x;
	display: inline-block;
	height: 24px;
	font-size: 12px;
	line-height: 24px;
}

.label .right {
	background:
		url("https://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_r.png")
		-1px 0 no-repeat;
	display: inline-block;
	height: 24px;
	overflow: hidden;
	width: 6px;
}
</style>
<%@ include file="./include/header.jsp"%>
</head>


<body>
	<div class="section">
		<div class="banner"></div>
		<div id="map"></div>
	</div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d5e6e1f1140f3ded1483ff360cb5a153"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = {
			center : new kakao.maps.LatLng(37.6003316, 127.0223175), // 지도의 중심좌표
			level : 6
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		var positions = [ {
			title : '길음동',
			latlng : new kakao.maps.LatLng(37.6086541, 127.0136683)
		}, {
			title : '돈암동',
			latlng : new kakao.maps.LatLng(37.5971524, 127.0090013)
		}, {
			title : '동선동',
			latlng : new kakao.maps.LatLng(37.5935934, 127.0138707)
		}, {
			title : '동소문동',
			latlng : new kakao.maps.LatLng(37.59114, 127.0069773)
		}, {
			title : '보문동',
			latlng : new kakao.maps.LatLng(37.5831011, 127.0106268)
		}, {
			title : '삼선동',
			latlng : new kakao.maps.LatLng(37.586675, 127.0086863)
		}, {
			title : '상월곡동',
			latlng : new kakao.maps.LatLng(37.6057388, 127.0385623)
		}, {
			title : '석관동',
			latlng : new kakao.maps.LatLng(37.6092842, 127.0525776)
		}, {
			title : '성북동',
			latlng : new kakao.maps.LatLng(37.5959442, 126.9870375)
		}, {
			title : '안암동',
			latlng : new kakao.maps.LatLng(37.5874253, 127.0183649)
		}, {
			title : '장위동',
			latlng : new kakao.maps.LatLng(37.6159274, 127.0415732)
		}, {
			title : '정릉동',
			latlng : new kakao.maps.LatLng(37.6120611, 126.985863)
		}, {
			title : '종암동',
			latlng : new kakao.maps.LatLng(37.5967635, 127.024479)
		}, {
			title : '하월곡동',
			latlng : new kakao.maps.LatLng(37.6041776, 127.0285823)
		} ];

		for (var i = 0; i < positions.length; i++) {
			var content = '<div class ="label"><span class="left"></span><span class="center">'
					+ positions[i].title
					+ '</span><span class="right"></span></div>';

			var customOverlay = new kakao.maps.CustomOverlay({
				position : positions[i].latlng,
				content : content
			});
			customOverlay.setMap(map);
		}
	</script>

</body>

<%@ include file="./include/footer.jsp"%>

</html>