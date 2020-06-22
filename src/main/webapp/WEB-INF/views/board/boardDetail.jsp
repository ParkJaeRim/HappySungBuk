<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<%@ include file="../include/header.jsp"%>
<style>
table {
	align: center;
	width: 100%;
	text-align: center;
}
</style>
</head>


<body>
<!-- ${login}넘어오는거 확인함 이제 수정 버튼 생성해서 수정하는 기능 생성하기 -->
	<div>
		<c:if test="${detail != null}">
			<table>
				<tr>
					<td>NO</td>
					<td>${detail.no}</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td>${detail.id}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>${detail.title}</td>

				</tr>
				<tr>
					<td>내용</td>
					<td>${detail.content}</td>

				</tr>
				<tr>
					<td>날짜</td>
					<td>${detail.dates}</td>

				</tr>
			</table>
		</c:if>
	</div>
</body>

<%@ include file="../include/footer.jsp"%>

</html>