<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
 
<style>

	body{
		padding: 0px! important;
	}
	
	#body{
		width: 90%;
		height: 1000px;
		background-color:white;
		box-sizing: border-box;
		position:absolute;
		float:left;
		margin-left:85px;
		
	}

	#body>p{
		margin-top:15px;
		text-align:center;
		font-size:35px;
	}
	
	#mypageFooter{
		margin-top:1000px;
	}
	
	.btnn{
		font-size: small;
		border-radius: 5px;
		background-color:rgb(73, 166, 112);
		color: white;
		border: 1px rgb(73, 166, 112);
	}
	
	#cafeList, #taxiList, #carList{
		align: center;
		text-align : center;
		width : 100%;
	}
	
	.aTag{
		text-decoration : none;
		color : white;
	}
	
	table>tbody>tr:hover{
   cursor: pointer;
   font-size:17px;
   /*background-color: yellow;*/
}


</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
	
	<div id="body">	
		    <p>${keyword} 검색 결과</p>
		    <hr>
		    <div id="myReservationmain">
		    <div class="container" style="width:75%;">

		        <div id="transList">
		         	<h5>리뷰 게시판</h5>
		         	<br>
		         	<table id="review" style="text-align:center">
		         	<c:choose>
		         			<c:when test="${ not empty searchList }">
		         		<thead>
		         			<tr>
		         			<th width="120px">글 번호</th>
		         			<th width="250px">제목</th>
		         			<th width="120">작성자</th>
		         			<th width="120">별점수</th>
		         			</tr>
		         		</thead>
		         		<tbody>
		         				<c:forEach var="i" items="${ searchList }">
		         				<c:choose>
		         				<c:when test="${ i.boardNum eq '1' }">
		         					<tr>
		         						<td>${ i.boardNo }</td>
		         						<td>${ i.boardTitle }</td>
		         						<td>${ i.boardWriter }</td>
		         						<td>${ i.rating }</td>
		         					</tr>
			         			</c:when>
		         				</c:choose>
		         				</c:forEach>
		         			</tbody>
		         			</c:when>
		         			<c:otherwise>
		         			검색결과가 없습니다.
		         			</c:otherwise>
		         			</c:choose>
		         	</table>
		         	<hr>
		         	<br><br>
		         		<h5>자유 게시판</h5>
		         		<br>
		         	<table id="free" style="text-align:center">
		         	<c:choose>
		         		<c:when test="${ not empty searchList }">
		         		<thead>
		         			<tr>
								<th width="120px">글 번호</th>
		         				<th width="250px">제목</th>
		         				<th width="120">작성자</th>
		         				<th width="120">별점수</th>
		         			</tr>
		         		</thead>
		         		<tbody>
		         			<c:forEach var="i" items="${ searchList }">
		         		<c:choose>
		         			<c:when test="${ i.boardNum eq '2' }">
		         			<tr>
		         				<td>${ i.boardNo }</td>
         						<td>${ i.boardTitle }</td>
         						<td>${ i.boardWriter }</td>
         						<td>${ i.rating }</td>
		         			</tr>
		         		</c:when>
		         		</c:choose>
		         			</c:forEach>
		         		</tbody>
		         			</c:when>
		         			<c:otherwise>
		         			검색결과가 없습니다.
		         			</c:otherwise>
		         			</c:choose>
		         	</table>
		         
		        <hr>
		         	<br><br>
					<h5>질문 게시판</h5>    
					<br>    
		        	<table id="qna" style="text-align:center">
		        	<c:choose>
		         		<c:when test="${ not empty searchList }">
		         		<thead>
		         			<tr>
								<th width="120px">글 번호</th>
		         				<th width="250px">제목</th>
		         				<th width="120">작성자</th>
		         				<th width="120">별점수</th>
		         			</tr>
		         		</thead>
		         		<tbody>
		         			<c:forEach var="i" items="${ searchList }">
		        	<c:choose>
		         			<c:when test="${ i.boardNum eq '3' }">
		         			<tr>
		         				<td>${ i.boardNo }</td>
         						<td>${ i.boardTitle }</td>
         						<td>${ i.boardWriter }</td>
         						<td>${ i.rating }</td>
		         			</tr>
		         		</c:when>
		         		</c:choose>
		         			</c:forEach>
		         		</tbody>
		         			</c:when>
		         			<c:otherwise>
		         			검색결과가 없습니다.
		         			</c:otherwise>
		         		</c:choose>
		        	</table>
		        	<hr>
		         	<br><br>
		         		<h5>크리에이터 게시판</h5>
		         		<br>
		         	<table id="creator" style="text-align:center">
		         	<c:choose>
		         		<c:when test="${ not empty searchList }">
		         		<thead>
		         			<tr>
								<th width="120px">글 번호</th>
		         				<th width="250px">제목</th>
		         				<th width="120">작성자</th>
		         				<th width="120">별점수</th>
		         			</tr>
		         		</thead>
		         		<tbody>
		         			<c:forEach var="i" items="${ searchList }">
		         		<c:choose>
		         			<c:when test="${ i.boardNum eq '4' }">
		         			<tr>
		         				<td>${ i.boardNo }</td>
         						<td>${ i.boardTitle }</td>
         						<td>${ i.boardWriter }</td>
         						<td>${ i.rating }</td>
		         			</tr>
		         		</c:when>
		         		</c:choose>
		         			</c:forEach>
		         		</tbody>
		         			</c:when>
		         			<c:otherwise>
		         			검색 결과가 없습니다.
		         			</c:otherwise>
		         			</c:choose>
		         	</table>
		        	 	<hr>
		         	<br><br>
		         		<h5>공유 게시판</h5>
		         		<br>
		         	<table id="share" style="text-align:center">
		         	<c:choose>
		         		<c:when test="${ not empty searchList }">
		         		<thead>
		         			<tr>
								<th width="120px">글 번호</th>
		         				<th width="250px">제목</th>
		         				<th width="120">작성자</th>
		         				<th width="120">별점수</th>
		         			</tr>
		         		</thead>
		         		<tbody>
		         			<c:forEach var="i" items="${ searchList }">
		         		<c:choose>
		         			<c:when test="${ i.boardNum eq '5' }">
		         			<tr>
		         				<td>${ i.boardNo }</td>
         						<td>${ i.boardTitle }</td>
         						<td>${ i.boardWriter }</td>
         						<td>${ i.rating }</td>
		         			</tr>
		         		</c:when>
		         		</c:choose>
		         			</c:forEach>
		         		</tbody>
		         			</c:when>
		         			<c:otherwise>
		         			검색결과가 없습니다.
		         			</c:otherwise>
		         			</c:choose>
		         	</table>
		     
		        </div>
			</div>
		</div>
	</div>
	
	<script>
	
		$(function(){
		
		$('#review>tbody>tr').click(function(){
			location.href="http://localhost:8787/withpet/list.review"
		})
		
		$('#free>tbody>tr').click(function(){
			location.href="http://localhost:8787/withpet/list.free"
		})
		
		$('#qna>tbody>tr').click(function(){
			location.href="#"
		})
		
		$('#creator>tbody>tr').click(function(){
			location.href="#"
		})
		
		$('#share>tbody>tr').click(function(){
			location.href="#"
		})
		
			if(!$('#free>tbody').html().includes('<tr>')){
				$('#free>thead').text('검색결과가 없습니다.');
			}
			
			if(!$('#review>tbody').html().includes('<tr>')){
				$('#review>thead').text('검색결과가 없습니다.');
			}
			if(!$('#qna>tbody').html().includes('<tr>')){
				$('#qna>thead').text('검색결과가 없습니다.');
			}
			if(!$('#creator>tbody').html().includes('<tr>')){
				$('#creator>thead').text('검색결과가 없습니다.');
			}
			if(!$('#share>tbody').html().includes('<tr>')){
				$('#share>thead').text('검색결과가 없습니다.');
			}
		})
		
	
	
	</script>
	
	
	

<div id="mypageFooter"><jsp:include page="../common/footer.jsp" /></div>

</body>
</html>