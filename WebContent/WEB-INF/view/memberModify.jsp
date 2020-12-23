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
<c:if test="${authUser.id eq modify.memberid }">
<body>
<div class="container col-6">
<h3>회원 정보 수정</h3>
	<form action="memberModify.do" method="post">
	<input type="hidden" name="id" value="${modify.memberid }" />
	<input type="hidden" name="confirmPw" value="${modify.password }" />
		<table class="table table-striped">
			<tr>
				<th style="width:300px;">아이디</th>
				<td>${modify.memberid }</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="password" class="form-control" />
				<c:if test="${errors.pw }">
			    <small class="form-text text-primary">패스워드가 일치하지 않습니다.</small>
		    </c:if>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${modify.name }</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="date" class="form-control" name="birth" value="${modify.birth }" /></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>${modify.gender }</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" class="form-control"  name="email" value="${modify.email }"/></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><input type="text" class="form-control"  name="phone" value="${modify.phone }" /></td>
			</tr>	
		</table>
		<input type="submit" onclick="if(!confirm('수정하시겠습니까?')){return false;}" value="수정완료" class="btn btn-success" />
		<a href="memberView.do?id=${authUser.id }" class="btn btn-dark" >돌아가기</a>
	</form>
</div>
</body>
</c:if>
</html>