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
<c:if test="${not empty authUser}">
<body>
<div class="container col-6">
	<form action="${root }/freeBoardWrite.do" method="post">
	<input type="hidden" name="id" value="${authUser.id }" />
	<input type="hidden" name="name" value="${authUser.name }" />
		<div class="form-group">
	    <label for="input1-title">제목</label>
	    <input type="text" class="form-control"  name="title" id="input1-title" />
	    <c:if test="${errors.title }">
		    <small class="form-text text-primary">제목을 입력하세요.</small>
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
	    <textarea class="form-control"  cols="30" rows="10" name="content" id="textarea1-body" >${param.content }</textarea>
	  </div>
		<input type="submit" class="btn btn-success" value="새 글 등록" />
	</form>
</div>
</body>
</c:if>
</html>