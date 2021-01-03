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
<script>
	function removeCheck() {
		if(confirm("정말 삭제하시겠습니까?")) {
			alert('삭제가 완료되었습니다.');
			location.href = "noticeBoardRemove?pageNo=${param.pageNo }&post_no=${post.post_no }";
		 } else {
		 	return;
		 }
	}
	
   var click = true;
   function overClick() {
	   if (click) {
	      click = !click;
	      // 타이밍 추가
	      setTimeout(function () {
	          click = true;
	      }, 500)
	   } else {
	      alert('추천은 1회만 가능합니다.');
	      return false;
	   }
   }
</script>
</head>
<style>
	.container-fluid h2 {
		text-align: center;
		color: #fff;
		padding : 48px;
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
	#container td {
    float: left;
    margin: 20px;
    border: 1px solid #d8d8d8;
    border-bottom: 3px solid #d8d8d8;
    background: #fff;
    width: 310px;
    min-height: 330px;
    overflow: hidden;
	}
	#btn_write {
    color: #fff;
    font-size: 15px;
    border: none;
  	background: #1e263c;
    padding: 0px 50px;
    margin: 0 0px;
    line-height: 45px;
    float:right;
    margin-right:120px;
	}
	.webzineTypeView {
    clear: both;
    border-top: 3px solid #4a4a4a;
    border-bottom: 3px solid #4a4a4a;
    margin: 50px 0 20px 0;
    width:1200px;
    height:580px;
	}
	.webzineTypeView .headWrap {
    background: #f5f5f5;
    position: relative;
    height: 60px;
    padding: 10px 30px;
    font-size: 14px;
    color: #222222;
    border-bottom: 1px solid #dedede;
    word-break: keep-all;
    word-wrap: break-word;
	}
	.webzineTypeView .bodyWrap {
    padding: 40px;
    color: #555555;
    font-size: 14px;
    line-height: 35px;
    word-break: keep-all;
    word-wrap: break-word;
	}
	.mr-t10 {
    margin-top: 10px !important;
	}
	.webzineTypeView .headWrap .category {
    color: #41a1eb;
    font-size: 14px;
	}
	.webzineTypeView .headWrap .date {
    position: absolute;
    right: 30px;
    top: 18px;
	}
	.webzineTypeView .headWrap .date p {
    float: left;
    color: #555555;
    margin-left: 30px;
    font-size: 14px;
	}
	#btn_like {
		color: #fff;
    font-size: 30px;
    text-align: center;
    border-radius: 50px;
  	background: #1e263c;
    padding: 0px 8px;
    margin-top: 290px;
    line-height: 45px;
    float:right;
    margin-right: 20px;
	}
	#like_span {
		float:right;
		margin-top: 315px;
		margin-right: -60px;
	}
	#btn_list {
    color: #fff;
    font-size: 15px;
    border: none;
    background: #1e263c;
    padding: 0px 50px;
    margin-right: 7px;
    line-height: 45px;
    float:right;
	}
	#btn_modify {
    color: #fff;
    font-size: 15px;
    border: none;
    background: #747474;
    padding: 0px 50px;
    margin-right: 7px;
    line-height: 45px;
    float:right
	}
	#btn_remove {
    color: #fff;
    font-size: 15px;
    border: none;
    background: #747474;
    padding: 0px 50px;
    margin: 0 0px;
    line-height: 45px;
    float:right
	}	
</style>
<body>
<u:navbar/>
<div class="container-fluid" style=" background: url(${root}/logoimage/dosanimage00.jpg); height: 168px; width: 100%">
	<h2>공지사항</h2>
</div>
<section id="container">
	<div class="webzineTypeView">
		<div class="headWrap">
			<p class="mr-t10">
			<c:if test="${post.notice == 0 }">
				<span class="category">[공지사항]</span> 
			</c:if>
					${post.title }
			</p>
			<div class="date">
				<p><strong>조회수 : </strong>${post.readCnt }</p>
				<p>
					<strong>작성자 : 
						<c:choose>
							<c:when test="${post.notice == 0 }">관리자</c:when>
							<c:otherwise>${post.name }</c:otherwise>
						</c:choose>
					</strong>
				</p>
				<p><strong>등록일 :</strong> ${post.regDate }</p>
				<p><strong>수정일 :</strong> ${post.modDate }</p>
			</div>
		</div>
		<div class="bodyWrap">
			<p>${post.body }</p>
		</div>
		<a href="noticeBoardView?pageNo=${currentPage }&post_no=${post.post_no }&oper=like" onclick="overClick()" id="btn_like">
			<i class="far fa-thumbs-up"></i>
		</a><br />
		<span id="like_span">추천수 : ${post.likeCnt } </span><br /><br />
	</div>

		<c:if test="${authUser.id == post.memberid || authUser.manager == 0 }">
			<input type="button" value="삭제" id="btn_remove" onclick="removeCheck()" />
		</c:if>
		<c:set var="pageNo" value="${empty param.pageNo ? '1' : param.pageNo }"/>
			<input type="button" value="목록" id="btn_list" onclick="location.href='noticeBoard?pageNo=${pageNo }&searchKeyword=${param.searchKeyword }&searchField=${param.searchField}'"/>
		<c:if test="${authUser.id == post.memberid }">
			<input type="button" value="수정" id="btn_modify" onclick="location.href='noticeBoardmodify?pageNo=${pageNo}&post_no=${post.post_no }'"/>
		</c:if>
		
		<u:noticeReplyForm postNo="${post.post_no }" pageNo="${pageNo }" replyId="${reply.id }"/>
</section>
</body>
</html>