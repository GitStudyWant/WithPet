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
		height : 900px;
		position : relative;
	}

	#mainTable p{
		margin-top: 10px;
	}

	#naviTable{
		width : 100%;
		height : 100px;
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




</style>
</head>
<body>

	<jsp:include page="../../common/myPageSide.jsp" />
	<jsp:include page="../modal/memberFriendModal.jsp" />
	<div id="body">
			<div id="mainmain">
				
				<table id="naviTable">
					<tr>
						<td class="thWidth"><h2 class="marginLeft40px marginTop30px" align="left">친구 목록</h3></td>
						<td class="thWidth" align="right"><button class="marginTop30px btn btn-success" data-bs-toggle="modal" data-bs-target="#friendFind">친구추가</button></td>
					</tr>
				</table>						
					<br>
					<c:choose>
						<c:when test="${ not empty friendList }">
							<div class="table table-hover" id="mainTable" align="center">
								<div id="result"></div>
							<c:forEach items="${friendList}" var="i">
								<div class="memberProfile" align="center">
									<img id="friendImg" src="resources/myPage/user.png" alt="">
									<p class="marginTop0px">아이디 : ${ i.memId }</p>
									<p class="marginTop0px">닉네임 : ${ i.memNick }</p>
									<table id="buttonTable">
										<tr align="center">
											<td><button class="btn btn-success marginBotton20px btn-Size" onclick="goMemo('${i.memId}');">쪽지</button></td>
											<td></td>
											<td><button class="btn btn-success marginBotton20px btn-Size" onclick="oneChatInsert('${i.memId}');">채팅</button></td>
										</tr>
										<tr>
											<c:choose>
											<c:when test="${i.friendShare eq 1 }">
												<td><button class="btn btn-success btn-Size" onclick="sharingCancellation('${i.memId}');">공유중</button></td>
											</c:when>
											<c:otherwise>
												<td><button class="btn btn-success btn-Size" onclick="freindSharing('${i.memId}');">일정공유</button></td>
											</c:otherwise>
											</c:choose>
											<td></td>
											<td><button class="btn btn-success btn-Size" onclick="friendDelete('${i.memId}');">친구삭제</button></td>
											
										</tr>
									</table>
									<br>
								</div>
							</c:forEach>
							
						
						<table id="foogg">
							<thead>
								<tr align="right">
									<th style="width : 50%;">
										<c:choose>
		                					<c:when test="${ pi.currentPage eq 1 }">
		                   						<button class="btn btn-success">&lt</button>
		                					</c:when>
		                					<c:otherwise>
		                						<button class="btn btn-success" onclick="friendPage(${pi.currentPage-1});">&lt</button>
		                					</c:otherwise>
			                				</c:choose>
			                   				<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
			                   					 <button class="btn btn-success" onclick="friendPage(${p});">${ p }</button>
			                    			</c:forEach>
			                    			<c:choose>
		                					<c:when test="${ pi.currentPage eq pi.maxPage }">
		                   						<button class="btn btn-success">&gt</button>
				                			</c:when>
					                		<c:otherwise>
					                			<button class="btn btn-success" onclick="friendPage(${pi.currentPage+1});">&gt</button>
					                		</c:otherwise>
					                	</c:choose>
					                </th>
					                <th>
					                		친구 검색 : <input	type="text" id="friendSearch" name="friendSearch" />  <button class="btn btn-success" onclick="friendSearch('${loginMember.memId}');">검색</button>
					                </th>
					            </tr>
							</thead>
						</table>
					</c:when>
					
				</c:choose>
				</div>
				<form action="" method="post" id="friendForm">
			        <input type="hidden" id="memberId" name="memberId" value="${ loginMember.memId }"/>
			        <input id="hidden-page" type="hidden" name="mPage" value="1"/>
			        <input id="friendId" type="hidden" name="friendId" value=""/>
					<input id="memoDetailSender" type="hidden" name="memoDetailSender"/>
			    </form>
			    
			 
			    
			    <script>
			    	function goMemo(memId){
			    		$('#memoDetailSender').val(memId); $('#friendForm').attr('action', 'replyMemo').submit();
			    	}
			    	
					function friendPage(num){
							console.log(num);
							$('#hidden-page').val(num); $('#friendForm').attr('action', 'myPageFriend.me').submit();
					};
					
					function friendSearch(memId){
						$.ajax({
							url : 'friendSearch.me',
							data : {
								memberId : memId,
								friendSearch : $('#friendSearch').val()
							},
							type : 'post',
							success : function(result){
								console.log(result);
								if(result === '없음'){
									alert('검색하신 친구가 존재하지 않습니다!');
								} else{
									var btn = '';
									if(result.friendShare > 0){
										btn = '<td><button class="btn btn-success btn-Size" id="share" onclick="sharingCancellation('+ result.memId + ');">공유중</button></td>';
									} else{
										btn = '<td><button class="btn btn-success btn-Size" id="noShare" onclick="freindSharing('+ result.memId + ');">일정공유</button></td>';
									}
									var value = '';
									value += '<div id="resultSearch">'
										 + '<div align="right"><b onclick="searchCancel();">X</b></div>' 
										 + '<img id="friendImg" src="resources/myPage/user.png" alt="">'
									 	 + '<p class="marginTop0px" id="searchId">아이디 : '+ result.memId +'</p>'
									     + '<p class="marginTop0px" id="searchNick">닉네임 : '+ result.memNick +'</p>'
									     + '<table id="buttonTable">'
										 + '<tr align="center">'
										 +	'<td><button class="btn btn-success marginBotton20px btn-Size">쪽지</button></td>'
										 +	'<td></td>'
										 + '<td><button class="btn btn-success marginBotton20px btn-Size">채팅</button></td>'
										 + '</tr>'
										 + '<tr>'
										 + btn
										 + '<td></td>'
										 + '<td><button class="btn btn-success btn-Size" onclick="friendDelete('+ result.memId + ');">친구 삭제</button></td>'
										 + '</tr>'
									     + '</table>'
									     + '<br>'
									     + '</div>'	;
									$('#mainTable').html(value);
								}
							},
							error : function(){
								console.log("실패");
							}
						});
					};

					function searchCancel(){
						location.href = location.href;
					}
					
					function freindSharing(memId){
						if(window.confirm('일정을 공유하시겠습니까?')){
							$('#friendId').val(memId); $('#friendForm').attr('action', 'freindSharing.me').submit();
						} else{
							alert('취소하셨습니다.');
						}
					}
					
					function sharingCancellation(memId){
						if(window.confirm('일정을 공유를 취소하시겠습니까?')){
							$('#friendId').val(memId); $('#friendForm').attr('action', 'sharingCancellation.me').submit();
						} else{
							alert('취소하셨습니다.');
						}
					}
					
					function friendDelete(memId){
						const friDelete = window.prompt('친구를 삭제하시려면 "삭제하겠습니다." ""안에 있는 문자를 똑같이 입력해주세요.');
						if(friDelete === '삭제하겠습니다.'){
							$('#friendId').val(memId); $('#friendForm').attr('action', 'friendDelete.me').submit();
						} else{
							alert('잘못 입력하셨습니다.');
						}
			
					}
					
					
				</script>
			</div>
	
	<div id="mypageFooter"><jsp:include page="../../common/footer.jsp" /></div>
	
</body>
</html>