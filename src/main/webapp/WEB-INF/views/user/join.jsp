<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.ssafy.myapp.repo.MemberDao, com.ssafy.myapp.repo.MemberDaoImpl"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html lang="ko">
<head>
<title>SSAFY-회원가입</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	
<script type="text/javascript">
	
</script>

<style>
#memberform {
	background-color: white;
	padding-top: 30px;
}
label {
	margin-bottom: 0.5rem !important; 
}
</style>
</head>
<body>
	<%@ include file="../include/header.jsp"%>

	<div class="container" align="center">
		<h3>회원가입</h3>
		<div class="col-lg-6" align="center">
			<form id="memberform" method="post" action="register">
				<input type="hidden" name="act" id="act" value="">
				<div class="form-group" align="left">
					<label for="">아이디</label> <input type="text" class="form-control"
						id="id" name="id" placeholder="아이디">
				</div>
				<div class="form-group" align="left">
					<label for="">비밀번호</label> <input type="password"
						class="form-control" id="password" name="password"
						placeholder="비밀번호">
				</div>
				<div class="form-group" align="left">
					<label for="name">이름</label> <input type="text"
						class="form-control" id="name" name="name" placeholder="이름">
				</div>
				<div class="form-group" align="left">
					<label for="tel">전화번호</label> <input type="text"
						class="form-control" id="phone" name="phone" placeholder="전화번호">
				</div>
				<div class="form-group" align="left">
					<label for="">주소</label><br> <input type="text"
						class="form-control" id="address" name="address" placeholder="주소">
				</div>
				<div class="form-group" align="center">
					<button type="submit" class="btn btn-primary">가입하기</button>
					<button type="reset" class="btn btn-warning">초기화</button>
				</div>
			</form>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>