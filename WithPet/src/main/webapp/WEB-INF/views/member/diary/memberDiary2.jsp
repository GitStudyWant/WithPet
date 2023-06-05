<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>

<style>
	
	#body{
		width: 100%;
		height: 1000px;
		background-color:white;
		box-sizing: border-box;
		position:absolute;
		float:left;
		margin-left:15%;
		
	}
	
	#diaryFooter{
		margin-top:1000px;
	}

	#schedulemain{
		width : 85%;
		height : 1000px;
		padding-top : 15px;
	}
	
	#schedulemain p{
		font-size:30px;
		text-align:center;
	}
	
	#body a{
		text-decoration:none;
	}
	
	.container{
		height : 90%;
		margin-top:50px;
	}
	
	
	
	

</style>
</head>
<body>
	<div id="diarySide"><jsp:include page="../../common/myPageSide.jsp" /></div>
	
	<div id="body">	
		  <div id="schedulemain">
		    <p>다이어리</p>
		    <div class="ui container">
		      <div class="ui grid">
		        <div class="ui sixteen column">
		          <div id="calendar"></div>
		        </div>
		      </div>
		    </div>
		
		  </div>
	</div>	
	<div id="diaryFooter"><jsp:include page="../../common/footer.jsp" /></div>
	
	<script>
	$(document).ready(function() {
		
		$('#calendar').fullCalendar({
			height: 800,
			header: {
				left: 'today',
				right: 'prev, title, next',
				center: 'month,basicWeek,basicDay'
			},
			defaultDate: moment().format('YYYY-MM-DD'),
			navLinks: false, // can click day/week names to navigate views
			editable: false,
			lang : 'ko',
			eventLimit: true, // allow "more" link when too many events
			buttonText: {
		          today: '오늘',
		          month: '월',
		          week: '주',
		          day: '일'
		    },
		});
		
	});
	</script>
	
	<script>
	</script>
	
</body>
</html>