<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<title>Insert title here</title>
<script>
	function removeCheck() {
		if(confirm("정말 삭제하시겠습니까?")) {
			alert('삭제가 완료되었습니다.');
			location.href = "freeBoardRemove.do?pageNo=${param.pageNo }&post_no=${post.post_no }";
		 } else {
		 	return;
		 }
	}
</script>
</head>
<body>
<div class="row">
	<div class="container col-6 mt-1 main">
	<h2 class="sub-header">게시글 보기</h2>
		<table class="table table-striped">
			<tbody>
				<tr>
					<th>NO</th>
					<td>${post.post_no }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${post.name }</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${post.regDate }</td>
				</tr>
				<tr>
					<th>수정일</th>
					<td>${post.modDate }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><c:out value="${post.title }"/></td>
				</tr>
				<tr>
					<th style="width:200px; height:200px;">내용</th>
					<td>${post.body }</td>
				</tr>
			</tbody>
		</table>
		추천수 : ${post.likeCnt } <br />
		<a href="freeBoardView.do?pageNo=${currentPage }&post_no=${post.post_no }&oper=like" class="btn btn-dark">추천</a><br /><br />
		<c:set var="pageNo" value="${empty param.pageNo ? '1' : param.pageNo }"/>
			<a href="freeBoard.do?pageNo=${pageNo }&searchKeyword=${param.searchKeyword }&searchField=${param.searchField}" class="btn btn-primary">목록</a>
		<c:if test="${authUser.id == post.memberid }">
			<a href="freeBoardmodify.do?pageNo=${pageNo}&post_no=${post.post_no }"  class="btn btn-success">게시글 수정</a>
			<input type="button" value="게시글 삭제" onclick="removeCheck()" class="btn btn-danger"/>
		</c:if>
	</div>
</div>
</body>
</html>