<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HAPPY HOUSE^^</title>

<script type="text/javascript">
function searchArticle() {
   document.getElementById("pg").value = 1;
   document.getElementById("pageform").submit();
}
function pageMove(pg) {
   document.getElementById("pg").value = pg;
   document.getElementById("pageform").submit();
}
function searchByDong() {
   document.getElementById("searchByDong").submit();
}
</script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d5e6e1f1140f3ded1483ff360cb5a153"></script>

<style>
.btn {
	height: 80%;
}

.table-warning {
	width: 100%;
	margin-bottom: 15px;
	background-color: #bfb0a3;
	border-radius: 10px;
	border-right: none;
	border-left: none;
	border-top: none;
	border-bottom: none;
}

._navigation {
	margin: auto;
	width: 98%;
}

.container {
	padding-right: 5px;
	padding-left: 5px;
	margin-right: auto;
	margin-left: auto;
}

#map {
	float: left;
	border-radius: 20px;
	margin-top: 15px;
	margin-bottom: 15px;
}

#mapPharmacy {
	float: left;
	border-radius: 20px;
	margin-top: 15px;
	margin-bottom: 15px;
}

.lookPharmacy {
	float: right;
	margin-left: 30px;
}
</style>
<%@ include file="../include/header.jsp"%>
</head>
<body>
	<div class="container" align="center">
		<div class="col-lg-8" align="center">
			<form onsubmit="javascript:searchArticle();" name="pageform"
				id="pageform" method="post" action="${root }/houselist">
				<input type="hidden" name="pg" id="pg" value="">
				<table class="table table-borderless">
					<tr align="center">
						<td colspan='4'><input class="checkbox" type="checkbox"
							<c:forEach var="ch" items="${housebean.check}"> 
                           <c:if test="${ch == 1}"> checked </c:if>
                           </c:forEach>
							name="check" value="1"> 아파트 매매 <input class="checkbox"
							type="checkbox"
							<c:forEach var="ch" items="${housebean.check}">  
                           <c:if test="${ch == 2}"> checked </c:if>
                            </c:forEach>
							name="check" value="2"> 연립 다세세 매매 <input class="checkbox"
							type="checkbox"
							<c:forEach var="ch" items="${housebean.check}"> 
                           <c:if test="${ch == 3}"> checked </c:if>
                           </c:forEach>
							name="check" value="3"> 아파트 전월세 <input class="checkbox"
							type="checkbox"
							<c:forEach var="ch" items="${housebean.check}"> 
                           <c:if test="${ch == 4}"> checked </c:if>
                           </c:forEach>
							name="check" value="4"> 연립다세대 전월세</td>
					</tr>

					<tr align="center">
						<td width="30%"><select class="form-control" name="key"
							id="key">
								<option value="no" selected="selected">전체 검색</option>
								<option value="dong"
									<c:if test="${housebean.key eq 'dong'}"> selected </c:if>>동별
									검색</option>
								<option value="aptName"
									<c:if test="${housebean.key eq 'aptName'}"> selected </c:if>>아파트별
									검색</option>
						</select></td>
						<td><input type="text" class="form-control"
							placeholder="검색어 입력." name="word" id="word"
							value="${housebean.word}"></td>
						<td colspan='2'>
							<button type="button" class="btn btn-danger"
								onclick="javascript:searchArticle();">검색</button>
						</td>
					</tr>
				</table>
				<table>
					<tr>
						<td>동 별로 검색하세요</td>

						<td><select name="dongkey" id="dongkey">
								<option value="" selected>--전체--</option>
								<c:forEach var="i" items="${option}">
									<option value="${i}"
										<c:if test="${housebean.word eq i}"> selected </c:if>>${i}</option>
								</c:forEach>
						</select>
							<button type="button" class="btn btn-danger"
								onclick="javascript:searchArticle();">검색</button></td>
						<td>
							<div class="lookPharmacy">
								<button type="button" class="btn btn-danger" data-toggle="modal"
									data-target="#myModal">약국 목록 보기</button>
							</div>
						</td>
					</tr>

				</table>
			</form>
		</div>
		<div class="mainEl" align="center">
			<c:if test="${findhouse.size() == 0}">
				<table class="table-primary">
					<tbody>
						<tr class="table-warning" align="center">
							<td>검색에 맞는 결과가 없습니다.</td>
						</tr>
					</tbody>
				</table>
			</c:if>
			<c:if test="${findhouse != null}">
				<div id="map" style="height: 500px; width: 100%;"></div>
				<div style="width: 100%;">

					<table
						style="text-align: center; width: 100%; border: 1px solid #f8b24f; margin-bottom: 15px;">
						<thead class="table-warning">
							<tr>
								<th>번호</th>
								<th>동</th>
								<th>아파트</th>
								<th>거래금액</th>
								<th>상세정보</th>
							</tr>
						</thead>

						<c:forEach var="article" items="${findhouse}">
							<form id="detailform" method="post" class="form-inline"
								action="${root }/housedetail/${article.no}">
								<input type="hidden" id="dealAmount" name="dealAmount"
									value="${article.dealAmount}"> <input type="hidden"
									id="area" name="area" value="${article.area}">
								<tr>
									<td name="no" value="${article.no}">${article.no}</td>
									<td name="dong">${article.dong}</td>
									<td name="aptName">${article.aptName}</td>
									<td name="dealAmount">${article.dealAmount}</td>
									<td>
										<button type="submit" class="btn btn-warning">상세정보</button>
									</td>
								</tr>
							</form>
						</c:forEach>
					</table>
				</div>
				<table style="float: right; width: 80%;">
					<tr>
						<td>${navigation.navigator}</td>
					</tr>
				</table>

			</c:if>


		</div>
		<!-- The Modal -->
		<div class="modal" id="myModal">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">

						<h4 class="modal-title">약국 목록</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<div class="mainEll">
							<c:if test="${findPharmacy.size() == 0}">
								<table class="table-primary">
									<tbody>
										<tr class="table-info" align="center">
											<td>검색에 맞는 결과가 없습니다.</td>
										</tr>
									</tbody>
								</table>
							</c:if>
							<c:if test="${findPharmacy != null}">
								<div id="mapPharmacy" style="height: 500px; width: 100%;"></div>
								<div style="width: 100%; height: 500px; overflow: auto">
									<table style="width: 100%">
										<thead>
											<tr class="table-warning">
												<th>약국이름</th>
												<th>전화번호</th>
												<th>동</th>

											</tr>
										</thead>

										<c:forEach var="phar" items="${findPharmacy}">
											<tbody class="table-light">
												<tr>
													<td name="name" value="${phar.name}">${phar.name}</td>
													<td name="phone">${phar.phone}</td>
													<td name="dong">${phar.dong}</td>
												</tr>
											</tbody>
										</c:forEach>
									</table>
								</div>
							</c:if>
						</div>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>

				</div>
			</div>
		</div>

	</div>

	<script>
            var mapContainer = document.getElementById('map'), // 지도의 중심좌표
            mapOption = {
               center : new kakao.maps.LatLng(37.6003316, 127.0223175), // 지도의 중심좌표
               level : 8
            };
            var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

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
            
            <c:forEach var = "article" items = "${findhouse}">
            var markerPosition = new kakao.maps.LatLng(${article.lat}, ${article.lng});

            var marker = new kakao.maps.Marker({
               map : map, // 마커를 표시할 지도
               position : markerPosition
            });

            var infowindow = new kakao.maps.InfoWindow({
               content :'<div style="width:150px;text-align:center;padding:6px 0;">${article.aptName}</div>'
            });

            kakao.maps.event.addListener(marker, 'mouseover',
                  makeOverListener(map, marker, infowindow));
            kakao.maps.event.addListener(marker, 'mouseout',
                  makeOutListener(infowindow));
            window.setTimeout(function() {
                   map.relayout();
               }, 2000);
