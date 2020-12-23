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
${authUser.name } 님 어서오세요.
<c:if test="${not empty authUser.id }">
	<a href="logout.do">로그아웃</a>
	<a href="list.do">회원 목록</a>
	<a href="memberView.do?id=${authUser.id }">마이페이지</a>
	<a href="${root }/remove.do">회원 탈퇴</a>
	<a href="freeBoard.do">자유게시판</a>
	<a href="pictureBoard.do">사진게시판</a>
</c:if>
<a href="login.do">로그인</a>
<a href="freeBoard.do">자유게시판</a>
<a href="pictureBoard.do">사진게시판</a>
</body> 
<%= request.getSession().getServletContext().getRealPath("/upload") %> <br />
${pageContext.request.getRealPath('/upload') }
</html>