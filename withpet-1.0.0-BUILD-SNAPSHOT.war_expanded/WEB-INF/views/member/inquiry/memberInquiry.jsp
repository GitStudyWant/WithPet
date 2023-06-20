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
	




</style>
</head>
<body>

	<jsp:include page="../../common/myPageSide.jsp" />
	<div id="body">
			<div id="mainmain">
				<table id="naviTable">
					<tr>
						<td class="thWidth"><h2 class="marginLeft40px marginTop30px" align="left">문의 사항</h2></td>
						<td class="thWidth" align="right"><a class="marginTop30px btn btn-success" href="inquiryInsertPage.me">문의하기</a></td>
					</tr>
				</table>						
					<div id="detailView">
					<c:choose>
						<c:when test="${ not empty inquiryList }">
							<table class="table table-hover" id="mainTable">
	
								<thead>
									<tr align="center">
									<th scope="col"><p>번호</p></th>
									<th scope="col"><p>제목</p></th>
									<th scope="col"><p>작성일</p></th>
									<th scope="col"><p>상태</p></th>
									</tr>
								  </thead>
								  <tbody align="center">
								  
								  	<c:forEach items="${inquiryList}" var="i">
										<tr onclick="inquiryDetail(${i.inquiryNo},'${loginMember.memId}');">
										<td scope="row"><p>${ i.inquiryNo }</p></td>
										<td><p>${ i.inquiryTitle }</p></td>
										<td><p>${ i.inquiryCreateDate }</p></td>
										<c:choose>
											<c:when test="${i.inquiryStatus eq 'Y' }">
												<td><img class="statusBtn" src="resources/myPage/blue.png" alt=""></td>
											</c:when>
											<c:when test="${i.inquiryStatus eq 'N' }">
												<td><img class="statusBtn" src="resources/myPage/red.png" alt=""></td>
											</c:when>
										</c:choose>
										</tr>
									</c:forEach>
								  </tbody>
						</table>
	
						<table id="foogg">
							<thead>
								<tr align="center">
									<th style="width : 30%;"></th>
									<th style="width : 50%;">
										<c:choose>
		                					<c:when test="${ pi.currentPage eq 1 }">
		                   						<button class="btn btn-success">&lt</button>
		                					</c:when>
		                					<c:otherwise>
		                						<button class="btn btn-success" onclick="inquiryBoard('${pi.currentPage-1}');">&lt</button>
		                					</c:otherwise>
			                				</c:choose>
			                   				<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
			                   					 <button class="btn btn-success" onclick="inquiryBoard('${p}');">${ p }</button>
			                    			</c:forEach>
			                    			<c:choose>
		                					<c:when test="${ pi.currentPage eq pi.maxPage }">
		                   						<button class="btn btn-success">&gt</button>
				                			</c:when>
					                		<c:otherwise>
					                			<button class="btn btn-success" onclick="inquiryBoard('${pi.currentPage+1}');">&gt</button>
					                		</c:otherwise>
					                	</c:choose>
					    					
									</th>
									<th style="width : 10%;"></th>
									<th style="width : 10%;" ></th>
								</tr>
							</thead>
						</table>
					</c:when>
					<c:when test="${ empty inquiryList }">
						<table class="table table-hover" id="mainTable">
	
							<thead>
								<tr align="center">
								<th scope="col"><p>번호</p></th>
								<th scope="col"><p>제목</p></th>
								<th scope="col"><p>작성일</p></th>
								<th scope="col"><p>상태</p></th>
								</tr>
							</thead>
							<tbody align="center">
								<th colspan="4">게시글이 존재하지 않습니다.</th>
							</tbody>
						 </table>
					
						<table id="foogg">
							<thead>
								<tr align="center">
									<th style="width : 30%;"></th>
									<th style="width : 50%;">
										<c:choose>
											<c:when test="${ pi.currentPage eq 1 }">
												 <button class="btn btn-success">&lt</button>
											</c:when>
											<c:otherwise>
												<button class="btn btn-success" onclick="inquiryBoard('${pi.currentPage-1}');">&lt</button>
											</c:otherwise>
										</c:choose>
											    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
													<button class="btn btn-success" onclick="inquiryBoard('${p}');">${p}</button>
											    </c:forEach>
										<c:choose>
											<c:when test="${ pi.currentPage eq pi.maxPage }">
												   <button class="btn btn-success">&gt</button>
											</c:when>
											<c:otherwise>
												<button class="btn btn-success" onclick="inquiryBoard('${pi.currentPage+1}');">&gt</button>
											</c:otherwise>
										</c:choose>
											
									</th>
									<th style="width : 10%;"></th>
									<th style="width : 10%;" ></th>
								</tr>
							</thead>
						</table>
					</c:when>
				</c:choose>
				<form action="" method="post" id="inquiryForm">
			         <input type="hidden" id="memberId" name="memberId" value="${ loginMember.memId }"/>
			         <input id="hidden-page" type="hidden" name="iPage" value="1"/>
			    </form>
			    
			    
			    <script>
			    	function inquiryBoard(num){
						$('#hidden-page').val(num); $('#inquiryForm').attr('action', 'inquiry.me').submit();
					};
					
					function inquiryDetail(inquiryNo,memberId){
						console.log(memberId);
						$.ajax({
							url : 'inquiryDetail.me',
							data : { inquiryNo : inquiryNo,
								   memberId : memberId },
							type : 'post',
							success : function(result){
								console.log(result);
								console.log(result.inquiryAnswer);
								var value = '';
								if(result === '없음'){
									$('#alertTag').text('검색결과가 존재하지 않습니다.');
								} else{
									value += '<hr>' 
										  + '<div class="detail">'
							              + '<h2>문의 상세보기</h2>'
							              + '<table class="inquiryTable">'
							              + '<tr>'
							              + '<th class="text-alignC tr-td-70pxsize">제목</th>'
							              + '<td colspan="3" class="text-alignL">'+ result.inquiryTitle +'</td>'
							              + '</tr>'
							              + '<tr>'
							              + '<th class="text-alignC tr-td-70pxsize">작성자</th>'
							              + '<td class="text-alignL">'+ result.memberId +'</td>'
							              + '<th class="text-alignC tr-td-70pxsize">작성일</th>'
							              + '<td>'+ result.inquiryCreateDate +'</td>'
							              + '</tr>'
							              + '<tr><br>'
							              + '<th colspan="4"><h3>문의내용</h3></th>'
							              + '<td colspan="3"></td>'
							              + '</tr>'
							              + '<tr>'
							              + '<td colspan="4"><p style="height:150px;">'+ result.inquiryContent +'</p></td>'
							              + '</tr>'
							              + '</table>'
							              + '<br>'
										  + '<div align="center">'
							              + '<a class="btn btn-danger" onclick="inquiryDelete('+result.inquiryNo+');">삭제하기</a>'  
							              + '</div>'    
										  + '<br><hr>'							            
							              + '<table id="inquiryAnswer" style="width:100%;">'
							              + '<thead>'
							              + '<tr>'
							              + '<th>'
							              + '<h3 class="text-alignC">답변 내용</h3>'
							              + '</th>'
							              + '</tr>'
							              + '<tr>'
							              + '<td style="height:200px;"><p>'+result.inquiryAnswer+'</p></td>'
							              + '</tr>'
							              + '</thead>'
							              + '</table>'
										  + '</div>';
								}
								console.log(value);
								$('#detailView').html(value);
							},
							error : function(){
								console.log('실패');
							}
						});
					}
					
					function inquiryDelete(num){
						location.href = "inuqiryDelete.me?ino="+num;
					} 
					
				</script>
				</div>
			</div>
	</div>		
	
	<div id="mypageFooter"><jsp:include page="../../common/footer.jsp" /></div>
	
</body>
</html>