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
<div class="container">
	<div class="col-sm-6 col-md-3">
	<c:forEach items="${pictureBoard.content }" var="picture">
		<div class="thumbnail" style="width:300px;height:280px;">
			<img src="${pageContext.request.contextPath }/upload/${picture.uploadFile} " class="form-control" style="width:280px;height:220px;" alt="안보여">
			<div class="caption" style="height:40px;">
				<a href="pictureBoardView.do?pageNo=${pictureBoard.currentPage }&post_no=${picture.post_no }">${picture.title}</a>
			</div>
		</div>
	</c:forEach>
  </div>
  <a href="pictureBoardWrite.do" class="btn btn-primary">사진 등록</a>
  <div class="pagenation-container d-flex justify-content-center">
		<c:if test="${pictureBoard.hasArticles() }">
			<nav aria-label="Page navigation example"> 
			  <ul class="pagination mt-3">
					<c:if test="${pictureBoard.startPage > 5 }">
				    <li class="page-item"><a class="page-link" href="freeBoard.do?pageNo=${pictureBoard.startPage - 5 }">Previous</a></li>
					</c:if>
					<c:forEach var="pNo" begin="${pictureBoard.startPage }" end="${pictureBoard.endPage }">
			    	<li class="page-item"><a class="page-link" href="pictureBoard.do?pageNo=${pNo }">${pNo }</a></li>
					</c:forEach>
					<c:if test="${pictureBoard.endPage < pictureBoard.totalPages }">
			    	<li class="page-item"><a class="page-link" href="pictureBoard.do?pageNo=${pictureBoard.startPage + 5 }">Next</a></li>
					</c:if>
			  </ul>
			</nav>
		</c:if>
	</div>
</div>
</body>
</html>