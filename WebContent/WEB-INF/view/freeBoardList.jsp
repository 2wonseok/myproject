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
	
	.container-fluid h2 {
		text-align: center;
		padding : 64px;
		color: #fff;
		letter-spacing: -6px;
		font-size: 48px;
	}

	.boardsearchbox {
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
	
	.boardsearchbox #btn_search {
    color: #fff;
    font-size: 15px;
    border: none;
    background: #1e263c;
    padding: 0px 50px;
    margin: 0 0px;
    line-height: 45px;
	}
	
	.boardsearchbox #btn_reload {
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
    background: #1e263c;
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
<script>
	function reload() {
		window.location = window.location.pathname;
	}
</script>
<body>
<u:navbar/>
<div class="container-fluid" style=" background: url(${root}/logoimage/dosanimage00.jpg); height: 168px; width: 100%;">
	<h2>자유게시판</h2>
</div>
<section id="container">
<div class="boardsearchbox">
	<form action="" method="get">
		<div class="pagenation-container d-flex justify-content-center">
			<select name="searchKeyword" class="form-control" id="searchKeyword">
				<option value="">검색조건</option>
				<option value="title" <c:if test="${searchKeyword eq 'title' }">selected</c:if>>제목</option>
				<option value="name" <c:if test="${searchKeyword eq 'name' }">selected</c:if>>작성자</option>
				<option value="body" <c:if test="${searchKeyword eq 'gender' }">selected</c:if>>내용</option>
			</select>&nbsp; 
			<input type="text" name="searchField" id="searchField" placeholder="search" class="form-control" value="${searchField}" />&nbsp;
			<input type="submit" value="검색" id="btn_search"/>&nbsp;
			<input type="button" value="초기화" id="btn_reload" onclick="reload()" />	
		</div>
	</form>
</div>
	<table class="table table-hover">
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
							<td>
								<c:choose>
									<c:when test="${result.notice == 0 }">
										<span style="color:red;">공지</span>
									</c:when>
									<c:otherwise>
										${result.post_no }
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<c:choose>
								<c:when test="${result.notice == 0 }">
									<span style="color:red;">
										<img src="${root}/logoimage/noticeimage.png" alt="noimage" style="width:20px; height:20px; margin-top: -5px;"/>
									</span>
										<a style="color: #ed1b23; font-size: 16px; line-height: 20px;"
											href="freeBoardView?pageNo=${searchResult.currentPage }&post_no=${result.post_no }&searchKeyword=${searchKeyword }&searchField=${searchField}">
											${result.title } 
										<c:if test="${result.replyCnt > 0 }">
											[${result.replyCnt }]
										</c:if>		
										</a>
								</c:when>
								<c:otherwise>
									<a href="freeBoardView?pageNo=${searchResult.currentPage }&post_no=${result.post_no }&searchKeyword=${searchKeyword }&searchField=${searchField}" style="color: #000;">
										${result.title } 
										<c:if test="${result.replyCnt > 0 }">
											[${result.replyCnt }]
										</c:if>										
									</a>
								</c:otherwise>
							</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${result.notice == 0 }">관리자</c:when>
									<c:otherwise>${result.name }</c:otherwise>
								</c:choose>
							</td>
							<td>${result.regDate }</td>
							<td>${result.readCnt }</td>
						</tr>
					</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach items="${freeBoard.content }" var="boardData">
					<tr>
						<td>
							<c:choose>
								<c:when test="${boardData.notice == 0 }">
									<span style="color:red;">공지</span>
								</c:when>
								<c:otherwise>
									${boardData.post_no }
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${boardData.notice == 0 }">
									<span style="color:red;">
										<img src="${root}/logoimage/noticeimage.png" alt="noimage" style="width:20px; height:20px; margin-top: -5px;"/>
									</span>
									<a style="color: #ed1b23; font-size: 16px; line-height: 20px;"
										href="freeBoardView?pageNo=${freeBoard.currentPage }&post_no=${boardData.post_no }">
										${boardData.title } 
										<c:if test="${boardData.replyCnt > 0 }">
											[${boardData.replyCnt }]
										</c:if>
									</a>
								</c:when>
								<c:otherwise>
									<a href="freeBoardView?pageNo=${freeBoard.currentPage }&post_no=${boardData.post_no }" style="color: #000;">
										${boardData.title } 
										<c:if test="${boardData.replyCnt > 0 }">
											[${boardData.replyCnt }]
										</c:if>
									</a>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${boardData.notice == 0 }">관리자</c:when>
								<c:otherwise>${boardData.name }</c:otherwise>
							</c:choose>
						</td>
						<td>${boardData.regDate }</td>
						<td>${boardData.readCnt }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</tbody>
	</table>
	<input type="button" onclick="location.href='freeBoardWrite'" value="글쓰기" id="btn_write" />
	<div class="pagenation-container d-flex justify-content-center">
		<c:if test="${searchResult.hasArticles() }">
			<nav aria-label="Page navigation example"> 
			  <ul class="pagination mt-3">
					<c:if test="${searchResult.startPage > 5 }">
				    <li class="page-item"><a class="page-link" href="freeBoard?pageNo=${searchResult.startPage - 5 }">Previous</a></li>
					</c:if>
					<c:forEach var="pNo" begin="${searchResult.startPage }" end="${searchResult.endPage }">
			    	<li class="page-item"><a class="page-link" href="freeBoard?pageNo=${pNo }&searchKeyword=${searchKeyword}&searchField=${searchField}">${pNo }</a></li>
					</c:forEach>
					<c:if test="${searchResult.endPage < searchResult.totalPages }">
			    	<li class="page-item"><a class="page-link" href="freeBoard?pageNo=${freeBoard.startPage + 5 }">Next</a></li>
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
				    <li class="page-item"><a class="page-link" href="freeBoard?pageNo=${freeBoard.startPage - 5 }">Previous</a></li>
					</c:if>
					<c:forEach var="pNo" begin="${freeBoard.startPage }" end="${freeBoard.endPage }">
			    	<li class="page-item"><a class="page-link" href="freeBoard?pageNo=${pNo }">${pNo }</a></li>
					</c:forEach>
					<c:if test="${freeBoard.endPage < freeBoard.totalPages }">
			    	<li class="page-item"><a class="page-link" href="freeBoard?pageNo=${freeBoard.startPage + 5 }">Next</a></li>
					</c:if>
			  </ul>
			</nav>
		</c:if>
	</div>
</section>
</body>
</html>