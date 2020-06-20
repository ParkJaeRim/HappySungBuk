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
	function backtoHouseList() {
		document.location.href = "${root}/houselist?pg=1";
	}
	function goRecom() {
		var order = document.getElementById("recommendResult");
		if (order.style.visibility == 'hidden') {
			recommendResult.style.visibility = 'visible';
		} else {
			recommendResult.style.visibility = 'hidden';
		}
	}
</script>

<style>
#map {
	float: left;
	border-radius: 20px;
	margin-top: 15px;
	margin-bottom: 15px;
}

#backbtn {
	float: right;
	margin-top: 15px;
	margin-bottom: 15px;
}

#recommendBtn {
	margin-top: 15px;
	margin-bottom: 15px;
}

.container {
	padding-right: 5px;
	padding-left: 5px;
	margin-right: auto;
	margin-left: auto;
}

.table-warning {
	width: 100%;
	margin-top: 15px;
	background-color: #bfb0a3;
	border-radius: 10px;
	border-right: none;
	border-left: none;
	border-top: none;
	border-bottom: none;
}

img {
	border-radius: 20px;
}
</style>
<%@ include file="../include/header.jsp"%>

</head>
<body>
	<div class="container" align="center">

		<!-- map start -->
		<c:if test="${findhouse != null}">
			<div id="map" style="height: 500px; width: 100%;"></div>
			<div style="width: 100%;">
				<div>
					<img src="${root}/resources/img/${findhouse.aptName}.jpg"
						onerror="this.src='${root}/resources/img/대체이미지.jpg'"
						style="width: 100%; height: 500px;">
				</div>
				<div>
					<table style="width: 100%; height: 100px; margin-top: 15px;">
						<tbody align="center">
							<tr class="table-warning">
								<td>거래번호</td>
								<td>동</td>
								<td>아파트명</td>
								<td>금액</td>
								<td>건축년도</td>
								<td>거래연도</td>
								<td>거래월</td>
								<td>거래일</td>
								<td>전용면적</td>
								<td>지번</td>

							</tr>
							<tr class="table-light">
								<td>${findhouse.no}</td>
								<td>${findhouse.dong}</td>
								<td>${findhouse.aptName}</td>
								<td>${findhouse.dealAmount}</td>
								<td>${findhouse.buildYear}</td>
								<td>${findhouse.dealYear}</td>
								<td>${findhouse.dealMonth}</td>
								<td>${findhouse.dealDay}</td>
								<td>${findhouse.area}</td>
								<td>${findhouse.jibun}</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<input type="hidden" id="lat" name="lat" value="${findhouse.lat}">
			<input type="hidden" id="lng" name="lng" value="${findhouse.lng}">
		</c:if>

		<table id="recommendResult" style="visibility: visible; width: 100%;">
			<thead>
				<tr class="table-warning" style="text-align: center; height: 40px;">
					<th>No.</th>
					<th>사진</th>
					<th>동</th>
					<th>아파트</th>
					<th>면적</th>
					<th>거래 일시</th>
					<th>거래 금액</th>
					<th>상세 정보</th>
				</tr>
			</thead>
			<tbody class="table-light" style="text-align: center">
				<c:forEach var="re" items="${recommend}">
					<form id="detailform" method="post" class="form-inline"
						action="${root }/housedetail/${re.no}">
						<input type="hidden" id="dealAmount" name="dealAmount"
							value="${re.dealAmount}"> <input type="hidden" id="area"
							name="area" value="${re.area}">
						<tr>
							<td name="no" value="${re.no}">${re.no}</td>
							<td><img src="${root}/resources/img/${re.aptName}.jpg"
								onerror="this.src='${root}/resources/img/대체이미지.jpg'"
								style="width: 300px; height: 300px;"></td>
							<td name="dong">${re.dong}</td>
							<td name="aptName">${re.aptName}</td>
							<td name="area">${re.area}</td>
							<td name="date">${re.dealYear}년${re.dealMonth }월${re.dealDay }일</td>
							<td name="dealAmount">${re.dealAmount}</td>
							<td>
								<button type="submit" class="btn btn-warning">상세정보</button>
							</td>
						</tr>
					</form>
				</c:forEach>
			</tbody>
			<div>
				<button type="text" class="btn btn-secondary" id="recommendBtn"
					onclick="goRecom()">추천목록 숨기기</button>
			</div>

			<div>
				<button type="button" class="btn btn-secondary" id="backbtn"
					onclick="javascript:backtoHouseList();">뒤로가기</button>
			</div>

		</table>

	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d5e6e1f1140f3ded1483ff360cb5a153"></script>

	<script>
		var Lat = document.getElementById('lat').value;
		var Lng = document.getElementById('lng').value;

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(Lat, Lng), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		// 마커가 표시될 위치입니다 
		var markerPosition = new kakao.maps.LatLng(Lat, Lng);
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	</script>
</body>
<%@ include file="../include/footer.jsp"%>

</html>