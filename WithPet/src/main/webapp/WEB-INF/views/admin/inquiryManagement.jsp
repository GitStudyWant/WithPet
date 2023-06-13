<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 관리하기</title>
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
		width : 100%;
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
		width:40px;
		height:30px;
		
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
			<h3 style="text-align:center;">문의사항 관리</h3>	
			<hr>
			<br>
			<button id="deleteBtn" style="margin-left:1300px" class="btnn">삭제</button>
			<table id="naviTable" align="center" style="margin-left:50px">
				<thead>
					<tr>
						<th class="thHigh" width="40px">선택</th>
						<th class="thHigh" width="90px">문의번호</th>
						<th class="thHigh" width="90px">제목</th>
						<th class="thHigh" width="90px">작성자</th>
						<th class="thHigh" width="110px">작성일</th>
						<th class="thHigh" width="110px">상태</th>
						<th class="thHigh" width="110px">답변</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${ not empty iList }">
						  	<c:forEach items="${iList}" var="i">
								<tr>
								<th><input type="radio" name="inquiryNo" style="margin-left:20px" value="${i.inquiryNo}"/></th>
								<td>${i.inquiryNo}</td>
								
								<td id="${i.inquiryNo}inquiryTitle">${ i.inquiryTitle }</td>
								<td id="${i.inquiryNo}inquiryContent">${ i.inquiryContent }</td>
								<td id="${i.inquiryNo}inquiryCreateDate">${ i.inquiryCreateDate }</td>
								<td id="${i.inquiryNo}inquiryStatus">${ i.inquiryStatus }</td>
								<td id="${i.inquiryNo}inquiryAnswer">${ i.inquiryAnswer }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							등록된 카페가 없습니다.
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
         				<button class="btn btn-success" onclick="location.href='inquiryManagement?cPage=${ pi.currentPage - 1 }'">&lt</button>
         			</c:otherwise>
          		</c:choose>
             	<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
             		<button class="btn btn-success" onclick="location.href='inquiryManagement?cPage=${p}'">${ p }</button>
              	</c:forEach>
              	<c:choose>
         			<c:when test="${ pi.currentPage eq pi.maxPage }">
            			<button class="btn btn-success">&gt</button>
              		</c:when>
               		<c:otherwise>
               			<button class="btn btn-success" onclick="location.href='inquiryManagement?cPage=${pi.currentPage+1}'">&gt</button>
               		</c:otherwise>
               	</c:choose>
	
			</div>
	</div>		
	
	
	<script>
		$('#deleteBtn').click(function(){
			if(confirm('카페를 삭제하시겠습니까?')){
				
				$.ajax({
					url : 'deleteInquiry',
					data : {inquiryNo : $('input[name=inquiryNo]:checked').val()},
					success : function(result){
						if(result == 'Y'){
							alert('성공적으로 삭제되었습니다.');
							location.href = location.href;
						}else{
							alert('삭제 실패하였습니다. 다시 시도해주세요');
						}
					},
					error : function(){
						console.log('삭제 처리 실패!');
					}
				})
			} else {
				return false;
			}
		})
	
	</script>