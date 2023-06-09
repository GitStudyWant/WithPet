<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 예약 조회</title>
 
<style>

	body{
		padding: 0px! important;
	}
	
	#body{
		width: 85%;
		height: 1000px;
		background-color:white;
		box-sizing: border-box;
		position:absolute;
		float:left;
		margin-left:15%;
		
	}

	#body>p{
		margin-top:15px;
		text-align:center;
		font-size:35px;
	}
	
	#mypageFooter{
		margin-top:1000px;
	}



</style>
</head>
<body>
<jsp:include page="../../common/myPageSide.jsp" />
	
	<div id="body">	
		    <p>내 예약 조회</p>
		    <hr>
		    <div id="myReservationmain">
		    <div class="container" style="width:75%;">

		        <div id="wrapper">
		         
		        </div>
			</div>
		</div>
	</div>
	
	
	

<div id="mypageFooter"><jsp:include page="../../common/footer.jsp" /></div>

</body>
</html>