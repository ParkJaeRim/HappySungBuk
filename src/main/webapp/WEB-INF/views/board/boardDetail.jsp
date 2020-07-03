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
<script type="text/javascript">
	function deleteArticle() {
		document.detailform.action = "${root}/deleteArticle/${detail.no}";
		document.detailform.submit();
	}
</script>
</head>


<body>
	<!-- ${login}넘어오는거 확인함 이제 수정 버튼 생성해서 수정하는 기능 생성하기 -->
	<div>
		<c:if test="${detail != null}">
			<form id="detailform" method="POST" class="form-inline"
				action="${root }/goModify/${detail.no}">
				<input type="hidden" id="articleid" name="articleid"
					value="${detail.id}"> <input type="hidden" id="loginid"
					name="loginid" value="${login.id}">
				<table>
					<tr>
						<td>NO</td>
						<td name="no" value="${detail.no}">${detail.no}</td>
					</tr>
					<tr>
						<td>아이디</td>
						<td name="id" value="id">${detail.id}</td>
					</tr>
					<tr>
						<td>제목</td>
						<td name="title">${detail.title}</td>

					</tr>
					<tr>
						<td>내용</td>
						<td name="content">${detail.content}</td>

					</tr>
					<tr>
						<td>날짜</td>
						<td name="dates">${detail.date}</td>

					</tr>
					<tr>
						<td>
							<button type="submit" name="handle" value="modify"
								class="btn btn-warning">수정</button>
							<button type="submit" name="handle" value="delete"
								class="btn btn-warning">삭제</button>
						</td>
					</tr>
				</table>
			</form>
		</c:if>
	</div>
</body>

<%@ include file="../include/footer.jsp"%>

</html>