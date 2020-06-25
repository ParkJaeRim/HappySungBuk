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
		<form id="detailform" method="post" class="form-inline"
			action="${root }/create">
			<table>
				<tr>
					<td><label for="id">아이디</label></td>
					<td><input type="text" value="${login.id}" readonly="true"
						class="form-control" id="id" name="id" /></td>
				</tr>
				<tr>
					<td><label for="title">제목</label></td>
					<td><input type="text" class="form-control" id="title"
						name="title" placeholder="제목을 입력해주세요"></td>
				</tr>
				<tr>
					<td><label for="content">내용</label></td>
					<td><input type="text" class="form-control" id="content"
						name="content" placeholder="내용을 입력해주세요"></td>
				</tr>
				<tr>
					<td>
						<button type="submit" class="btn btn-warning">등록하기</button>
					</td>
				</tr>
			</table>
		</form>

	</div>
</body>

<%@ include file="../include/footer.jsp"%>

</html>