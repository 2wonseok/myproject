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
<body>
<u:navbar/>
<div class="container col-3">
	<form action="remove" method="post">
		<input type="hidden" name="memberId" value="${authUser.id }"/>
		<div class="form-group">
	    <label for="input1-nowPwd">현재 암호</label>
	    <input type="password" class="form-control" style="width:350px;" name="password" id="input1-nowPwd" />
	    <c:if test="${errors.PwNotMatch }">
		    <small class="form-text text-primary">현재 암호가 일치하지 않습니다.</small>
	    </c:if>
	  </div>
		<input type="submit" value="회원탈퇴" class="btn btn-primary" />
	</form>
</div>
</body>
</html>