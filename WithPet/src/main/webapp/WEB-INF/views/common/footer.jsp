<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        #footer_1{
            width : 100%;
            height : 70px;
            background-color: rgb(73, 166, 112);
            color: white;
        }

        .btag-fontSize{
            font-size: large;
        }
        .bin{
            width :100%;
            height : 22px;
        }
    </style>
</head>
<body>
    <div id="footer">
        <div id="footer_1" align="center">
            <div class="bin"></div>
            <b class="btag-fontSize">회사소개 제휴제안 이용약관 개인정보처리방침 크리에이터 신청</b>
        </div>
    </div>
    
   	<script>
   	if(${ (!(empty loginMember))} && ${empty clear}){
	    $(function(){		    	
	    	socketConnect();
	    	
	    	setInterval(function(){
	    		if(true){
	    			socketReceive();
	    		}
	    		
	    	}, 3000)
	    })
   	};
   	</script>
   
    <c:if test="${not empty clear}">
		<script>
		socket.close();
		</script>
		<c:remove var="clear" scope="session"/>
	</c:if>

    <script>
    
    var socket;
    
    
    
    function socketConnect(){
    	var uri = 'ws://localhost:8787/withpet/memo';
		socket = new WebSocket(uri);
    	
		socket.onopen = () => {
			console.log('서버와 연결되었습니다!');
		}
		socket.onclose = () => {
			console.log('접속이 종료되었습니다!');
		}
		socket.onerror = (error) => {
			console.log('서버와 연결과정에서 문제가 발생했습니다');
			console.log(error);
		}
		socket.onmessage = e => {
			updateloginMemberMemo(e.data);
		}
		
    }
    
    function socketDisconnect(){
		socket.close();
	}
    
    function socketReceive(){
    	socket.send('${loginMember.memId}');	
	}
    
    function updateloginMemberMemo(memMemo){
    	
    	if(memMemo != 0){
    		$('#memoBellMain').css("display", "inline-block");
    	} else {
    		$('#memoBellMain').css("display", "none");
    	}
    	
    	$.ajax({
    		url : "updateloginMemberMemo",
    		type : "get",
    			data : {memMemoSend : memMemo},
    		success : function(result){
    			if(($('#memoBell').text() != "") && ($('#memoBell').text() < memMemo)){
    				$('#memoBell').text(memMemo);
    				if(${loginMember.memPopup == 'Y'}){
    						$('#liveToastBtn').click();
    				}
    			} else if(($('#memoBell').text() != "") && ($('#memoBell').text() > memMemo)){
    				$('#memoBell').text(memMemo);
    			}
    		}
    	})
    }
    
    </script>

</body>
</html>