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
<h4>아이디 찾기</h4><br />
<form action="find.do" method="post">
	<input type="hidden" name="oper" value="findId" />
	<input type="text" class="form-control" name="findName" placeholder="이름" > <br />
	<c:if test="${errors.findErrors }">
   <small class="form-text text-primary">일치하는 정보가 없습니다.</small>
  </c:if>
	<input type="email" class="form-control" name="findEmail" placeholder="이메일"/><br />
	<input type="submit" value="검색" class="btn btn-primary"/>
	<input type="button" value="닫기" class="btn btn-danger" onclick="window.close()"/>
</form>
<c:if test="${not empty findRs }">
	<small class="form-text text-primary">회원님의 아이디는 ${findRs.memberid } 입니다.</small>
</c:if>
</div>
</body>
</html>