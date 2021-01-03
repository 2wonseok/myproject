<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<link href="${root }/logoimage/mainlogo.png" rel="shortcut icon" type="image/x-icon">
<title>이원석 프로젝트</title>
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
	
	.container-fluid h2 {
		text-align: center;
		padding : 64px;
		color: #fff;
		letter-spacing: -6px;
		font-size: 48px;
	}

	.membersearchbox {
    clear: both;
    width: 1200px;
    margin: 50px auto 30px;
    background: #f2f5fa;
    padding: 10px 30px;
    border: 1px solid #e7e9ee;
    text-align: center;
    color: #666666;
    font-size: 15px;
	}
	
	.membersearchbox #btn_search {
    color: #fff;
    font-size: 15px;
    border: none;
    background: #1e263c;
    padding: 0px 50px;
    margin: 0 0px;
    line-height: 45px;
	}
	
	.membersearchbox #btn_reload {
    color: #fff;
    font-size: 15px;
    border: none;
    background: #747474;
    padding: 0px 50px;
    margin: 0 0px;
    line-height: 45px;
	}
	
	#btn_write {
    color: #fff;
    font-size: 15px;
    border: none;
    background: #747474;
    padding: 0px 50px;
    margin: 0 0px;
    line-height: 45px;
    float:right;
	}
	
	#container {
    clear: both;
    position: relative;
    margin: 50px auto 0px;
    padding: 0 0 50px 0;
    width: 1200px;
    z-index: 1;
	}
	
</style>
<c:if test="${authUser.manager != 0 }">
	<script>
		alert('관리자만 접근할 수 있습니다.')
		window.location.href = "mainPage";
	</script>
</c:if>

<script>
	function reload() {
		window.location = window.location.pathname;
	}
</script>
<c:if test="${authUser.manager == 0 }">
<body>
<u:navbar/>
<div class="container-fluid" style=" background: url(${root}/logoimage/dosanimage00.jpg); height: 168px; width: 100%;">
	<h2>회원 관리</h2>
</div>
<section id="container">
	<div class="membersearchbox">
		<form action="" method="get">
			<div class="pagenation-container d-flex justify-content-center">
				<select name="searchKeyword" class="form-control" id="searchKeyword">
					<option value="">검색조건</option>
					<option value="name" <c:if test="${searchKeyword eq 'name' }">selected</c:if>>이름</option>
					<option value="memberid" <c:if test="${searchKeyword eq 'memberid' }">selected</c:if>>아이디</option>
					<option value="gender" id="genderSelect" <c:if test="${searchKeyword eq 'gender' }">selected</c:if>>성별</option>
					<option value="phone" <c:if test="${searchKeyword eq 'phone' }">selected</c:if>>연락처</option>
				</select>&nbsp; 
				<input type="text" name="searchField" id="searchField" placeholder="search" class="form-control" value="${searchField}" />&nbsp;
				<input type="submit" value="검색" id="btn_search"/>&nbsp;
				<input type="button" value="초기화"  id="btn_reload" onclick="reload()" class="btn-sm btn-primary"/>	
			</div>
		</form>
	</div>
		<table class="table table-hover">
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
								<a style="color: #000; font-weight: 600; font-size: 18px; line-height: 20px;"
									href="memberView?id=${result.memberid }&pageNo=${searchResult.currentPage }&searchKeyword=${searchKeyword }&searchField=${searchField}">
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
							<td>
								<a style="color: #000; font-weight: 600; font-size: 18px; line-height: 20px;"
									href="memberView?id=${list.memberid }&pageNo=${listPage.currentPage }">${list.memberid }</a>
							</td>
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
				    <li class="page-item"><a class="page-link" href="memberList?pageNo=${searchResult.startPage - 5 }">Previous</a></li>
					</c:if>
					<c:forEach var="pNo" begin="${searchResult.startPage }" end="${searchResult.endPage }">
			    	<li class="page-item"><a class="page-link" href="memberList?pageNo=${pNo }&searchKeyword=${searchKeyword}&searchField=${searchField}">${pNo }</a></li>
					</c:forEach>
					<c:if test="${searchResult.endPage < searchResult.totalPages }">
			    	<li class="page-item"><a class="page-link" href="memberList?pageNo=${searchResult.startPage + 5 }">Next</a></li>
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
				    <li class="page-item"><a class="page-link" href="memberList?pageNo=${listPage.startPage - 5 }">Previous</a></li>
					</c:if>
					<c:forEach var="pNo" begin="${listPage.startPage }" end="${listPage.endPage }">
			    	<li class="page-item"><a class="page-link" href="memberList?pageNo=${pNo }">${pNo }</a></li>
					</c:forEach>
					<c:if test="${listPage.endPage < listPage.totalPages }">
			    	<li class="page-item"><a class="page-link" href="memberList?pageNo=${listPage.startPage + 5 }">Next</a></li>
					</c:if>
			  </ul>
			</nav>
		</c:if>
		</div>
</section>
</body>
</c:if>
</html>