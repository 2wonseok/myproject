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
<title>회원 목록</title>
</head>
<style>
	#searchField {
		width : 350px;
	}
	
	#searchKeyword {
		width : 120px
	}
	
	.gender {
		width : 20px;
		height :20px;
		border :1px;
		margin-top : 10px;

	}
</style>
<c:if test="${authUser.manager != 0 }">
	<script>
		alert('관리자만 접근할 수 있습니다.')
		window.location.href = "index.jsp";
	</script>
</c:if>

<script>
	function reload() {
		window.location = window.location.pathname;
	}
</script>
<c:if test="${authUser.manager == 0 }">
<body>
<div class="container">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>이름</th>
					<th>아이디</th>
					<th>성별</th>
					<th>연락처</th>
					<th>가입일</th>
				</tr>
			</thead>
		<c:if test="${articlePage.hasNoArticles() }">
			<tr>
				<td colspan="4">게시글이 없습니다.</td>
			</tr>
		</c:if>
			<tbody>
			<c:choose>
				<c:when test="${not empty searchResult }">
					<c:forEach items="${searchResult.content }" var="result">
						<tr>
							<td>${result.name }</td>
							<td>
								<a href="memberView.do?id=${result.memberid }&pageNo=${searchResult.currentPage }&searchKeyword=${searchKeyword }&searchField=${searchField}">
									${result.memberid }
								</a>
							</td>
							<td>${result.gender }</td>
							<td>${result.phone }</td>
							<td>${result.regDate }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach items="${listPage.content }" var="list" >
						<tr>
							<td>${list.name }</td>
							<td><a href="memberView.do?id=${list.memberid }&pageNo=${listPage.currentPage }">${list.memberid }</a></td>
							<td>${list.gender }</td>
							<td>${list.phone }</td>
							<td>${list.regDate }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			</tbody>
		</table>
		
		<div class="pagenation-container d-flex justify-content-center">
		<c:if test="${searchResult.hasArticles() }">
			<nav aria-label="Page navigation example"> 
			  <ul class="pagination mt-3">
					<c:if test="${searchResult.startPage > 5 }">
				    <li class="page-item"><a class="page-link" href="list.do?pageNo=${searchResult.startPage - 5 }">Previous</a></li>
					</c:if>
					<c:forEach var="pNo" begin="${searchResult.startPage }" end="${searchResult.endPage }">
			    	<li class="page-item"><a class="page-link" href="list.do?pageNo=${pNo }&searchKeyword=${searchKeyword}&searchField=${searchField}">${pNo }</a></li>
					</c:forEach>
					<c:if test="${searchResult.endPage < searchResult.totalPages }">
			    	<li class="page-item"><a class="page-link" href="list.do?pageNo=${searchResult.startPage + 5 }">Next</a></li>
					</c:if>
			  </ul>
			</nav>
		</c:if>
		</div>
		
		<div class="pagenation-container d-flex justify-content-center">
		<c:if test="${listPage.hasArticles() }">
			<nav aria-label="Page navigation example"> 
			  <ul class="pagination mt-3">
					<c:if test="${listPage.startPage > 5 }">
				    <li class="page-item"><a class="page-link" href="list.do?pageNo=${listPage.startPage - 5 }">Previous</a></li>
					</c:if>
					<c:forEach var="pNo" begin="${listPage.startPage }" end="${listPage.endPage }">
			    	<li class="page-item"><a class="page-link" href="list.do?pageNo=${pNo }">${pNo }</a></li>
					</c:forEach>
					<c:if test="${listPage.endPage < listPage.totalPages }">
			    	<li class="page-item"><a class="page-link" href="list.do?pageNo=${listPage.startPage + 5 }">Next</a></li>
					</c:if>
			  </ul>
			</nav>
		</c:if>
		</div>
		<form action="" method="get">
			<div class="pagenation-container d-flex justify-content-center">
				<select name="searchKeyword" class="form-control" id="searchKeyword">
					<option value="">==선택==</option>
					<option value="name" <c:if test="${searchKeyword eq 'name' }">selected</c:if>>이름</option>
					<option value="memberid" <c:if test="${searchKeyword eq 'memberid' }">selected</c:if>>아이디</option>
					<option value="gender" id="genderSelect" <c:if test="${searchKeyword eq 'gender' }">selected</c:if>>성별</option>
					<option value="phone" <c:if test="${searchKeyword eq 'phone' }">selected</c:if>>연락처</option>
				</select>&nbsp; 
				<input type="text" name="searchField" id="searchField" placeholder="search" class="form-control" value="${searchField}" />&nbsp;
				<input type="submit" value="검색" class="btn btn-success"/>&nbsp;
				<input type="button" value="새로고침" onclick="reload()" class="btn-sm btn-primary"/>	
			</div>
		</form>
</div>
</body>
</c:if>
</html>