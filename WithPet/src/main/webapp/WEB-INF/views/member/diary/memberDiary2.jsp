<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" >
<link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.10.0/locales/bootstrap-datepicker.ko.min.js" integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
	
	#schedulemain table{
		width : 80%;
		margin : auto;
	}
	
	#schedulemain tr{
		border : 1px solid black;
	}
	
	#schedulemain th{
		width : 250px;
	}
	
	#schedulemain td{
		vertical-align:top;
		text-align:left;
		padding : 0px;
	}

</style>
</head>
<body>

	<jsp:include page="../../common/header.jsp" />
	<div id="body">
			<div id="scheduleSi"><jsp:include page="../../common/myPageSide.jsp" /></div>
			<div id="schedulemain">
				<div style="height:100px;">fasdfsd</div>
				<table id="calendar">
				</table>
				
			</div>
	</div>		
	<jsp:include page="../../common/footer.jsp" />
	
	<script>
		$(function(){
		
			var calendar = document.getElementById("calendar");
			console.log(calendar);
			
			var endDay = 31;
			var startWeek = 1;
			
			var calendarHTML = "<tr>"
							   + "<th>일</th>"
							   + "<th>월</th>"
							   + "<th>화</th>"
							   + "<th>수</th>"
							   + "<th>목</th>"
							   + "<th>금</th>"
							   + "<th>토</th>"
							   + "</tr>"
							   + "<tr>"
							   + "<td id='cal1'>" + "</td>"
							   + "<td id='cal2'>" + "</td>"
							   + "<td id='cal3'>" + "</td>"
							   + "<td id='cal4'>" + "</td>"
							   + "<td id='cal5'>" + "</td>"
							   + "<td id='cal6'>" + "</td>"
							   + "<td id='cal7'>" + "</td>"
							   + "</tr>"
							   + "<tr>"
							   + "<td id='cal8'>" + "</td>"
							   + "<td id='cal9'>" + "</td>"
							   + "<td id='cal10'>" + "</td>"
							   + "<td id='cal11'>" + "</td>"
							   + "<td id='cal12'>" + "</td>"
							   + "<td id='cal13'>" + "</td>"
							   + "<td id='cal14'>" + "</td>"
							   + "</tr>"
							   + "<tr>"
							   + "<td id='cal15'>" + "</td>"
							   + "<td id='cal16'>" + "</td>"
							   + "<td id='cal17'>" + "</td>"
							   + "<td id='cal18'>" + "</td>"
							   + "<td id='cal19'>" + "</td>"
							   + "<td id='cal20'>" + "</td>"
							   + "<td id='cal21'>" + "</td>"
							   + "</tr>"
							   + "<tr>"
							   + "<td id='cal22'>" + "</td>"
							   + "<td id='cal23'>" + "</td>"
							   + "<td id='cal24'>" + "</td>"
							   + "<td id='cal25'>" + "</td>"
							   + "<td id='cal26'>" + "</td>"
							   + "<td id='cal27'>" + "</td>"
							   + "<td id='cal28'>" + "</td>"
							   + "</tr>"
							   + "<tr>"
							   + "<td id='cal29'>" + "</td>"
							   + "<td id='cal30'>" + "</td>"
							   + "<td id='cal31'>" + "</td>"
							   + "<td id='cal32'>" + "</td>"
							   + "<td id='cal33'>" + "</td>"
							   + "<td id='cal34'>" + "</td>"
							   + "<td id='cal35'>" + "</td>"
							   + "</tr>"
							   + "<tr>"
							   + "<td id='cal36'>" + "</td>"
							   + "<td id='cal37'>" + "</td>"
							   + "<td id='cal38'>" + "</td>"
							   + "<td id='cal39'>" + "</td>"
							   + "<td id='cal40'>" + "</td>"
							   + "<td id='cal41'>" + "</td>"
							   + "<td id='cal42'>" + "</td>"
							   + "</tr>";
							   
			calendar.innerHTML = calendarHTML;
			
			for(var i = 1; i < endDay + 1; i++){
				document.getElementById("cal" + (startWeek + i - 1)).innerText = i;
			}
			
			for(var i = 1; i < 42; i++){
				var calDay = document.getElementById("cal" + i);
				console.dir(calDay);
				if(calDay.innerText == ""){
					calDay.height = "0px";
				} else{
					calDay.height = "150px";
				}
				
				console.dir(calDay);
			} 
		})
	
	
	</script>
</body>
</html>