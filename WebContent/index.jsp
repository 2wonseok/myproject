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
<title>두산베어스</title>
</head>
<style>
	.carousel slide {
    width:100%;
}
	ol, ul {
    list-style: none;
}
	.maincontent ul {
    margin-left: -22px;
    width: 1244px;
}

	.maincontent li {
    float: left;
    margin: 20px;
    border: 1px solid #d8d8d8;
    border-bottom: 3px solid #d8d8d8;
    background: #fff;
    width: 350px;
    min-height: 363px;
    overflow: hidden;
}

	.maincontent li div {
    margin: 20px;
}

	a.more {
    float:right;
    margin-top:13px;
    margin-right:-75px;
    color:gray;
    font-size:20px;
}

	a.more2 {
    float:right;
    margin-top:-48px;
    margin-right:-12px;
    color:gray;
    font-size:15px;
}
	.maincontent a.morebo {
    clear: both;
    margin: 30px auto 0;
    display: block;
    border-radius: 30px;
    background: #6c697e;
    color: #fff;
    text-align: center;
    font-size: 15px;
    font-weight: bold;
    padding: 8px 0px;
    width: 120px;
}
	.container #mainboard {
    clear: both;
    position: relative;
    margin: 50px auto;
    width: 1198px;
    z-index: 200;
    border: 1px solid #e4e4e4;
    border-right: none;
}
	 #mainboard .inner {
    width: 45.5%;
    position: relative;
    float: left;
    margin-top: 32px;
    margin-bottom: 32px;
    margin-left: 90px;
    border: 1px solid #e4e4e4;
    padding: 30px 20px;
    box-sizing: border-box;
    min-height: 440px;
}

	 #mainboard .inner2 {
		width: 45.5%;
    position: relative;
    float: left;
    margin-top: 32px;
    margin-bottom: 32px;
    margin-left: 8px;
    border: 1px solid #e4e4e4;
    padding: 30px 20px;
    box-sizing: border-box;
    min-height: 440px;
}
	.container #mainboard .inner ul.list {
    clear: both;
    padding-top: 10px;
}
	#mainboard h4 {
    text-align: center;
    font-size: 25px;
    color: #222222;
    border-bottom: 2px solid #6a6a6a;
    padding-bottom: 15px;
}
</style>
<body>
<u:navbar/>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="img-fluid" src="${root }/logoimage/dosanmain1.jpg" style="width:100%; height:550px;" border="0">
    </div>
    <div class="carousel-item">
    <img src="${root }/logoimage/dosanmain3.jpg" style="width:100%; height:550px;" border="0">
      <div class="container">
        <div class="carousel-caption">
          <p>
          	<a target="_blank" href="http://ticket.interpark.com/contents/Promotion/MDShopList?dispNo=001780002008" role="button">
          		<img src="${root }/logoimage/interparkimg.JPG" style="width:210px; height:55px; border-radius: 10px;" border="0">
          	</a>
          </p>
        </div>
      </div>
    </div>
    <div class="carousel-item">
    <img src="${root }/logoimage/dosanmain1.jpg" style="width:100%; height:550px;" border="0">
      <div class="container">
        <div class="carousel-caption">
          <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
        </div>
      </div>
    </div>
	  <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	  </a>
	  <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	  </a>
	</div>
