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
    width: 1200px;
    z-index: 1;
	}
	
	#btn_list {
    color: #fff;
    font-size: 15px;
    border: none;
    background: #1e263c;
    padding: 0px 50px;
    margin: 0 0px;
    line-height: 45px;
    float: right;
	}
	#btn_add {
    color: #fff;
    font-size: 15px;
    border: none;
    background: #747474;
    padding: 0px 50px;
    margin-right: 7px;
    line-height: 45px;
    float: right;
	}
	.tableBWrite {
    clear: both;
    display: table;
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
    border-top: 3px solid #4a4a4a;
    margin-bottom: 20px;
	}
	.tableBWrite tbody th {
    background: #f5f5f5;
    position: relative;
    padding: 15px 25px;
    font-size: 17px;
    text-align: left;
    color: #222222;
    border-bottom: 1px solid #dedede;
    width: 140px;
    font-weight: normal;
	}
	.tableBWrite tbody td {
    border-bottom: 1px solid #dedede;
    color: #555555;
    font-size: 14px;
    padding: 17px;
    position: relative;
    vertical-align: top;
    line-height: 25px;
	}	
</style>
<c:if test="${authUser.id eq modify.memberid }">
<body>
<u:navbar/>
<div class="container-fluid" style=" background: url(${root}/logoimage/dosanimage00.jpg); height: 168px; width: 100%;">
	<h2>회원 정보 수정</h2>
</div>
<section id="container">
	<h3>회원 정보 수정</h3>
	<form action="memberModify" method="post">
	<input type="hidden" name="id" value="${modify.memberid }" />
	<input type="hidden" name="confirmPw" value="${modify.password }" />
		<table class="tableBWrite">
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
				<th>변경할 비밀번호</th>
				<td>
					<input type="password" name="changePw" class="form-control" />
				</td>
			</tr>
			<tr>
			<tr>
				<th>변경할 비밀번호 확인</th>
				<td>
					<input type="password" name="changeConfirmPw" class="form-control" />
					<c:if test="${errors.changePw }">
				    <small class="form-text text-primary">변경할 패스워드가 일치하지 않습니다.</small>
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
		<input type="button" value="돌아가기" onclick="location.href='memberView?id=${authUser.id }'" 
				id="btn_list"/>
		<input type="submit" onclick="if(!confirm('수정하시겠습니까?')){return false;}" value="수정완료" id="btn_add" />
	</form>
</section>
</body>
</c:if>
</html>