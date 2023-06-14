<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페 관리하기</title>
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
			<h3 style="text-align:center;">카페 관리</h3>	
			<hr>
			<br>
			<button id="addBtn" style="margin-left:1200px" class="btnn"><a href="cafeEnrollForm.bo" style="text-decoration:none; color:white;">추가</a></button>
			<button id="deleteBtn" class="btnn">삭제</button>
			<table id="naviTable" align="center" style="margin-left:50px">
				<thead>
					<tr>
						<th class="thHigh" width="40px">선택</th>
						<th class="thHigh" width="90px">번호</th>
						<th class="thHigh" width="90px">카페명</th>
						<th class="thHigh" width="90px">주소</th>
						<th class="thHigh" width="110px">서비스</th>
						<th class="thHigh" width="110px">상태</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${ not empty cList }">
						  	<c:forEach items="${cList}" var="c">
								<tr>
								<th><input type="radio" name="cafeNo" style="margin-left:20px" value="${c.cafeNo}"/></th>
								<td>${c.cafeNo}</td>
								
								<td id="${c.cafeNo}cafeTitle">${ c.cafeTitle }</td>
								<td id="${c.cafeNo}cafeAddress">${ c.cafeAddress }</td>
								<td id="${c.cafeNo}cafeService">${ c.cafeService }</td>
								<td id="${c.cafeNo}cafeStatus">${ c.cafeStatus }</td>
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
         				<button class="btn btn-success" onclick="location.href='cafeManagement?cPage=${ pi.currentPage - 1 }'">&lt</button>
         			</c:otherwise>
          		</c:choose>
             	<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
             		<button class="btn btn-success" onclick="location.href='cafeManagement?cPage=${p}'">${ p }</button>
              	</c:forEach>
              	<c:choose>
         			<c:when test="${ pi.currentPage eq pi.maxPage }">
            			<button class="btn btn-success">&gt</button>
              		</c:when>
               		<c:otherwise>
               			<button class="btn btn-success" onclick="location.href='cafeManagement?cPage=${pi.currentPage+1}'">&gt</button>
               		</c:otherwise>
               	</c:choose>
	
			</div>
	</div>		
	
	
	<script>
		$('#deleteBtn').click(function(){
			if(confirm('카페를 삭제하시겠습니까?')){
				
				$.ajax({
					url : 'deleteCafe',
					data : {cafeNo : $('input[name=cafeNo]:checked').val()},
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