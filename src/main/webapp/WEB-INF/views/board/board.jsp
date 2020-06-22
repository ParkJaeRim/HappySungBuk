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
	<div>
		<c:if test="${allArticle != null}">
			<table>
				<thead>
					<tr>
						<td>NO</td>
						<td>아이디</td>
						<td>제목</td>
						<td>날짜</td>
					</tr>
				</thead>
				<c:forEach items="${allArticle }" var="article">
					<tbody>
						<tr>
							<td>${article.no}</td>
							<td>${article.id}</td>
							<td><a href="${root}/articledetail}">${article.title}</a></td>
							<td>${article.dates}</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</c:if>
	</div>
</body>

<%@ include file="../include/footer.jsp"%>

</html>