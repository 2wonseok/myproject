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
</head>
<body>
<div class="row">
	<div class="container col-6 mt-1 main">
	<h2 class="sub-header">게시글 보기</h2>
		<form action="freeBoardmodify.do" method="post">
		<input type="hidden" name="post_no" value="${post.post_no }" />		
		<input type="hidden" name="pageNo" value="${param.pageNo }" />		
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
						<td><input type="text" class="form-control" name="title" value="<c:out value="${post.title }"/>" /></td>
					</tr>
					<tr>
						<th style="width:200px; height:200px;">내용</th>
						<td><textarea name="body" class="form-control" id="" cols="30" rows="10">${post.body }</textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" value="수정완료" class="btn btn-success" onclick="if(!confirm('수정하시겠습니까?')){return false;}" />
			<c:set var="pageNo" value="${empty param.pageNo ? '1' : param.pageNo }"/>
				<a href="freeBoardView.do?pageNo=${pageNo }&post_no=${post.post_no}" class="btn btn-primary">취소</a>
		</form>
	</div>
</div>
</body>
</html>