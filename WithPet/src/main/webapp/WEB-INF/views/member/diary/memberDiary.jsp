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
		height: 1000px;
		width: 100%;
		background-color:white;
		box-sizing: border-box;
	}

	#scheduleSi{
		width : 20%;
		height : 1000px;
		display: inline-block;	
		float:left;
	}

	#schedulemain{
		width : 75%;
		height : 1000px;
		display: inline-block;	
		float:left;
	}
	

</style>
</head>
<body>
	
	<jsp:include page="../../common/header.jsp" />
	<div id="body">	
		  <div id="scheduleSi">
		    <jsp:include page="../../common/myPageSide.jsp" />
		  </div>
		  <div id="schedulemain">
		    
		    <br />
		    <div class="ui container">
		      <div class="ui grid">
		        <div class="ui sixteen column">
		          <div id="calendar"></div>
		        </div>
		      </div>
		    </div>
		
		  </div>
		</div>	
	<jsp:include page="../../common/footer.jsp" />
	
	<script>
	$(document).ready(function() {
		
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,basicWeek,basicDay'
			},
			defaultDate: '2016-12-12',
			navLinks: true, // can click day/week names to navigate views
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			events: [
				{
					title: 'All Day Event',
					start: '2016-12-01'
				},
				{
					title: 'Long Event',
					start: '2016-12-07',
					end: '2016-12-10'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2016-12-09T16:00:00'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2016-12-16T16:00:00'
				},
				{
					title: 'Conference',
					start: '2016-12-11',
					end: '2016-12-13'
				},
				{
					title: 'Meeting',
					start: '2016-12-12T10:30:00',
					end: '2016-12-12T12:30:00'
				},
				{
					title: 'Lunch',
					start: '2016-12-12T12:00:00'
				},
				{
					title: 'Meeting',
					start: '2016-12-12T14:30:00'
				},
				{
					title: 'Happy Hour',
					start: '2016-12-12T17:30:00'
				},
				{
					title: 'Dinner',
					start: '2016-12-12T20:00:00'
				},
				{
					title: 'Birthday Party',
					start: '2016-12-13T07:00:00'
				},
				{
					title: 'Click for Google',
					url: 'https://google.com/',
					start: '2016-12-28'
				}
			]
		});
		
	});
	</script>
</body>
</html>