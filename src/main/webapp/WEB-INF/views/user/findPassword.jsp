<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.ssafy.myapp.dto.MemberInfo"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>비밀번호 찾기</title>
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
	function findpwd() {
		if ($("#userid").val() == "") {
			alert("아이디를 입력해주세요.");
			return;
		} else if ($("#username").val() == "") {
			alert("이름을 입력해주세요.");
			return;
		} else if ($("#phone").val() == "") {
			alert("번호를 입력해주세요.");
			return;
		} else {
			document.getElementById("findform").action = "${root}/member.do";
			document.getElementById("findform").submit();
		}
	}
</script>
</head>
<body>
	<%@ include file="../include/header.jsp"%>

	<h3>비밀번호 찾기</h3>
	<div class="container" align="center">
		<div class="col-lg-6" align="center">
			<form id="findform" method="post" action="">
				<input type="hidden" name="act" id="act" value="findPwd">
				<div class="form-group" align="left">
					<label for="">아이디</label> <input type="text" class="form-control"
						id="userid" name="userid" placeholder="등록하신 아이디를 입력해주세요.">
				</div>
				<div class="form-group" align="left">
					<label for="">이름</label> <input type="text" class="form-control"
						id="username" name="username" placeholder="등록하신 이름을 입력해주세요.">
				</div>
				<div class="form-group" align="left">
					<label for="">번호</label> <input type="text" class="form-control"
						id="phone" name="phone" placeholder="등록하신 번호를 입력해주세요.">
				</div>
				<div class="form-group" align="center">
					<button type="button" class="btn btn-warning"
						onclick="javascript:findpwd();">비밀번호 찾기</button>
					<button type="button" class="btn btn-warning"
						onclick="javascript:BacktoLogin();">로그인화면으로</button>
				</div>
			</form>
			<c:if test="${userinfo.password != null}">
				<label for="">찾으신 비밀번호는 </label> ${userinfo.password} 입니다.
				</c:if>


		</div>
	</div>
</body>
</html>