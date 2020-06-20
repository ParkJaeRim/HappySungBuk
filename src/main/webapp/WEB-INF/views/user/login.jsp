<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
<style>
</style>
<title>Login</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<%@ include file="../include/header.jsp"%>

<style>
#content_table {
	border: 1px, solid, black;
}

#forms {
	width: 502px;
	margin-left: 600px;
	margin-bottom: 50px;
	margin-right: auto;
	position: relative;
	top: 100px
}

#btngrp {
	margin-left: 50px;
}

#real {
	margin-left: 65px;
}

#real a {
	margin-right: 10px;
}
</style>
</head>
<body>

	<div id="main_wrap">
		<div id="middle_wrap">
			<div id="content_wrap">
				<div id='forms'>
					<div class="login_title_warp">
						<div style="margin-top: 12px;">
							<h2>${head}</h2>
						</div>
					</div>
					<div id="login_wrap">
						<form name="frmForm" id="_frmForm" action="main" method="post">
							<table class="content_table" style="width: 50%;">
								<colgroup>
									<col style="width: 30%;" />
									<col style="width: 65%;" />
								</colgroup>
								<tbody>
									<tr>
										<th>아이디</th>
										<td><input type="text" id="_userid" name="id" value=""
											data-msg="ID를" title="아이디" style="width: 100%; border: 1;" />
										</td>
									</tr>
									<tr>
										<th>패스워드</th>
										<td><input type="password" id="_pwd" name="password"
											value="" data-msg="암호를" title="패스워드"
											style="width: 100%; border: 1;" /></td>
									</tr>
									<tr id=btngrp>
										<td colspan="2"
											style="height: 50px; width: 80%; text-align: center;"><span
											id="real"> <a href="#none" id="_btnLogin" title="로그인">로그인</a>
												<a href="#none" id="_btnRegi" title="회원가입">회원가입</a>
										</span></td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$("#_btnLogin").click(function() {
			if ($("#_userid").val() == "") {
				alert($("#_userid").attr("data-msg") + " 입력해 주십시요.");
				$("#_userid").focus();
			} else if ($("#_pwd").val() == "") {
				alert($("#_pwd").attr("data-msg") + " 입력해 주십시요.");
				$("#_pwd").focus();
			} else {
				$("#_frmForm").attr("target", "_self").submit();
			}
		});
		$("#_btnRegi").click(function() {
			location.href = "${root}/mvregister";
		});
		$("#_userid").keypress(function(event) {
			if (event.which == '13') {
				event.preventDefault();
				$("#_pwd").focus();
			}
		});

		$("#_pwd").keypress(function(event) {
			if (event.which == '13') {
				event.preventDefault();
				$("#_btnLogin").click();
			}
		});
	</script>
</body>
<%@ include file="../include/footer.jsp"%>

</html>