//             kakao.maps.event.addListener(marker, 'click', function() {
//                location.href='http://localhost:8080/myapp/housedetail/${article.no}';
//             });
            
            </c:forEach>
         </script>
	<script>
    
   
            var mapContainer = document.getElementById('mapPharmacy'), // 지도의 중심좌표
            mapOption = {
               center : new kakao.maps.LatLng(37.6003316, 127.0223175), // 지도의 중심좌표
               level : 6
            };
            var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

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
            
            <c:forEach var = "article" items = "${findPharmacy}">
            var markerPosition = new kakao.maps.LatLng(${article.lat}, ${article.lng});

            var marker = new kakao.maps.Marker({
               map : map, // 마커를 표시할 지도
               position : markerPosition
            });

            var infowindow = new kakao.maps.InfoWindow({
               content :'<div style="width:150px;text-align:center;padding:6px 0;">${article.name}</div>'
               
            });

            kakao.maps.event.addListener(marker, 'mouseover',
                  makeOverListener(map, marker, infowindow));
            kakao.maps.event.addListener(marker, 'mouseout',
                  makeOutListener(infowindow));
             window.setTimeout(function() {
                      map.relayout();
                  }, 3000);
            </c:forEach>
         </script>
	</div>
</body>
<%@ include file="../include/footer.jsp"%>

</html>