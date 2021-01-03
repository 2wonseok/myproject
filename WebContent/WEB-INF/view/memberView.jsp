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
	}
	#btn_remove {
    color: #fff;
    font-size: 15px;
    border: none;
    background: #747474;
    padding: 0px 50px;
    margin: 0 0px;
    line-height: 45px;
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
	
	#btn_manager {
		color: #fff;
    font-size: 13px;
    border: none;
    background: #1e263c;
    padding: 0px 20px;
    line-height: 45px;
    margin-top: -5px;
    margin-right: -17px;
	}
</style>
<c:if test="${authUser.manager == 0 || authUser.id == result.memberid }">
<body>
<u:navbar/>
<div class="container-fluid" style=" background: url(${root}/logoimage/dosanimage00.jpg); height: 168px; width: 100%;">
	<h2>회원 관리</h2>
</div>
<section id="container">
	<h3>회원 정보 보기</h3>
	<table class="tableBWrite">
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
				<div class="d-flex justify-content-between" style="margin-top: 12px;">
 					<div class="d-flex">
						<c:if test="${result.manager == 0}">관리자</c:if>
						<c:if test="${result.manager != 0}">일반</c:if>
 					</div>
 					<c:if test="${authUser.manager == 0 }">
	 					<form action="" method="post">	
							<div class="d-flex">
								<input type="hidden" name="memberid" value="${result.memberid }" />		
								<input type="hidden" name="pageNo" value="${currentPage }" />		
								<c:if test="${result.manager == 0}">
									<small class="form-text text-default">일반</small>
									<input type="checkbox" class="form-control" style="width:30px; height:20px; margin-top:5px;" name="manager" value="1"/>
								</c:if>
								<c:if test="${result.manager != 0}">
									<small class="form-text text-default">관리자</small>
									<input type="checkbox" class="form-control" style="width:30px; height:20px; margin-top:5px;" name="manager" value="0"/>
								</c:if>
								<input type="submit" onclick="if(!confirm('변경하시겠습니까?')){return false;}" value="적용" id="btn_manager" />
							</div>
							<c:if test="${errors.noCheck }">
								<small class="form-text text-danger">체크박스를 선택해주세요.</small>
							</c:if>
						</form>
 					</c:if>
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
		<input type="button" value="수정" onclick="location.href='memberModify?id=${authUser.id }'" id="btn_remove"/>
	</c:if>
	<c:choose>
		<c:when test="${not empty currentPage }">
			<input type="button" value="목록" onclick="location.href='memberList?pageNo=${currentPage }&searchKeyword=${param.searchKeyword }&searchField=${param.searchField}'" 
				id="btn_list"/>
		</c:when>
		<c:otherwise>
			<input type="button" value="뒤로" onclick="location.href='mainPage'" id="btn_list"/>
		</c:otherwise>
	</c:choose>
	<c:if test="${authUser.id eq result.memberid }">
		<input type="button" value="탈퇴" onclick="location.href='remove'" id="btn_remove"/>
	</c:if>
	</div>
</section>
</body>
</c:if>
</html>