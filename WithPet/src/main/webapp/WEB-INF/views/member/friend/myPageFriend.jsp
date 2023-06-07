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
	
	.marginLeft400px{
		margin-left : 400px;
	}
	
	.marginLeft40px{
		margin-left : 40px;
	}
	
	.marginTop30px{
		margin-top : 30px;
	}
	
	.memberProfile{
		background-color : #dee2e6;
		border-radius: 100px;
	}
	
	.marginTop0px{
		margin-top : 0px;
	}
	
	.marginBotton20px{
		margin-bottom : 20px;
	}




</style>
</head>
<body>

	<jsp:include page="../../common/myPageSide.jsp" />

	<div id="body">
			<div id="mainmain">
				
				<table id="naviTable">
					<tr>
						<th class="thWidth"><h2 class="marginLeft40px marginTop30px">친구 목록</h3></th>
						<th class="thWidth" align="right"><button class="marginLeft400px marginTop30px btn btn-success">친구추가</button></th>
					</tr>
				</table>						
					<br>
					<c:choose>
						<c:when test="${ not empty friendList }">
							<table class="table table-hover" id="mainTable">
	
								  <tbody align="center">
								  	
										<tr>
										<th scope="row">
											<c:forEach items="${friendList}" var="i">
											<td>
												<div class="memberProfile">
													<img id="memberimg" src="resources/myPage/user.png" alt="">
													<p class="marginTop0px">아이디 : ${ i.memId }</p>
													<p class="marginTop0px">닉네임 : ${ i.memNick }</p>
													<table>
														<tr align="center">
															<td><button class="btn btn-success marginBotton20px">쪽지</button></td>
													 		<td><button class="btn btn-success marginBotton20px">채팅</button></td>
													 	</tr>
														<tr>
															<td><button class="btn btn-success">일정공유</button></td>
															<td><button class="btn btn-success">친구 삭제</button></td>
															
														</tr>
													</table>
													<br>
														<input type="hidden" id="${i.memId}" name="friend" value="${i.memId}" />	
												</div>
											</td>
											</c:forEach>
										</th>
										
										</tr>
									
								  </tbody>
						</table>
	
						<table id="foogg">
							<thead>
								<tr align="center">
									<th style="width : 50%;">
										<c:choose>
		                					<c:when test="${ pi.currentPage eq 1 }">
		                   						<button class="btn btn-success">&lt</button>
		                					</c:when>
		                					<c:otherwise>
		                						<button class="btn btn-success" onclick="memberBoard('${pi.currentPage-1}');">&lt</button>
		                					</c:otherwise>
			                				</c:choose>
			                   				<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
			                   					 <button class="btn btn-success" onclick="memberBoard('${p}');">${ p }</button>
			                    			</c:forEach>
			                    			<c:choose>
		                					<c:when test="${ pi.currentPage eq pi.maxPage }">
		                   						<button class="btn btn-success">&gt</button>
				                			</c:when>
					                		<c:otherwise>
					                			<button class="btn btn-success" onclick="memberBoard('${pi.currentPage+1}');">&gt</button>
					                		</c:otherwise>
					                	</c:choose>
					                </th>
					                <th>
					                	<form action="friendSearch" method="post">
					                		친구 검색 : <input	type="text" name="friendSearch" />  <button class="btn btn-success">검색</button>
					                		<input type="hidden" name="memberId" value="${loginMember.memId}" />
					                	</form>
					                </th>
					            </tr>
							</thead>
						</table>
					</c:when>
					
				</c:choose>
				
				<form action="" method="post" id="boardPostForm">
			         <input type="hidden" name="memberId" value="${ loginMember.memId }"/>
			         <input id="hidden-page" type="hidden" name="mPage" value="1"/>
			          <input id="menuPage" type="hidden" name="menuPage" value=""/>
			    </form>
			    
			   
			    
			    <script>
					var menuNum = ${number};	
			    
			    	function boardMenu(num){
			    		console.log(num);
			    		switch(num){
							case 1 :  $('#boardPostForm').attr('action', 'myPage').submit(); break;
							case 2 :  $('#boardPostForm').attr('action', 'myPageReply').submit(); break;
							case 3 :  $('#boardPostForm').attr('action', 'myPageLike').submit(); break;
							case 4 :  $('#boardPostForm').attr('action', 'myPage').submit(); break;
							case 5 :  $('#boardPostForm').attr('action', 'myPageDelete').submit(); break;
						};
			    	};
			    
					function memberBoard(num){
						switch(menuNum){
							case 1 :$('#hidden-page').val(num); $('#boardPostForm').attr('action', 'myPage').submit(); break;
							case 2 :$('#hidden-page').val(num); $('#boardPostForm').attr('action', 'myPageReply').submit(); break;
							case 3 :$('#hidden-page').val(num); $('#boardPostForm').attr('action', 'myPageLike').submit(); break;
							case 4 :$('#hidden-page').val(num); $('#boardPostForm').attr('action', 'myPage').submit(); break;
							case 5 :$('#hidden-page').val(num); $('#boardPostForm').attr('action', 'myPageDelete').submit(); break;
						};
					};
				</script>
			</div>
	</div>		
	
	<div id="mypageFooter"><jsp:include page="../../common/footer.jsp" /></div>
	
</body>
</html>