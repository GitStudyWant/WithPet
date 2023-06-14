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

	#memomain{
		width : 100%;
		height : 1000px;
		padding-top : 15px;
		float:left;
	}
	
	#memotitle{
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
	
	#newMemoTable p{
		height: 50px;
		text-align : left;
		font-size: 20px;
		margin : 0px;
		display : flex;
		align-items:center;
		font-weight:bold;
	}
	
	#newMemoTable input{
		width : 60%;
	}

</style>
</head>
<body>
	<div id="memoSide"><jsp:include page="../../common/myPageSide.jsp" /></div>
	<div id="memoSendback"><jsp:include page="../../common/sendBack.jsp" /></div>
	
	<div id="body">	
		    <div id="memomain">
		    <br>
		    <p id="memotitle">[${ loginMember.memNick }] 님의 쪽지</p>
		    <br><br>
		    
		    <hr>
		    <table id="memokind">
		    	<tr>
		    		<td><a href="receiveMemo">받은쪽지함</a></td>
		    		<td><a href="sendMemo">보낸쪽지함</a></td>
		    		<td><a href="newMemo">새 쪽지</a></td>
		    	</tr>
		    </table>
		    <hr>
		    <br><br><br>
		    
		    <form action="insertMemo" method="get">
		    <table id="newMemoTable" style="margin:auto">
		    		<input class="newMemoIssue" id="newMemoSender" name="memoSender" type="hidden">
				    <tr><td><p>수신인</p><td></tr>
				    <tr><td><input class="newMemoIssue" id="newMemoReceiver" name="memoReceiver" type="text"></td></tr>
				    <tr><td><p>쪽지제목</p></td></tr>
				    <tr><td><input class="newMemoIssue" id="newMemoTitle" name="memoTitle" type="text"></td></tr>
				    <tr><td><p>내용</p></td></tr>
				    <tr><td>
				    <fieldset>
				    	<textarea class="newMemoIssue" id="newMemoContent" name="memoContent" style="width:400px; height:200px; resize:none"></textarea>
				    </fieldset>
				    </td></tr>
		    </table>
		    <br><br>
		    <div style="width:20%; margin:auto"><p style="text-align:center; font-size:12px">남은 쪽지 횟수 : ${ loginMember.memMemo }번</p></div>
		    <div style="width:10%; margin:auto"><button class="btn btn-primary" id="sendButton" style="width:100%;">보내기</button></div>
		    <br>
		    <div style="width:10%; margin:auto"><button class="btn btn-secondary" style="width:100%;">예약발송</button></div>
		    </form>
		</div>
	</div>    
		    
	<div id="diaryFooter"><jsp:include page="../../common/footer.jsp" /></div>
	
	<script>
	
	$(function(){
		
		$('#newMemoSender').val('${ loginMember.memId }');
		
		if(${Receiver != null} ){
			$('#newMemoReceiver').val('${Receiver}');
			$('#newMemoReceiver').text('${Receiver}');
		}
		
		if(${ loginMember.memMemo <= 0}){
			$('#sendButton').prop("disabled", true);
		}
		
	})
	
	
	
	</script>
	
</body>
</html>