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
<link rel="stylesheet" type="text/css" href="${root }/resource/fullcalendar/fullcalendar.css" />
<link rel="stylesheet" type="text/css" href="${root }/resource/fullcalendar/daygrid.css" />
<link rel="stylesheet" type="text/css" href="${root }/resource/fullcalendar/timegrid.css" />
<script type="text/javascript" src="<c:url value='/resource/js/fullcalendar.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resource/js/daygrid.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resource/js/timegrid.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resource/js/interaction.js'/>"></script>
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
<script>
	document.addEventListener('DOMContentLoaded', function() { 
		var calendarEl = document.getElementById('calendar'); 
		var calendar = new FullCalendar.Calendar(calendarEl, { 
			plugins: [ 'interaction', 'dayGrid', 'timeGrid' ], 
			defaultView: 'dayGridMonth', 
			defaultDate: new Date(), 
			header: { 
				left: 'prev,next today', 
				center: 'title', 
				right: '' 
				}, 
			}); 
		calendar.render(); 
	});

</script>
<body>
<u:navbar/>
<div class="container-fluid" style=" background: url(${root}/logoimage/dosanimage00.jpg); height: 168px; width: 100%">
	<h2>경기 일정</h2>
</div>
<section id="container">
	<div class="container">
		<h4 class="h4title">업데이트 예정입니다.</h4>
		<div id='calendar'>
		</div>
	</div>	
</section>		
</body>
</html>