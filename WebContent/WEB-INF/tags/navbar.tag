<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<style>
	#menu {
   top: 0px;
   margin-left: -100px;
   text-align: center;
   width: 100%;
   min-width: 1200px;
	}
	
	#menu a {
		color: white;
		font-weight: 600;
		width : 130px;
	}
	
	#menu a:hover {
		color: #ed1b23;;

	}
</style>
<div class="container-fluid" style="background-color:#131230;">
	<nav class="navbar navbar-expand" id="menu" style="height:100px;">
	  <div class="container col-9 collapse navbar-collapse" id="navbarSupportedContent">
		  <a class="navbar-brand" href="${root }/LwsProject/mainPage">
		 	 <img src="${root }/logoimage/logodosan.png" alt="noImage" style="width:90px; height:100px; margin-left:80px;"/>
		  </a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
	    <ul class="navbar-nav mc-auto">
	      <li class="nav-item active">
	        <a class="nav-link" href="${root }/LwsProject/introduce">소개<span class="sr-only">(current)</span></a>
	      </li>
	      <li class="nav-item active">
	        <a class="nav-link" href="${root }/LwsProject/schedule">경기 일정</a>
	      </li>
	      <li class="nav-item active">
	        <a class="nav-link" href="${root }/LwsProject/record">기록실</a>
	      </li>
	      <li class="nav-item active">
	        <a class="nav-link" href="${root }/LwsProject/freeBoard">커뮤니티</a>
	      </li>	      	      
	      <li class="nav-item active">
	        <a class="nav-link" href="${root }/LwsProject/pictureBoard">갤러리</a>
	      </li>
	      <li class="nav-item active">
	        <a class="nav-link" href="${root }/LwsProject/noticeBoard">공지사항</a>
	      </li>
	      <c:if test="${authUser.manager == 0 }">
	      <li class="nav-item active">
	        <a class="nav-link" href="${root }/LwsProject/memberList">회원관리</a>
	      </li>
	      </c:if>
			</ul>
			
			<u:notLogin>
			<ul class="navbar-nav">
				<li class="nav-item">
					<a href="${root }/LwsProject/login" class="nav-link"><span style="color:white;"><i class="fas fa-sign-in-alt"></i> 로그인</span></a>
				</li>
				<li class="nav-item">
					<a href="${root }/LwsProject/join" class="nav-link"><span style="color:white;"><i class="fas fa-user-plus"></i> 회원가입</span></a>
				</li>
			</ul>
			</u:notLogin>
			
			<u:isLogin>
			<ul class="navbar-nav">
				<li class="nav-item">
					<a href="${root }/LwsProject/logout" class="nav-link"><span style="color:white;"><i class="fas fa-sign-out-alt"></i> 로그아웃</span></a>
				</li>
				<li class="nav-item">
					<a href="${root }/LwsProject/memberView?id=${authUser.id }" class="nav-link"><span style="color:white;"><i class="fas fa-user-edit"></i> 마이페이지</span></a>
				</li>
				<li class="nav-item">
					<a href="${root }/LwsProject/remove" class="nav-link"><span style="color:white;"><i class="fas fa-user-minus"></i> 탈퇴</span></a>
				</li>
			</ul>
			</u:isLogin>
	  </div>
	</nav>
</div>
