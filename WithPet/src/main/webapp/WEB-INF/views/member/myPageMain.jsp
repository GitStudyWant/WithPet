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
		height : 150px;
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




</style>
</head>
<body>

	<jsp:include page="../common/myPageSide.jsp" />
	<jsp:include page="../member/modal/memberMainModal.jsp"/>
	<div id="body">
			<div id="mainmain">
				
				
				<table id="naviTable">
						<thead>
							<tr>
								<th class="width10"></th>
								<th class="thHigh" onclick="boardMenu(1);">작성글 확인</th>
								<th class="thHigh" onclick="boardMenu(2);">작성 댓글 확인</th>
								<th class="thHigh" onclick="boardMenu(3);">좋아요한 글</th>
								<th class="thHigh" onclick="boardMenu(4);">출석하기</th>
								<th class="thHigh"></th>
							</tr>
							
						</thead>
						
					</table>
					<br>
					<c:choose>
						<c:when test="${ not empty boardList }">
							<table class="table table-hover" id="mainTable">
	
								<thead>
									<tr align="center">
									<th scope="col"><p>선택</p></th>
									<th scope="col"><p>제목</p></th>
									<th scope="col"><p>작성일</p></th>
									<th scope="col"><p>조회수</p></th>
									</tr>
								  </thead>
								  <tbody align="center">
								  
								  <c:forEach items="${boardList}" var="i">
										<tr>
										<th scope="row"><p><input class="boardSelect" type="checkbox" value="${i.boardNo}"/></p></th>
										<td onclick="boardDetail('${i.boardNo}');"><p>${ i.boardTitle }</p></td>
										<td onclick="boardDetail('${i.boardNo}');"><p>${ i.enrolldate }</p></td>
										<td onclick="boardDetail('${i.boardNo}');"><p>${ i.viewCount }</p></td>
										</tr>
									</c:forEach>
								  </tbody>
						</table>
	
						<table id="foogg">
							<thead>
								<tr align="center">
									<th style="width : 30%;"><input  onclick="allSelectCansel();" class="inCheck" type="checkbox"/><button class="btn btn-success" onclick="allSelect();">전체 선택</button></th>
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
									<th style="width : 10%;"><button class="btn btn-success" onclick="boardDelete();">선택 삭제</button></th>
									<th style="width : 10%;" ><a class="btn btn-success" data-bs-toggle="modal" data-bs-target="#enrollFormSelect">글쓰기</a></th>
								</tr>
							</thead>
						</table>
					</c:when>
					<c:when test="${ not empty ReplyList }">
							<table class="table table-hover" id="mainTable">
	
								<thead>
									<tr align="center">
									<th scope="col"><p>선택</p></th>
									<th scope="col"><p>내용</p></th>
									<th scope="col"><p>작성일</p></th>
									<th scope="col"><p>게시글 번호</p></th>
									</tr>
								  </thead>
								  <tbody align="center">
								  
								  	<c:forEach items="${ReplyList}" var="i">
										<tr>
										<th scope="row"><p><input type="checkbox"/></p></th>
										<td onclick="boardDetail('${i.boardNo}');"><p>${ i.commentText }</p></td>
										<td onclick="boardDetail('${i.boardNo}');"><p>${ i.regDate }</p></td>
										<td onclick="boardDetail('${i.boardNo}');"><p>${ i.boardNo }</p></td>
										</tr>
									</c:forEach>
								  </tbody>
						</table>
	
						<table id="foogg">
							<thead>
								<tr align="center">
									<th style="width : 30%;"><input class="inCheck" type="checkbox"/><button class="btn btn-success">전체 선택</button></th>
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
									<th style="width : 10%;"><button class="btn btn-success">선택 삭제</button></th>
									<th style="width : 10%;" ><button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#enrollFormSelect">글쓰기</button></th>
								</tr>
							</thead>
						</table>
					</c:when>
					<c:otherwise>
						<table class="table table-hover" id="mainTable">
	
							<thead>
								<tr align="center">
								<th scope="col"><p>선택</p></th>
								<th scope="col"><p>제목</p></th>
								<th scope="col"><p>작성일</p></th>
								<th scope="col"><p>조회수</p></th>
								</tr>
							  </thead>
							  <tbody align="center">
								 <th colspan="4">게시글이 존재하지 않습니다.</th>
							  </tbody>
					</table>
					
					<table id="foogg">
						<thead>
							<tr align="center">
								<th style="width : 30%;"><input onclick="allSelectCansel();" class="inCheck" type="checkbox"/><button class="btn btn-success" onclick="allSelect();">전체 선택</button></th>
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
								<th style="width : 10%;"><button class="btn btn-success">선택 삭제</button></th>
								<th style="width : 10%;" ><a class="btn btn-success" data-bs-toggle="modal" data-bs-target="#enrollFormSelect">글쓰기</a></th>
							</tr>
						</thead>
					</table>
					</c:otherwise>
				</c:choose>
				
				<form action="" method="post" id="boardPostForm">
			         <input type="hidden" name="memberId" value="${ loginMember.memId }"/>
			         <input id="hidden-page" type="hidden" name="mPage" value="1"/>
			          <input id="menuPage" type="hidden" name="menuPage" value=""/>
					<input id="numbers" type="hidden" name="numbers"/>
			    </form>
			    
			   
			    
			    <script>
					function boardMenu(number){
					var menuNum = number;	
			    
			    		switch(menuNum){
							case 1 :  $('#boardPostForm').attr('action', 'myPage').submit(); break;
							case 2 :  $('#boardPostForm').attr('action', 'myPageReply').submit(); break;
							case 3 :  $('#boardPostForm').attr('action', 'myPageLike').submit(); break;
							case 4 :  $('#boardPostForm').attr('action', 'roulette').submit(); break;
							case 5 :  $('#boardPostForm').attr('action', 'myPageDelete').submit(); break;
						};
			    	};
			    
					function memberBoard(num){
						switch(menuNum){
							case 1 :$('#hidden-page').val(num); $('#boardPostForm').attr('action', 'myPage').submit(); break;
							case 2 :$('#hidden-page').val(num); $('#boardPostForm').attr('action', 'myPageReply').submit(); break;
							case 3 :$('#hidden-page').val(num); $('#boardPostForm').attr('action', 'myPageLike').submit(); break;
							case 5 :$('#hidden-page').val(num); $('#boardPostForm').attr('action', 'myPageDelete').submit(); break;
						};
					};

					function allSelect(){
						$('.boardSelect').prop('checked',true);
						$('.inCheck').prop('checked', true);
					}

					function boardDelete(){
						let checkeds = '';
						let qwe = "'";
						let boardNo = $('.boardSelect');
						for(var i=0; i < boardNo.length; i++){
							if(boardNo[i].checked){
									checkeds +=  boardNo[i].value + ',';
							}
						}
						console.log(checkeds);
						$('#numbers').val(checkeds);
						$('#boardPostForm').attr('action', 'boardSelectDelete').submit();
					}

					function allSelectCansel(){
						console.log($('.inCheck').prop('checked'));
						if(!$('.inCheck').prop('checked')){
							$('.boardSelect').prop('checked',false);
						}else{
							$('.boardSelect').prop('checked',true);
						}
					}
					
					function boardDetail(bno){
						console.log(bno);
						location.href = 'http://localhost:8787/withpet/detail.re?bno=' + bno;
					}
					
				</script>
			</div>
	</div>		
	
	<div id="mypageFooter"><jsp:include page="../common/footer.jsp" /></div>
	
</body>
</html>