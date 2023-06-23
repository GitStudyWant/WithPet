<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<style>

	body{
		padding: 0px! important;
	}
	
	#body{
		height: 1000px;
		width: 100%;
		background-color:white;
		box-sizing: border-box;
		position:absolute;
		margin-left:15%;
	}
	
	#mypageFooter{
		margin-top:1000px;
	}

	#mainSi{
		width : 20%;
		height : 1000px;
		display: inline-block;	
		float:left;
	}

	#mainmain{
		
		width : 75%;
		height : 1000px;
		display: inline-block;	
		float:left;
	}

	#mainTable{
		border-top: 1px solid #dee2e6;
		height : 750px;
		position : relative;
	}

	#mainTable p{
		margin-top: 10px;
	}

	#naviTable{
		width : 100%;
		height : 100px;
		border-bottom : 1px solid #dee2e6;
	}

	#naviTable td{
		text-align: right;
	}

	.thHigh{
		height : 120px;
		font-size: 25px;
	}
	.thHigh:hover{
		color:rgb(73, 166, 112);
	}

	.width10{
		width : 10%;
	}
	#boardList{
		border-top : 1px solid #dee2e6;
	}
	#boardList tr{
		height : 60px;
	}
	#boardList>tbody p{
		margin-bottom: 0px;
		margin-top : 10px;
	}

	#foogg{
		width : 100%;
        height : 65px;
        margin-top :30px;
        border-top : 1px soild #dee2e6;
	
        
	}

    #foogg>thead>tr{
        width: 25%;
    }

	.inCheck{
		width :20px;
		height: 20px;
		margin-right: 40px;
	}
	
	.thWidth{
		width: 50%;
	}
	
	
	.marginLeft40px{
		margin-left : 40px;
	}
	
	.marginTop30px{
		margin-top : 30px;
	}
	
	.memberProfile{
		width : 25%;
		height : 40%;
		background-color : #dee2e6;

		border-radius: 100px;
		display : inline-block;
		margin-left : 40px;
		margin-top : 20px;
	}
	
	.marginTop0px{
		margin-top : 0px;
	}
	
	.marginBotton20px{
		margin-bottom : 20px;
	}
	
	 #friendImg{
        width: 30%;
        height : 30%;
        border-radius: 100px;
        margin-top: 30px;
    }

	#buttonTable tbody{
		border-bottom: 0px;
	}
	
	#resultSearch{
		width : 400px;
		height : 500px;
		border-radius : 10px;
		background-color : #dee2e6;
		z-index: 100;
		top : -100px;
		left : 0px;
		right : 0px;
		bottom : 0px;
		margin : auto;
		position: absolute;		
		
	}
	
	.btn-Size{
		width: 90px;
		height: 40px;
		padding-left : 0px !important;
		padding-right : 0px !important;
	}
	
	.statusBtn{
		width : 90px;
		height : 35px;
		margin-top : 10px;
	}
	
	.detail{
		width : 100%;
		height : 900px;
	}
	
	.detail>table{
		margin-left : 10px;
	}
	
	.detail>h2{
		margin-left : 10px;
	}
	
	.text-alignC{
		text-align: center;
	}
	.text-alignL{
		text-align: left;
	}
	.text-alignR{
		text-align: right;
	}
	
	.tr-td-70pxsize{
		width : 70px;
	}
	.inquiryTable{
		width : 100%;
		height : 40%;
		border-style : 1px soide #dee2e6 !important;
	}
	
	#chattingList{
		width : 40%;
		height : 800px;
		border : 1px solid #dee2e6;
		display : inline-block;
		margin-left : 50px;
		border-radius: 10px;
		margin-top : 50px;
	}
	
	#chattingRoom{
		width : 40%;
		height : 800px;
		border : 1px solid #dee2e6;
		display : inline-block;
		margin-left : 50px;
		border-radius: 10px;
		display : none;
		margin-top : 50px;
		margin-right : 50px;
		float : right;
	}

	.text-alignC{
		text-align: center;
		margin-bottom :0px;
	}

	#chattingListTable{
		width: 100%;
		height :100%;
	}
	.trSize{
		width: 100%;
		height: 10%;
	}
	#chattingListTable td{
		border-bottom: 1px solid #dee2e6;
	}
	.noBorder{
		border-bottom: 0px !important;
		text-align: center;
	}

	.tdSize2{
		height: 20%;
	}

	.tdSize3{
		width : 30%;
	}

	.userImg{
		width: 100%;
		height: 100%;
		border-radius: 100px;
		margin-left: 10px;
		border: 1px solid #dee2e6;
	}

	.userImg2{
		width: 50px;
		height: 50px;
		border-radius: 100px;
		margin-left: 10px;
		margin-right: 20px;
		border: 1px solid #dee2e6;
	}

	.tablechat p{
		margin-bottom: 0px !important;
	}
	
	.msgDiv{
		border :1px solid black;
	}
	
	.chatMain{
		width: 100%;
		height : 10% !important;
		border-bottom : 1px solid #dee2e6;
		text-align: center;
		background-color: rgb(73, 166, 112);
		border-radius: 10px;
	}

	.chatContent{
		width: 100%;
		height: 75%;
		border-bottom : 1px solid #dee2e6;
	}

	.chatSend{
		width: 100%;
		height : 15%;
		border-bottom : 1px solid #dee2e6;
	}
	
	#chatTable{
		width : 100%;
		height : 100%;
		border-radius: 10px;
	}
	
	#allChat-input{
		width : 70%;
		height : 70%;
		margin-left : 10px;
		border-radius: 10px;
	}
	
	.msgMy{
		text-align: right;
		border: 1px solid #dee2e6;
		margin-top : 5px;
		border-radius: 10px;
	}
	.message-wrap{
		overflow-y:scroll;
		height: 100%;
	}

	.msgOther{
		text-align: left;
		border: 1px solid #dee2e6;
		margin-top : 5px;
		border-radius: 10px;
	}

	#outButton{
		border-radius: 10px;
		background-color: aliceblue;
	}
	
	.oneChatScroll{
		overflow-y:scroll;
		height: 100%;
	}

	.oneChatTr{
		height: 100px;
	}

	.tdUserImg{
		width: 20%;
	}

	.tdUserChat{
		width: 80%;
	}
