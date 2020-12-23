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
<title>가입</title>
</head>
<style>
	.form-control {
		width:350px;
	}
</style>
<body>

<div class="container col-3">
	<form action="${root }/join.do" method="post">
		  <div class="form-group">
		    <label for="input1-id">아이디</label>
		    <input type="text" class="form-control"  name="memberId" id="input1-id" value="${param.id}" />
		    <c:if test="${errors.id }">
			    <small class="form-text text-primary">아이디를 입력하세요.</small>
		    </c:if>
				<c:if test="${errors.duplicateId }">
					<small class="form-text text-danger">이미 사용중인 아이디입니다.</small>
				</c:if>
		  </div>
		  <div class="form-group">
		    <label for="input2-name">이름</label>
		    <input type="text" class="form-control" name="name" id="input2-name" value="${param.name}" />
		    <c:if test="${errors.name }">
			    <small class="form-text text-primary">이름을 입력하세요.</small>
		    </c:if>
		  </div>
		  <div class="form-group">
		    <label for="input3-password">패스워드</label>
		    <input type="password" class="form-control" name="password" id="input3-password"/>
		    <c:if test="${errors.password }">
		    	 <small class="form-text text-primary">패스워드를 입력하세요.</small>
		    </c:if>
		  </div>
		  <div class="form-group">
		    <label for="input4-confirmPassword">패스워드확인</label>
		    <input type="password" class="form-control" name="confirmPassword" id="input4-confirmPassword">
		    <c:if test="${errors.confirmPassword }">
		    	<small class="form-text text-primary">패스워드확인을 입력하세요.</small>
		    </c:if>
				<c:if test="${errors.pwdNotMacth }">
					<small class="form-text text-danger">패스워드와 확인이 일치하지 않습니다.</small>
				</c:if>
		  </div>
		  <div class="form-group">
		    <label for="input2-name">성별</label>
		    <input type="text" class="form-control" name="gender" id="input2-name" value="${param.name}" />
		    <c:if test="${errors.name }">
			    <small class="form-text text-primary">이름을 입력하세요.</small>
		    </c:if>
		  </div>
		  <div class="form-group">
		    <label for="input2-name">생년월일</label>
		    <input type="text" class="form-control" name="birth" id="input2-name" value="${param.name}" />
		    <c:if test="${errors.name }">
			    <small class="form-text text-primary">이름을 입력하세요.</small>
		    </c:if>
		  </div>
		  <div class="form-group">
		    <label for="input2-name">연락처</label>
		    <input type="text" class="form-control" name="phone" id="input2-name" value="${param.name}" />
		    <c:if test="${errors.name }">
			    <small class="form-text text-primary">이름을 입력하세요.</small>
		    </c:if>
		  </div>
		  <div class="form-group">
		    <label for="input2-name">이메일</label>
		    <input type="text" class="form-control" name="email" id="input2-name" value="${param.name}" />
		    <c:if test="${errors.name }">
			    <small class="form-text text-primary">이름을 입력하세요.</small>
		    </c:if>
		  </div>
		  
		  <button type="submit" class="btn btn-primary">회원 가입</button>
	</form>
</div>
</body>
</html>