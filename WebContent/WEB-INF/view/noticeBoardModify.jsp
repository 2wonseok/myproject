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
    width: 700px;
    z-index: 1;
	}
	#btn_add {
    color: #fff;
    font-size: 15px;
    border: none;
    background: #1e263c;
    padding: 0px 50px;
    line-height: 45px;
    float:right;
    margin-right: 7px;
	}
	#btn_list {
    color: #fff;
    font-size: 15px;
    border: none;
    background: #747474;
    padding: 0px 50px;
    line-height: 45px;
    float:right;
	}
	#container h3 {
		margin-top: -20px;
		margin-bottom:20px;
	}
</style>
<c:if test="${not empty authUser}">
<body>
<u:navbar/>
<div class="container-fluid" style=" background: url(${root}/logoimage/dosanimage00.jpg); height: 168px; width: 100%;">
	<h2>공지사항</h2>
</div>
<section id="container">
	<h3>공지사항 수정</h3>
	<form action="noticeBoardmodify" method="post">
		<input type="hidden" name="post_no" value="${post.post_no }" />		
		<input type="hidden" name="pageNo" value="${param.pageNo }" />
		<div class="form-group">
	    <label for="input1-title">제목</label>
	    <input type="text" class="form-control" name="title" id="input1-title" value="<c:out value="${post.title }"/>" />
	    <c:if test="${errors.notitle }">
		    <small class="form-text text-primary">제목은 필수입니다.</small>
	    </c:if>
	  </div>
	  <c:if test="${authUser.manager == 0 }">
		  <div class="form-group d-flex">
		 		<input type="checkbox" name="notice" style="width:18px; height:18px; margin-top:5px;" value="0"/>&nbsp;
			  <small class="form-text text-danger"><b>공지사항</b></small>
		  </div>
	  </c:if>
	  <div class="form-group">
	    <label for="textarea1-body">내용</label>
	    <textarea class="form-control"  cols="30" rows="10" name="body" id="textarea1-body" >${post.body }</textarea>
	  </div>
		<c:set var="pageNo" value="${empty param.pageNo ? '1' : param.pageNo }"/>
		<input type="button" value="취소" onclick="location.href='noticeBoardView?pageNo=${pageNo }&post_no=${post.post_no}'" id="btn_list">
	  <input type="submit" value="수정완료" id="btn_add" onclick="if(!confirm('수정하시겠습니까?')){return false;}" />
	</form> 
</section>
</body>
</c:if>
</html>