</div><br />
<div class="container-fluid" style="background: #f5f5f5;">
	<div class="container">
	<h3><img src="${root }/logoimage/youtubeimg.png" style="width:80px; height:55px;">BEARS VIDEO
		<a href="/media/video" class="more" title="BEARS VIDEO 더보기" alt="BEARS VIDEO 더보기">MORE ></a>
	</h3>
		<div class="maincontent">
			<div class="container">
				<ul>
					<li>
				    <a href="#" class="thumbnail">
				      <iframe width="350" height="208" src="https://www.youtube.com/embed/CaLkp8oGDQM" frameborder="0" 
				      	allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
				    </a>&nbsp;
				    <div>
					    <p style="width:310px; height:60px; margin-top:0px; overflow:hidden; line-height:20px; position:relative; 
					    	float:left; margin-bottom:10px; margin-right:5px; color:#131230; font-weight:400; z-index:1; overflow:hidden;">
					    	<strong>두산베어스 선수들이 전하는 2020 크리스마스 메세지🎄</strong>
					    </p>	
				    </div>
					</li>
					<li>
				    <a href="#" class="thumbnail">
				      <iframe width="350" height="208" src="https://www.youtube.com/embed/vJyAq8KaaMs" frameborder="0" 
				      	allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
				    </a>&nbsp;
				    <div>
					    <p style="width:310px; height:60px; margin-top:0px; overflow:hidden; line-height:20px; position:relative; 
					    	float:left; margin-bottom:10px; margin-right:5px; color:#131230; font-weight:400; z-index:1; overflow:hidden;">
					    	<strong>"두산에서 마무리하고 싶습니다!" 정수빈 FA 계약 인터뷰</strong>
					    </p>	
				    </div>
				  </li>
				  <li>
				    <a href="#" class="thumbnail">
				      <iframe width="350" height="208" src="https://www.youtube.com/embed/26MkgHrHDmg" frameborder="0" 
				      	allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
				    </a>
				 		<div>
					    <p style="width:310px; height:60px; margin-top:0px; overflow:hidden; line-height:20px; position:relative; 
					    	float:left; margin-bottom:10px; margin-right:5px; color:#131230; font-weight:400; z-index:1; overflow:hidden;">
					    	<strong>"저는 약속 지켰습니다!" 허경민의 FA 계약 인터뷰</strong>
					    </p>	
				    </div>
				  </li>
				</ul>
			</div>
			<div class="container">
				<ul>
					<li>
				    <a href="#" class="thumbnail">
				      <iframe width="350" height="208" src="https://www.youtube.com/embed/KjfaslrwVM4" frameborder="0" 
				      	allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
				    </a>&nbsp;
				    <div>
					    <p style="width:310px; height:60px; margin-top:0px; overflow:hidden; line-height:20px; position:relative; 
					    	float:left; margin-bottom:10px; margin-right:5px; color:#131230; font-weight:400; z-index:1; overflow:hidden;">
					    	<strong>2020 KBO 시상식 소감 모음 (11.30)</strong>
					    </p>	
				    </div>
					</li>
					<li>
				    <a href="#" class="thumbnail">
				      <iframe width="350" height="208" src="https://www.youtube.com/embed/y23MP-KNZ5M" frameborder="0" 
				      	allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
				    </a>&nbsp;
				    <div>
					    <p style="width:310px; height:60px; margin-top:0px; overflow:hidden; line-height:20px; position:relative; 
					    	float:left; margin-bottom:10px; margin-right:5px; color:#131230; font-weight:400; z-index:1; overflow:hidden;">
					    	<strong>[2020 이천직캠] 여기저기 울려퍼지는 곡소리... 열정 폭발 신인선수들의 체력테스트!</strong>
					    </p>	
				    </div>
				  </li>
				  <li>
				    <a href="#" class="thumbnail">
				      <iframe width="350" height="208" src="https://www.youtube.com/embed/N_HvRrcSKGA" frameborder="0" 
				      	allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
				    </a>
				 		<div>
					    <p style="width:310px; height:60px; margin-top:0px; overflow:hidden; line-height:20px; position:relative; 
					    	float:left; margin-bottom:10px; margin-right:5px; color:#131230; font-weight:400; z-index:1; overflow:hidden;">
					    	<strong>[2020 포스트시즌] 최강 10번 타자 팬 여러분들의 응원 덕분에 여기까지 올 수 있었습니다.</strong>
					    </p>	
				    </div>
				  </li>
				</ul>
			</div>
			<a href="javascript:moreVideo();" class="morebo" title="BEARS VIDEO 더보기" alt="BEARS VIDEO 더보기">+ 더보기</a><br />
		</div>	
	</div>
</div>
<div class="container" id="container2">
	<div class="container" id ="mainboard">
		<div class="inner" id="pressJson">
			<h4>공지사항</h4>
				<a href="#" class="more2" title="보도자료 더보기" alt="보도자료 더보기">더보기 &gt;</a>	
				<ul class="list">
					<li>zzzzzz</li>
					<li>zzzzzz</li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
				</ul>
		</div>
		<div class="inner2" id="pressJson">
			<h4>커뮤니티</h4>
				<a href="#" class="more2" title="보도자료 더보기" alt="보도자료 더보기">더보기 &gt;</a>	
				<ul class="list">
					<li>zzzzzz</li>
					<li>zzzzzz</li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
				</ul>
		</div>		
	</div>
</div>
</body> 
</html>