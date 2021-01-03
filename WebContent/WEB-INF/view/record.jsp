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
	.h4title {
    clear: both;
    font-size: 24px;
    color: #272b36;
    margin-bottom: 10px;
    letter-spacing: -3px;
}
</style>
<body>
<u:navbar/>
<div class="container-fluid" style=" background: url(${root}/logoimage/dosanimage00.jpg); height: 168px; width: 100%">
	<h2>팀기록</h2>
</div>
<section id="container">
	<div class="container">
		<h4 class="h4title">팀순위</h4>
			<table class="table">
			<thead>
				<tr>
					<th>순위</th>
					<th>팀</th>
					<th>경기수</th>
					<th>승</th>
					<th>패</th>
					<th>무</th>
					<th>승률</th>
					<th>승차</th>
					<th>연속</th>
				</tr>
			</thead>
			<tbody>
			<tr>
				<td><p style="font-size:25px;">업데이트 예정입니다.</p></td>
			</tr>
			</tbody>
			</table>
	</div><br />
	<div class="container">
		<h4 class="h4title">시즌 팀기록</h4>
			<table class="table">
			<thead>
				<tr>
					<th>연도</th>
					<th>타율</th>
					<th>경기수</th>
					<th>타수</th>
					<th>안타</th>
					<th>2루타</th>
					<th>3루타</th>
					<th>홈런</th>
					<th>도루</th>
					<th>득점</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><p style="font-size:25px;">업데이트 예정입니다.</p></td>
				</tr>
			</tbody>
			</table>
	</div>
</section>
</body>
</html>