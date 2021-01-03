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
	.container-fluid h2 {
		text-align: center;
		padding : 64px;
		color: #fff;
		letter-spacing: -6px;
		font-size: 48px;
	}
	#container {
    clear: both;
    position: relative;
    margin: 50px auto 0px;
    padding: 0 0 50px 0;
    width: 1500px;
    z-index: 1;
	}
	#container td {
    float: left;
    margin: 20px;
    border: 1px solid #d8d8d8;
    border-bottom: 3px solid #d8d8d8;
    background: #fff;
    width: 310px;
    min-height: 330px;
    overflow: hidden;
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
    margin-right:120px;
	}
</style>
<body>
<u:navbar/>
<div class="container-fluid" style=" background: url(${root}/logoimage/dosanimage00.jpg); height: 168px; width: 100%">
	<h2>갤러리</h2>
</div>
<section id="container">
<table>
	<tr>
	<c:forEach items="${pictureBoard.content }" var="picture" varStatus="status">
		<td>
			<a href="pictureBoardView?pageNo=${pictureBoard.currentPage }&post_no=${picture.post_no }" class="thumbnail" id="thum1" >
				<img src="${pageContext.request.contextPath }/upload/${picture.uploadFile}" style="width:310px;height:245px;" alt="안보여">
			</a>
		    <div>
					<p style="width:275px; height:60px; margin:15px; overflow:hidden; line-height:20px; position:relative; 
					    	float:left; color:#131230; font-weight:400; z-index:1; overflow:hidden;">
						<strong>${picture.title }</strong>
					</p>	
	 	   </div>
			&nbsp; &nbsp;
		</td>
			<c:choose>
				<c:when test="${status.count % 4 == 0 }">
					<tr></tr>
				</c:when>
			</c:choose>
	</c:forEach>
	</tr>
</table>
	<input type="button" onclick="location.href='pictureBoardWrite'" value="사진등록" id="btn_write" />
  <div class="pagenation-container d-flex justify-content-center">
		<c:if test="${pictureBoard.hasArticles() }">
			<nav aria-label="Page navigation example"> 
			  <ul class="pagination mt-3">
					<c:if test="${pictureBoard.startPage > 5 }">
				    <li class="page-item"><a class="page-link" href="pictureBoard?pageNo=${pictureBoard.startPage - 5 }">Previous</a></li>
					</c:if>
					<c:forEach var="pNo" begin="${pictureBoard.startPage }" end="${pictureBoard.endPage }">
			    	<li class="page-item"><a class="page-link" href="pictureBoard?pageNo=${pNo }">${pNo }</a></li>
					</c:forEach>
					<c:if test="${pictureBoard.endPage < pictureBoard.totalPages }">
			    	<li class="page-item"><a class="page-link" href="pictureBoard?pageNo=${pictureBoard.startPage + 5 }">Next</a></li>
					</c:if>
			  </ul>
			</nav>
		</c:if>
	</div>
</section>
</body>
</html>