<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 관리하기</title>
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
		align : center;
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
		height : 800px;
		display: inline-block;	
		float:left;
	}

	#naviTable{
		width : 80%;
		height : 150px;
	}

	#naviTable td{
		text-align: center;
	}

	.thHigh{
		height : 120px;
		font-size: 17px;
		text-align: center;
	}
	
	#page{
		width : 75%;
		height : 200px;
		display : inline-block;
		float:left;
		margin-left: 500px;
		margin-top : 100px;
		
	}
	
	
	.btnn{
	
		font-size: small;
		border-radius: 5px;
		background-color:rgb(73, 166, 112);
		color: white;
		border: 1px rgb(73, 166, 112);
		
	}
	
	 input::placeholder { font-size: 70%; }
    textarea::placeholder { font-size: 70%; }



</style>
</head>
<body>

	<jsp:include page="../common/adminMyPageSide.jsp" />

	<div id="body">
		<div id="mainmain">
			<br>
			<h3 style="text-align:center;">신고 관리</h3>	
			<hr>
			<br>
			<button id="checkReportBtn" class="btnn" style="margin-left:1100px">신고 처리 </button>
			<button id="deleteReportBtn" class="btnn">삭제</button>
			<table id="naviTable" align="center" style="margin-left:50px">
				<thead>
					<tr>
						<th class="thHigh" width="40px">선택</th>
						<th class="thHigh" width="90px">번호</th>
						<th class="thHigh" width="90px">신고한 회원</th>
						<th class="thHigh" width="90px">신고받은 회원</th>
						<th class="thHigh" width="110px">신고일</th>
						<th class="thHigh" width="110px">신고내용</th>
						<th class="thHigh" width="110px">게시글번호</th>
						<th class="thHigh" width="110px">댓글번호</th>
						<th class="thHigh" width="110px">처리상태</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${ not empty RList }">
						  	<c:forEach items="${RList}" var="i">
								<tr>
								<th><input type="radio" name="reportNo" style="margin-left:20px" value="${ i.reportNo }"/></th>
								<td>${ i.reportNo }</td>
								<td>${ i.reportSender }</td>
								<td id="${i.reportNo}reportReceiver">${ i.reportReceiver }</td>
								<td>${ i.reportDate }</td>
								<td>${ i.reportContent }</td>
								<c:choose>
									<c:when test="${i.boardNo ne 0 }">
									<td>${ i.boardNo }</td>	
									</c:when>
									<c:otherwise>
									<td>-</td>	
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${i.commentNo ne 0 }">
									<td>${ i.commentNo }</td>	
									</c:when>
									<c:otherwise>
									<td>-</td>	
									</c:otherwise>
								</c:choose>
								<td id="${i.reportNo}reportStatus">${ i.reportStatus }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							신고 내역이 없습니다.
						</c:otherwise>
				  </c:choose>		  
				</tbody>
			</table>
		</div>
			
			<div id="page">
				<c:choose>
    				<c:when test="${ pi.currentPage eq 1 }">
           				<button class="btn btn-success">&lt</button>
         			</c:when>
         			<c:otherwise>
         				<button class="btn btn-success" onclick="location.href='adminReportList?cPage=${ pi.currentPage - 1 }'">&lt</button>
         			</c:otherwise>
          		</c:choose>
             	<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
             		<button class="btn btn-success" onclick="location.href='adminReportList?cPage=${p}'">${ p }</button>
              	</c:forEach>
              	<c:choose>
         			<c:when test="${ pi.currentPage eq pi.maxPage }">
            			<button class="btn btn-success">&gt</button>
              		</c:when>
               		<c:otherwise>
               			<button class="btn btn-success" onclick="location.href='adminReportList?cPage=${pi.currentPage+1}'">&gt</button>
               		</c:otherwise>
               	</c:choose>
	
			</div>
	</div>		
	
	<script>
	
	
		$('#deleteReportBtn').click(function(){
			if(confirm('선택한 신고건을 삭제 처리 하시겠습니까? 삭제가 되면 다시 복구가 불가능 합니다.')){
				
				$.ajax({
					url : 'deleteReport',
					data : {reportNo : $('input[name=reportNo]:checked').val()},
					success : function(result){
						console.log(result);
						if(result == 'Y'){
							alert('삭제 처리 되었습니다.');
						}else{
							alert('삭제 처리가 실패했습니다. 다시 시도해주세요.');
						}
						
					},
					error : function(){
						console.log('삭제 처리 실패 ㅠㅠ');
					}
				})
			} else {
				return false;
			}
		})

		
	$('#checkReportBtn').click(function(){
		var reportNo = $('input[name=reportNo]:checked').val();
		if($('#'+reportNo+'reportStatus').text() == 'Y'){
			alert('이미 처리가 완료 된 건 입니다.');
			return false;
		} else {
			if(confirm('해당 신고 건을 처리 하시겠습니까? 해당 회원의 신고수가 추가 됩니다.')){
					$.ajax({
						url : 'checkReport',
						data : {reportNo : reportNo,
								memId : $('#'+reportNo+'reportReceiver').text()},
						success : function(result){
							console.log(result);
							if(result == 'Y'){
								alert('해당 신고건이 처리 완료 되었습니다.')
								location.href=location.href;
							}else{
								alert('해당 신고건 처리가 실패했습니다. 다시 시도해주세요')
							}
						},
						error : function(){
							console.log('신고 처리 실패 ㅜㅜ');
						}
				})
				
			} else {
				return false;
			}
	
		}
	})
	
	</script>
	
	<div id="mypageFooter"><jsp:include page="../common/footer.jsp" /></div>

	
</body>
</html>