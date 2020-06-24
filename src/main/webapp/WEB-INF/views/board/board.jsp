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
<script type="text/javascript">
	function modify() {
		document.detailform.action = "${root}/goModify";
		document.detailform.submit();
	}
</script>
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
						<td>상세정보</td>
					</tr>
				</thead>
				<c:forEach items="${allArticle }" var="article">
					<form id="detailform" method="post" class="form-inline"
						action="${root }/articledetail/${article.no}">
						<input type="hidden" id="content" name="content"
							value="${article.content}">
						<tr>
							<td name="no" value="${article.no}">${article.no}</td>
							<td name="id">${article.id}</td>
							<td name="title">${article.title}</td>
							<td name="dates">${article.dates}</td>
							<td>
								<button type="submit" class="btn btn-warning">상세정보</button>
							</td>
						</tr>
					</form>
				</c:forEach>
			</table>
		</c:if>
	</div>
</body>

<%@ include file="../include/footer.jsp"%>

</html>