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
<title>게시물 보기</title>
</head>
<style>
	#searchField {
		width : 350px;
	}
	
	#searchKeyword {
		width : 120px
	}
</style>
<script>
	function reload() {
		window.location = window.location.pathname;
	}
</script>
<body>
<div class="container col-9">
	<table class="table table-striped">
			<thead>
				<tr>
					<th>NO</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${not empty searchResult }">
					<c:forEach items="${searchResult.content }" var="result">
						<tr>
							<td>${result.post_no }</td>
							<td><a href="freeBoardView.do?pageNo=${searchResult.currentPage }&post_no=${result.post_no }&searchKeyword=${searchKeyword }&searchField=${searchField}">${result.title }</a></td>
							<td>${result.name }</td>
							<td>${result.regDate }</td>
							<td>${result.readCnt }</td>
						</tr>
					</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach items="${freeBoard.content }" var="boardData">
					<tr>
						<td>${boardData.post_no }</td>
						<td><a href="freeBoardView.do?pageNo=${freeBoard.currentPage }&post_no=${boardData.post_no }">${boardData.title }</a></td>
						<td>${boardData.name }</td>
						<td>${boardData.regDate }</td>
						<td>${boardData.readCnt }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</tbody>
	</table>
	<a href="freeBoardWrite.do" class="btn btn-primary">글쓰기</a>
	<div class="pagenation-container d-flex justify-content-center">
		<c:if test="${searchResult.hasArticles() }">
			<nav aria-label="Page navigation example"> 
			  <ul class="pagination mt-3">
					<c:if test="${searchResult.startPage > 5 }">
				    <li class="page-item"><a class="page-link" href="freeBoard.dopageNo=${searchResult.startPage - 5 }">Previous</a></li>
					</c:if>
					<c:forEach var="pNo" begin="${searchResult.startPage }" end="${searchResult.endPage }">
			    	<li class="page-item"><a class="page-link" href="freeBoard.do?pageNo=${pNo }&searchKeyword=${searchKeyword}&searchField=${searchField}">${pNo }</a></li>
					</c:forEach>
					<c:if test="${searchResult.endPage < searchResult.totalPages }">
			    	<li class="page-item"><a class="page-link" href="freeBoard.do?pageNo=${freeBoard.startPage + 5 }">Next</a></li>
					</c:if>
			  </ul>
			</nav>
		</c:if>
	</div>
	<div class="pagenation-container d-flex justify-content-center">
		<c:if test="${freeBoard.hasArticles() }">
			<nav aria-label="Page navigation example"> 
			  <ul class="pagination mt-3">
					<c:if test="${freeBoard.startPage > 5 }">
				    <li class="page-item"><a class="page-link" href="freeBoard.do?pageNo=${freeBoard.startPage - 5 }">Previous</a></li>
					</c:if>
					<c:forEach var="pNo" begin="${freeBoard.startPage }" end="${freeBoard.endPage }">
			    	<li class="page-item"><a class="page-link" href="freeBoard.do?pageNo=${pNo }">${pNo }</a></li>
					</c:forEach>
					<c:if test="${freeBoard.endPage < freeBoard.totalPages }">
			    	<li class="page-item"><a class="page-link" href="freeBoard.do?pageNo=${freeBoard.startPage + 5 }">Next</a></li>
					</c:if>
			  </ul>
			</nav>
		</c:if>
	</div>
	<form action="" method="get">
		<div class="pagenation-container d-flex justify-content-center">
			<select name="searchKeyword" class="form-control" id="searchKeyword">
				<option value="">==선택==</option>
				<option value="title" <c:if test="${searchKeyword eq 'title' }">selected</c:if>>제목</option>
				<option value="name" <c:if test="${searchKeyword eq 'name' }">selected</c:if>>작성자</option>
				<option value="body" <c:if test="${searchKeyword eq 'gender' }">selected</c:if>>내용</option>
			</select>&nbsp; 
			<input type="text" name="searchField" id="searchField" placeholder="search" class="form-control" value="${searchField}" />&nbsp;
			<input type="submit" value="검색" class="btn btn-success"/>&nbsp;
			<input type="button" value="새로고침" onclick="reload()" class="btn-sm btn-primary"/>	
		</div>
	</form>
</div>
</body>
</html>