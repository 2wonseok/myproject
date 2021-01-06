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
    width: 480px;
    z-index: 1;
	}
	#btn_add {
    color: #fff;
    font-size: 15px;
    border: none;
    background: #1e263c;
    padding: 0px 50px;
    margin: 0 0px;
    line-height: 45px;
    float:right;
	}
	
	#container h3 {
		margin-top: -20px;
		margin-bottom:20px;
	}
</style>
<body>
<u:navbar/>
<div class="container-fluid" style=" background: url(${root}/logoimage/dosanimage00.jpg); height: 168px; width: 100%;">
	<h2>회원가입</h2>
</div>
<section id="container">
	<h3>회원가입</h3>
	<form action="${root }/LwsProject/join" method="post">
		  <div class="form-group">
		    <label for="input1-id">아이디</label>
		    <input type="text" class="form-control"  name="memberId" id="input1-id" value="${param.id}" />
		    <c:if test="${errors.memberId }">
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
		    <label for="input2-name">성별</label> <br />
		    <span>남</span>&nbsp;<input type="radio"  style="width:16px; height:16px;" name="gender" value="male" />
		    <span>여</span>&nbsp;<input type="radio"  style="width:16px; height:16px;" name="gender" value="famale" />
		    <c:if test="${errors.gender }">
		    	<small class="form-text text-primary">성별을 체크해주세요.</small>
		    </c:if>
		  </div>
		  <div class="form-group">
		    <label for="input2-name">생년월일</label>
		    <input type="date" class="form-control" name="birth" id="input2-name" value="${param.birth}" /> 
		    <c:if test="${errors.birth }">
		    	<small class="form-text text-primary">생년월일을 입력하세요.</small>
		    </c:if>
		  </div>
		    <label for="input2-name">연락처</label> 
		  <div class="form-group d-flex">
		    <select name="phone1" style="width:30%;"  class="form-control" >
		    	<option value="010">010</option>
		    </select>
		    	<span style="text-align:center; margin-top:6px;">&nbsp;-&nbsp;</span>
		    <input type="text" class="form-control" maxlength="4" name="phone2" style="width:35%;" value="${param.phone2}" />
		   		<span style="text-align:center; margin-top:6px;">&nbsp;-&nbsp;</span>
		    <input type="text" class="form-control" maxlength="4" name="phone3" style="width:35%;" value="${param.phone3}" />
		  </div>
	  	<c:if test="${errors.phoneIsnull }">
		    <small class="form-text text-primary">연락처를 제대로 입력해주세요.</small>
	    </c:if><br />
	    <c:if test="${errors.duplicatePhone }">
				<small class="form-text text-danger">이미 사용중인 휴대폰 번호입니다..</small>
			</c:if><br />
		    <label for="input2-name">이메일</label>
		  <div class="form-group d-flex">
		    <input type="text" class="form-control" name="email1" style="width:50%;" id="input2-name" value="${param.email}" />
		    <span style="text-align:center; margin-top:6px;">&nbsp;@&nbsp;</span>
		    <select name="email2"  style="width:50%;" class="form-control">
		    	<option value="">====선택하세요====</option>
		    	<option value="naver.com">naver.com</option>
		    	<option value="google.com">google.com</option>
		    	<option value="hanmail.net">hanmail.net</option>
		    	<option value="nate.com">nate.com</option>
		    </select>
		  </div>
		    <c:if test="${errors.emailnull }">
			    <small class="form-text text-primary">이메일을 제대로 입력해주세요.</small>
		    </c:if><br />
		   	<c:if test="${errors.duplicateEmail }">
					<small class="form-text text-danger">이미 사용중인 이메일입니다.</small>
				</c:if><br />
		  <input type="submit"  value="가입완료" id="btn_add" />
	</form>
</section>
</body>
</html>