</style>
</head>
<body>

	<jsp:include page="../../common/myPageSide.jsp" />
	<jsp:include page="../modal/memberChattingModal.jsp" />
	<div id="body">
			<div id="mainmain">
				<table id="naviTable">
					<tr>
						<td class="thWidth"><h2 class="marginLeft40px marginTop30px" align="left">채팅</h2></td>
						<td class="thWidth" align="right"><a class="marginTop30px btn btn-success" data-bs-toggle="modal" data-bs-target="#chattingFind">1대1 채팅하기</a></td>
					</tr>
				</table>						
					<div id="detail">
						<div id="chattingList" class="oneChatScroll">
							<table id="chattingListTable">
									<tr class="trSize">
										<td>
											<h3 class="text-alignC">채팅방 목록</h3>
											<p class="text-alignC">withPet</p>
										</td>
									</tr>
									<tr>
										<td class="text-alignC"><b>참여 가능한 전체 채팅방</b></td>
									</tr>
									<tr>
										<td class="tdSize2" onclick="allChatting();">
											<div class="text-alignC">
												<table class="text-alignC">
													<tr>
														<td rowspan="3" class="tdSize3 noBorder"><img class="userImg" src="resources/myPage/user.png" alt=""></td>
														<td class="noBorder"><h3>전체 채팅방입니다.</h3></td>
													</tr>
													<tr>
														<td class="noBorder"><p>마지막 대화 : ${lastChat.chatContent}</p></td>
													</tr>
												</table>
											</div>
										</td>
									</tr>
									<tr>
										<td class="text-alignC"><b >현재 참여 가능한 1대1 채팅방 목록</b></td>
									</tr>
										<c:choose>
											<c:when test="${ not empty oneChatList }">
												<c:forEach items="${oneChatList}" var="one">
													<tr class="oneChatTr">
														<td>
															<table class="text-alignC tablechat" onclick="oneChatting('${one.oneChatNo}');">
																<tr>
																	<td rowspan="2" class="tdSize3 noBorder tdUserImg"><img class="userImg2" src="resources/myPage/user.png" alt=""></td>
																	<c:choose>
																		<c:when test="${one.memberOne != loginMember.memId}">
																			<td class="noBorder tdUserChat"><b>${one.memberOne}와의 1대1 채팅방</b></td>
																		</c:when>
																		<c:otherwise>
																			<td class="noBorder tdUserChat"><b>${one.memberTwo}와의 1대1 채팅방</b></td>
																		</c:otherwise>
																	</c:choose>
																</tr>
																<tr>
																	<td class="noBorder tdUserChat"><p>마지막 채팅 : ${one.oneChatContent}</p></td>
																</tr>
															</table>
														</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td>
														<table class="text-alignC tablechat">
															<tr>
																<td rowspan="2" class="tdSize3 noBorder"></td>
																<td class="noBorder"><b>채팅방이 존재하지 않습니다.</b></td>
															</tr>
														</table>
													</td>
												</tr>
											</c:otherwise>
										</c:choose>
							</table>
						</div>
			    		<div id="chattingRoom">
			    			<table id="chatTable">
			    				<tr class="chatMain">
			    					<td><h4 id="chatNavi">전체 채팅방</h4> <button align="right" id="outButton" onclick="disconnect();">채팅방 나가기</button></td>
			    				</tr>
			    				<tr class="chatContent">
			    				
			    					<td>
				    					<div class="message-wrap">
				    						
				    					</div>
			    					</td>
			    				</tr>
			    				<tr class="chatSend">
			    					<td>
				    					<input type="text" id="allChat-input" name="content" onKeypress="javascript:if(event.keyCode==13){send();}"/>
				    					<button onclick="send()" class="btn btn-success">전송</button>
				    				</td>
			    				</tr>
			    				
			    			</table>
			    		</div>
						<form action="" method="post" id="oneChatForm">
							<input type="hidden" id="memberId" name="memberId" value="${ loginMember.memId }"/>
							<input id="hidden-page" type="hidden" name="mPage" value="1"/>
							 <input id="friendId" type="hidden" name="friendId" value=""/>
					   </form>
			    
			    <script>
			    var nickName;
				var socket;

				function allChatting(){
					if(window.confirm('해당 채팅방에 접속하시겠습니까?')){
						$.ajax({
							url : 'allChattingInsert.me',
							data : {memberId : '${loginMember.memId}' },
							type : 'post',
							success : function (result){
								console.log(result);
								if(result != null){
									$('#chattingRoom').css('display', 'inline-block');
									$('#chatNavi').text('전체 채팅방입니다.');
									var div = "";
									for(let i in result){
										if(result[i].memberId == '${loginMember.memId}'){
									 		div += '<div class="msgMy">'+result[i].memberId +'<br>'+ result[i].chatContent +'</div>';
										}else{
											div += '<div class="msgOther">'+result[i].memberId +'<br>'+ result[i].chatContent +'</div>';
										}
									}
									$('.message-wrap').html(div);
									allConnect();
									$('.message-wrap').scrollTop($('.message-wrap')[0].scrollHeight);
								}else{
									var div = $('<div class="msgDiv">아직 채팅이 존재하지 않습니다!</div>');
									$('.message-wrap').append(div);
								}
							},
							error : function (){
								console.log('실패');
							}
						});
					}
				}
				
				function allConnect(){
					nickName = '${loginMember.memId}';
					
					console.log(socket);
					var uri = 'ws://localhost:8787/withpet/gp';
				
					if(socket == undefined){
					socket = new WebSocket(uri);
					}
					socket.onopen = () => {// 소켓이 열리면 호출되는 핸들러
						console.log('서버와 연결되었습니다!');	
					}
					
					socket.onclose = () => {
						console.log('접속이 종료되었습니다!');
					}
					
					socket.onerror = e => {
						console.log('서버와 연결과정에서 문제가 발생했습니다.');
						console.log(e);
					}
					
					socket.onmessage = e => {
						let test = e.data;
						test = test.split(":");
						if(test[0] == '${loginMember.memId}'){
							var div = $('<div class="msgMy"></div>');
						} else{
							var div = $('<div class="msgOther"></div>');
						};
						div.html(test[0] + '<br>' + test[1]);
						$('.message-wrap').append(div);
						$('.message-wrap').scrollTop($('.message-wrap')[0].scrollHeight);
					}
					
				}
				
				function disconnect(){
					if(window.confirm('해당 채팅방에서 나가시겠습니까?')){
							socket.close();
							$('#chattingRoom').css('display', 'none');
						}
					
				}
				
				function send(){
					let text = $('#allChat-input').val();
					let memberId = '${loginMember.memId}';
					
					socket.send(memberId + ':' + text);
					$('#allChat-input').val('');
				}







				function oneChatting(oneChatNo){
					if(window.confirm('해당 채팅방에 접속하시겠습니까?')){
						$.ajax({
							url : 'oneChattingSelect.me',
							data : {oneChatNo : oneChatNo}
								   ,
							type : 'post',
							success : function (result){
								console.log(result);
								if(result != null){
									$('#chattingRoom').css('display', 'inline-block');
									$('#chatNavi').text('유저 채팅방입니다.');
									var div = "";
									for(let i in result){
										if(result[i].memberId == '${loginMember.memId}'){
									 		div += '<div class="msgMy">'+result[i].memberId +'<br>'+ result[i].oneChatContent +'</div>';
										}else{
											div += '<div class="msgOther">'+result[i].memberId +'<br>'+ result[i].oneChatContent +'</div>';
										}
									}
									$('.message-wrap').html(div);
									
									oneConnect(oneChatNo);
									$('.message-wrap').scrollTop($('.message-wrap')[0].scrollHeight);
								}else{
									var div = $('<div class="msgDiv">아직 채팅이 존재하지 않습니다!</div>');
									$('.message-wrap').append(div);
								}
							},
							error : function (){
								console.log('실패');
							}
						});
					}
				}
				
				function oneConnect(oneChatNo){
					nickName = '${loginMember.memId}';
					
					console.log(socket);
					var uri = 'ws://localhost:8787/withpet/one?chat='+ oneChatNo + '&style=asd';
				
					if(socket == undefined){
					socket = new WebSocket(uri);
					}
					socket.onopen = () => {// 소켓이 열리면 호출되는 핸들러
						console.log('서버와 연결되었습니다!');	
						//register();
					}
					
					socket.onclose = () => {
						console.log('접속이 종료되었습니다!');
					}
					
					socket.onerror = e => {
						console.log('서버와 연결과정에서 문제가 발생했습니다.');
						console.log(e);
					}
					
					socket.onmessage = e => {
						console.log(e.data);
						let test = e.data;
						test = test.split(":");
						if(test[0] == '${loginMember.memId}'){
							var div = $('<div class="msgMy"></div>');
						} else{
							var div = $('<div class="msgOther"></div>');
						};
						div.html(test[0] + '<br>' + test[1]);
						$('.message-wrap').append(div);
						$('.message-wrap').scrollTop($('.message-wrap')[0].scrollHeight);
					}
					
				}
				
				

				
				</script>
					<c:if test="${ not empty onChat }">
						<script>
								oneChatting('${onChat.oneChatNo}');
						</script>
						<c:remove var="onChat" scope="session"/>
					</c:if>
				   </div>
			</div>
	</div>		
	
	<div id="mypageFooter"><jsp:include page="../../common/footer.jsp" /></div>
	
</body>
</html>