<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<c:if test="${userinfo == null}">
	<c:redirect url="/main.do" />
</c:if>

<!DOCTYPE html>
<html style="background-color: Gray;">
<head>
<meta charset="UTF-8">
<title>회원정보</title>

<script type="text/javascript">
	function mvupdate() {
		document.location.href = "${root}/member.do?act=mvupdate";
	}

	function backtoMain() {
		document.location.href = "${root}/member.do?act=backtoMain";
	}
</script>
</head>

<div class="container" align="center">
	<div class="col-lg-6" align="center">
		<form id="loginform" method="post" action=""
			style="background-color: white; text-align: center; width: 80%; height: 50%">
			<input type="hidden" name="act" id="act" value="">
			<div class="form-group" align="left">
				<label for="">아이디</label> ${userinfo.id}
			</div>
			<div class="form-group" align="left">
				<label for="">비밀번호</label> ${userinfo.password}
			</div>
			<div class="form-group" align="left">
				<label for="">이름</label> ${userinfo.name}
			</div>
			<div class="form-group" align="left">
				<label for="">주소</label> ${userinfo.address}
			</div>
			<div class="form-group" align="left">
				<label for="">전화번호</label> ${userinfo.phone}
			</div>
		</form>
		<div class="form-group" align="center">
			<button type="button" class="btn btn-warning"
				onclick="javascript:backtoMain();">확인(뒤로가기)</button>
			<button type="button" class="btn btn-warning"
				onclick="javascript:mvupdate();">수정</button>
		</div>

	</div>
</div>

</html>
<%-- </c:if> --%>