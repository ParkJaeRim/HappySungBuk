<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<title>회원 정보 수정</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
label {
	margin-bottom: 0.5rem !important;
}
</style>
</head>
<body>

	<%@ include file="../include/header.jsp"%>
	<div class="container" align="center">
		<div class="col-lg-6" align="center">
			<form id="memberform" method="post" action="update">
				<div class="form-group" align="left">
					<label for="id">아이디</label> <input type="text" value="${login.id}"
						readonly="true" class="form-control" id="id" name="id" />
				</div>
				<div class="form-group" align="left">
					<label for="password">비밀번호</label> <input type="password"
						class="form-control" id="password" name="password"
						placeholder="수정할 비밀번호">
				</div>
				<div class="form-group" align="left">
					<label for="name">이름</label> <input type="text"
						class="form-control" id="name" name="name" placeholder="수정할 이름"
						value="${login.name }">
				</div>
				<div class="form-group" align="left">
					<label for="tel">전화번호</label> <input type="text"
						class="form-control" id="phone" name="phone"
						placeholder="수정할 전화번호" value="${login.phone }">
				</div>
				<div class="form-group" align="left">
					<label for="">주소</label><br> <input type="text"
						class="form-control" id="address" name="address"
						placeholder="수정할 주소" value="${login.address }">
				</div>
				<div class="form-group" align="center">
					<button type="submit" class="btn btn-primary">수정하기</button>
					<button type="reset" class="btn btn-warning">초기화</button>
				</div>
			</form>
		</div>
	</div>

</body>
</html>
