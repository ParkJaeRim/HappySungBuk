<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var message = "정말로 삭제하시겠어요 ?";
	result = window.confirm(message);
	if (result) {
		document.location.href = "${root}/member.do?act=deleteUser";
	} else {
		document.location.href = "${root}/backtoMain";
	}
</script>
</head>
<body>

</body>
</html>