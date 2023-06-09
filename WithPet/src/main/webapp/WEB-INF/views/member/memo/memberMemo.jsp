<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

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
	
	#diaryFooter{
		margin-top:1000px;
	}
	
	#body>p{
		margin-top:15px;
		text-align:center;
		font-size:35px;
	}

	#schedulemain{
		width : 100%;
		height : 1000px;
		padding-top : 15px;
		float:left;
	}
	
	#memomain p{
		font-size:25px;
		margin-left:60px;
	}
	
	#memomain a{
		color:black;
		text-decoration:none;
	}
	
	#memokind{
		width : 100%;
		text-align : center;
		font-size  : 20px;
	}
	
	#memokind td{
		border-left :  1px silver solid; 
		border-right : 1px silver solid; 
	}
	
	#memolist{
		width : 95%;
		text-align : center;
		margin : auto;
	}
	
	td[class="memolisthead"]{
		background-color : lightgray;
		border : 1px solid silver;
	}
	
	#memoetc{
		width : 95%;
		margin : auto;
	}

</style>
</head>
<body>
	<div id="memoSide"><jsp:include page="../../common/myPageSide.jsp" /></div>
	<div id="memoSendback"><jsp:include page="../../common/sendBack.jsp" /></div>
	
	<div id="body">	
		    <div id="memomain">
		    <br>
		    <p>[${ loginMember.memNick }] 님의 쪽지</p>
		    <br><br><br>
		    
		    <hr>
		    <table id="memokind">
		    	<tr>
		    		<td><a href="asd">받은쪽지함</a></td>
		    		<td><a href="asd">보낸쪽지함</a></td>
		    		<td><a href="asd">새 쪽지</a></td>
		    	</tr>
		    </table>
		    <hr>
		    <br><br>
		    
		    <table id="memolist" >
		    	<th>
		    		<td class="memolisthead"><input type="checkbox"></td>
		    		<td class="memolisthead">보낸사람</td>
		    		<td class="memolisthead">제목</td>
		    		<td class="memolisthead">발송시간</td>
		    		<td class="memolisthead">읽음확인</td>
		    	</th>
		    </table>
		    
		    <br><br>
		    
		    <table id="memoetc">
		    	<tr>
		    		<td colspan="3">
		    		<button class="btn btn-danger" style="width:8%; height:30px; display:flex; align-items: center; justify-content: center;">삭제</button>
		    		</td>
		    	</tr>
		    	<tr>
		    		<td width="30%" align="center">제목</td>
		    		<td width="30%" align="center">발송시간</td>
		    		<td width="30%" align="center">읽음확인</td>
		    	</tr>
		    </table>
		
		        
		    
	<div id="diaryFooter"><jsp:include page="../../common/footer.jsp" /></div>
	
</body>
</html>