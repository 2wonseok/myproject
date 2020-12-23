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
	<form action="${pageContext.request.contextPath }/uploadServlet" method="post" enctype="multipart/form-data">
		파일제목 : <input type="text" name="title" id="" /> <br />
		파일명1 : <input type="file" name="file1" id="" /> <br />
		파일명2 : <input type="file" name="file2" id="" /> <br />
		<input type="submit" value="전송" />
	</form>
</div>
</body>
</html>