<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<head>
<link href="<c:url value="/resources/css/minty.css" />" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@500&display=swap"
	rel="stylesheet">
<script type="text/javascript">
	function backtoMain() {
		document.location.href = "${root}/backtoMain";
	}

	function mvupdate() {
		document.location.href = "${root}/mvupdate";
	}
	function goList() {
		var f = document.golist;
		f.pg.value = 1;
		f.action = "${pageContext.request.contextPath}/houselist";
		f.method = "post";
		f.submit();
	}
</script>

<style>
* {
	font-family: 'Gothic A1', sans-serif;
}
/* 회원 관련 메뉴 */
.userMenu {
	padding-right: 150px;
	background-color: #78C2AD;
	overflow: hidden;
	height: 70px;
	line-height: 70px;
}

.userMenu li {
	float: right;
	color: white;
}

.userMenu a {
	color: #ffffff;
	text-align: center;
	padding: 14px 16px;
	font-weight: 500;
}

.userMenu a:hover {
	background-color: #ddd;
	color: black;
}

.userMenu a.active {
	background-color: #4CAF50;
	color: white;
}

a, .sub {
	text-decoration: none;
}

/*메뉴*/
.MainMenu {
	align: center;
	height: 85px;
	line-height: 70px;
	overflow: hidden;
}

.MainMenu a {
	color: black;
}

ul li {
	display: inline;
	list-style-type: none;
}

ul {
	text-align: center;
}

/*nav*/
.mainmenu {
	width: 100%;
	height: 40px;
	margin-bottom: 15px;
	margin-top: 15px;
}

.nav1 {
	width: 600px;
	margin-left: 370px;
	font-weight: bold;
}

.nav2 {
	width: 600px;
	margin-left: 450px;
	font-weight: bold;
}

.nav-item {
	float: right;
	margin-right: 20px;
}

.dropdown-toggle {
	background-color: white;
	padding: 8px;
	font-size: 15px;
	border: none;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.nav-link {
	font-size: 1rem;
}

.dropdown-menu {
	display: none;
	position: absolute;
	background-color: white;
	min-width: 70px;
	padding: 8px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
}

.dropdown-menu a {
	color: black;
	padding: 8px;
	text-decoration: none;
	display: block;
}

.dropdown-menu a:hover {
	background-color: #FF7851;
	color: white;
}

.dropdown:hover .dropdown-menu {
	display: block;
}

.dropdown:hover .dropdown-toggle {
	background-color: #FF7851;
	color: white;
}

/* happysungbuk로고 */
.logo {
	display: block;
	text-align: center;
}

.logo img {
	display: inline;
	width: 300px;
	height: 200px;
	margin-top: 40px;
}
</style>
<c:if test="${login == null}">
	<div>
		<nav class="userMenu">
			<ul>
				<li><a href="${root }/login">로그인</a></li>
				<li><a href="${root}/mvregister">회원가입</a></li>
			</ul>
		</nav>
	</div>
	<div class="logo">
		<a href="${root}/backtoMain"><img
			src="${root}/resources/img/HappySungBuk.png" height=90px width=170px></a>
	</div>
	<div class="mainmenu">
		<ul class="nav1 nav-pills">
			<li class="nav-item"><a class="nav-link"
				href="${root }/crawling">실시간 뉴스</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${root }/boardMain/">게시판</a></li>
		</ul>
	</div>
</c:if>

<c:if test="${login != null}">
	<form name="golist">
		<input type="hidden" name="pg" value="">
	</form>
	<div>
		<nav class="userMenu">
			<ul>
				<li><a href="${root}/deleteUser">회원탈퇴</a></li>
				<li><button type="button" class="btn btn-warning"
						data-toggle="modal" data-target="#userModal">회원정보</button></li>
				<li><a href="${root}/logout">로그아웃</a></li>
				<li><strong>${login.name}님 안녕하세요.</strong></li>
			</ul>
		</nav>
	</div>
	<div class="container">
		<div class="modal" id="userModal">
			<div class="modal-dialog" align="left">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">회원 정보</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">아이디 : ${login.id}</div>
					<div class="modal-body">비밀번호 : ${login.password}</div>
					<div class="modal-body">이름 : ${login.name}</div>
					<div class="modal-body">주소 : ${login.address}</div>
					<div class="modal-body">전화번호 : ${login.phone}</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-warning"
							onclick="javascript:backtoMain();">확인(뒤로가기)</button>
						<button type="button" class="btn btn-warning"
							onclick="javascript:mvupdate();">수정</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="logo">
		<a href="${root}/backtoMain"><img
			src="${root}/resources/img/HappySungBuk.png" height=90px width=170px></a>
	</div>
	<div class="mainmenu">
		<ul class="nav2 nav-pills">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
				role="button" aria-haspopup="true" aria-expanded="false">주변탐방</a>
				<div class="dropdown-menu" style="">
					<a class="dropdown-item" href="${root }/school">학교</a> <a
						class="dropdown-item" href="${root }/pharm">약국</a> <a
						class="dropdown-item" href="${root }/com">상권</a>
					<div class="dropdown-divider"></div>
				</div></li>
			<li class="nav-item"><a class="nav-link"
				href="${root }/crawling">실시간 뉴스</a></li>
			<li class="nav-item"><a class="nav-link"
				href="javascript:goList();" id="searchDeal">실거래가 조회</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${root }/boardMain/">게시판</a></li>
		</ul>
	</div>
</c:if>
</head>
