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

	#shceduleSi{
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
			<div id="scheduleSi"><jsp:include page="../../common/myPageSide.jsp" /></div>
			<div id="schedulemain">
				<table>
				</table>
				dsafsd
				${test}
			</div>
	</div>		

	
	<jsp:include page="../../common/footer.jsp" />
	
</body>
</html>