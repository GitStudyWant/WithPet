<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 코스 조회</title>
 
<style>

	body{
		padding: 0px! important;
	}
	
	#body{
		width: 85%;
		height: 1000px;
		background-color:white;
		box-sizing: border-box;
		position:absolute;
		float:left;
		margin-left:15%;
		
	}

	#body>p{
		margin-top:40px;
		margin-bottom:40px;
		text-align:center;
		font-size:35px;
	}
	
	#mypageFooter{
		margin-top:1000px;
	}
	
	#c1, #c2, #c3{
		align: center;
		text-align : center;
	}
	
	.btnn{
		font-size: small;
		border-radius: 5px;
		background-color:rgb(73, 166, 112);
		color: white;
		border: 1px rgb(73, 166, 112);
	}
</style>
</head>
<body>
<jsp:include page="../../common/myPageSide.jsp" />
	
	<div id="body">	
		    <p>내 코스 조회</p>
		    <hr>
		    <div class="container" style="width:75%;">
		     		<h5>내가 저장한 코스 </h5>
		     		<button class="btnn" style="margin-left:750px"><a>여행 코스 짜러 가기</a></button>
		     		<div id="c1">
		     			<br>
			     		<table id="c1" class="courseT">
			     			<thead>
			     				<tr>
					     			<th width="120px;">타입</th>
					     			<th width="120px;">장소번호</th>
				     				<th width="350px;">장소명</th>
				     				<th width="350px;">주소</th>
				     				<th width="50px;"><button class="btnn" onclick="deleteCourse(1)">삭제</button></th>
			     				</tr>
			     			</thead>
					     			<tbody>
							     		<c:forEach var="p" items="${ myCourse }">
											<c:if test="${ p.courseSe eq 1 }">
							     				<tr>
							     					<c:choose>
							     						<c:when test="${ p.placeType eq 'A'}">
							     							<td>식당/카페</td>
							     						</c:when>
							     						<c:when test="${ p.placeType eq 'B'}">
							     							<td>숙박</td>
							     						</c:when>
							     						<c:when test="${ p.placeType eq 'C'}">
							     							<td>야외시설</td>
							     						</c:when>
							     					</c:choose>
							     					<td>${ p.placeNo }</td>
													<td>${ p.placeName }</td>
													<td>${ p.placeLocation }</td>		     				
							     				</tr>
											</c:if>
										</c:forEach>
					     			</tbody>
			     			</table>
		     			</div>
		     			<div id="c2">
		     			<br><br>
		     			  <table id="c2" class="courseT">
			     			<thead>
			     				<tr>
					     			<th width="120px;">타입</th>
					     			<th width="120px;">장소번호</th>
				     				<th width="350px;">장소명</th>
				     				<th width="350px;">주소</th>
				     				<th width="50px;"><button class="btnn" onclick="deleteCourse(3)">삭제</button></th>
			     				</tr>
			     			</thead>
					     			<tbody>
							     		<c:forEach var="p" items="${ myCourse }">
											<c:if test="${ p.courseSe eq 3 }">
							     				<tr>
													<c:choose>
							     						<c:when test="${ p.placeType eq 'A'}">
							     							<td>식당/카페</td>
							     						</c:when>
							     						<c:when test="${ p.placeType eq 'B'}">
							     							<td>숙박</td>
							     						</c:when>
							     						<c:when test="${ p.placeType eq 'C'}">
							     							<td>야외시설</td>
							     						</c:when>
							     					</c:choose>
							     					<td>${ p.placeNo }</td>
													<td>${ p.placeName }</td>
													<td>${ p.placeLocation }</td>		     				
							     				</tr>
											</c:if>
										</c:forEach>
					     			</tbody>
			     			</table>
		     			</div>
					<div id="c3">
					<br><br>
		     			  <table id="c3" class="courseT">
			     			<thead>
			     				<tr>
					     			<th width="120px;">타입</th>
					     			<th width="120px;">장소번호</th>
				     				<th width="350px;">장소명</th>
				     				<th width="350px;">주소</th>
				     				<th width="50px;"><button class="btnn" onclick="deleteCourse(5)">삭제</button></th>
			     				</tr>
			     			</thead>
					     			<tbody>
							     		<c:forEach var="p" items="${ myCourse }">
											<c:if test="${ p.courseSe eq 5 }">
							     				<tr>
													<c:choose>
							     						<c:when test="${ p.placeType eq 'A'}">
							     							<td>식당/카페</td>
							     						</c:when>
							     						<c:when test="${ p.placeType eq 'B'}">
							     							<td>숙박</td>
							     						</c:when>
							     						<c:when test="${ p.placeType eq 'C'}">
							     							<td>야외시설</td>
							     						</c:when>
							     					</c:choose>
							     					<td>${ p.placeNo }</td>
													<td>${ p.placeName }</td>
													<td>${ p.placeLocation }</td>		     				
							     				</tr>
											</c:if>
										</c:forEach>
					     			</tbody>
			     			</table>
		     			</div>
					</div>
				</div>
	
<div id="mypageFooter"><jsp:include page="../../common/footer.jsp" /></div>

<script>

	$(function(){
		
		console.log($('#c1>tbody').html());
		console.log($('#c2>tbody').html());
		console.log($('#c3>tbody').text());
	
		if($('#c1>tbody').html() == ''){
			$('#c1').css('display','none');
		}
		if($('#c2>tbody').html() == ''){
			$('#c2').css('display','none');
		}
		
		if($('#c3>tbody').html() == ''){
			alert('없는데')
			$('#c3').css('display','none');
		}
	})
	
	
	


</script>


</body>
</html>