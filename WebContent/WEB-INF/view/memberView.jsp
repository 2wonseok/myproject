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
<c:if test="${authUser.manager == 0 || authUser.id == result.memberid }">
<body>
<div class="container col-6">
<h3>회원 정보 보기</h3>
	<table class="table table-striped">
		<tr>
			<th style="width:300px;">아이디</th>
			<td>${result.memberid }</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${result.name }</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>${result.birth }</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>${result.gender }</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${result.email }</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td>${result.phone }</td>
		</tr>
		<tr>
			<th>회원등급</th>
			<td>
				<div class="d-flex justify-content-between">
 					<div class="d-flex">
						<c:if test="${result.manager == 0}">관리자</c:if>
						<c:if test="${result.manager != 0}">일반</c:if>
 					</div>
 					<form action="" method="post">	
						<div class="d-flex">
							<input type="hidden" name="memberid" value="${result.memberid }" />		
							<c:if test="${result.manager == 0}">
								<small class="form-text text-default">일반</small>
								<input type="checkbox" class="form-control" style="width:30px; height:20px; margin-top:5px;" name="manager" value="1"/>
							</c:if>
							<c:if test="${result.manager != 0}">
								<small class="form-text text-default">관리자</small>
								<input type="checkbox" class="form-control" style="width:30px; height:20px; margin-top:5px;" name="manager" value="0"/>
							</c:if>
							<input type="submit" onclick="if(!confirm('변경하시겠습니까?')){return false;}" value="적용" class="btn-sm btn-primary mb-2" />
						</div>
					</form>
				</div>
			</td>
		</tr>
		<tr>
			<th>가입일</th>
			<td>${result.regDate }</td>
		</tr>		
	</table>
	<div style="float:right;">
	<c:if test="${authUser.id eq result.memberid }">
		<a href="memberModify.do?id=${authUser.id }" class="btn btn-primary">수정</a>
	</c:if>
	<c:choose>
		<c:when test="${not empty currentPage }">
			<a href="list.do?pageNo=${currentPage }&searchKeyword=${param.searchKeyword }&searchField=${param.searchField}" class="btn btn-dark">목록</a>
		</c:when>
		<c:otherwise>
			<a href="index.jsp" class="btn btn-dark">뒤로</a>
		</c:otherwise>
	</c:choose>
		<a href="memberRemove.do" class="btn btn-danger">삭제</a>
	</div>
</div>
</body>
</c:if>
</html>