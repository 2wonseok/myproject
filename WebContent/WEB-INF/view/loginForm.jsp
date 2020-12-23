<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<title>로그인</title>
</head>
<body>
<div class="container col-3">
	<form action="login.do" method="post">
		<div class="form-group">
	    <input type="text" class="form-control"  placeholder="아이디" name="memberId" id="input1-id" value="${param.memberId}" />
	    <c:if test="${errors.memberId }">
		    <small class="form-text text-primary">아이디를 입력하세요.</small>
	    </c:if>
	  </div>
	  <div class="form-group">
	    <input type="password" class="form-control" placeholder="비밀번호" name="password" id="input2-password" />
	    <c:if test="${errors.password }">
		    <small class="form-text text-primary">비밀번호를 입력하세요.</small>
	    </c:if>
	    <c:if test="${errors.idOrPwNotMatch }">
		    <small class="form-text text-danger">아이디가 없거나 비밀번호가 일치하지 않습니다.</small>
	    </c:if>
	  </div>
	 	<input type="submit" value="로그인" class="btn btn-success btn-block btn-lg"/> <hr />
	 	<div class="container d-flex justify-content-center">
	 	<a href="#" onclick="window.open('find.do?oper=id','아이디찾기','width=500px;,height=300px;,location=no,status=no,scrollbars=no');"
			style="color:gray;">아이디 찾기</a><p style="color:gray;">&nbsp;|&nbsp;</p>
	 	<a href="#" onclick="window.open('find.do?oper=pw','비밀번호','width=500px;,height=300px;,location=no,status=no,scrollbars=no');"
	 		style="color:gray;">비밀번호 찾기</a><p style="color:gray;">&nbsp;|&nbsp;</p>
	  <a href="join.do" style="color:gray;">회원가입</a>
	 	</div>
	</form>
</div>
</body>
</html>