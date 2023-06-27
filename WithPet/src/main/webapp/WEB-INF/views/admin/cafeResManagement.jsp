<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페 예약 관리</title>
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
		width : 80%;
		height : 150px;
		margin-left : 200px;
	}

	#naviTable td{
		text-align: center;
	}

	.thHigh{
		height : 120px;
		font-size: 17px;
		text-align: center;
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

	<jsp:include page="../common/adminMyPageSide.jsp" />

	<div id="body">
		<div id="mainmain">
			<br>
			<h3 style="text-align:center;">카페 예약 관리</h3>	
			<hr>
			<br><br>
			<button id="deleteBtn" style="margin-left:1100px" class="btnn">예약 취소 처리</button>
			<table id="naviTable" align="center" style="margin-left:50px">
				<thead>
					<tr>
						<input type="hidden" value="c" class="cafeResNo">
						<th class="thHigh" width="40px">선택</th>
						<th class="thHigh" width="90px">예약번호</th>
						<th class="thHigh" width="90px">카페번호</th>
						<th class="thHigh" width="90px">카페명</th>
						<th class="thHigh" width="90px">카페주소</th>
						<th class="thHigh" width="110px">예약일</th>
						<th class="thHigh" width="110px">예약시간</th>
						<th class="thHigh" width="90px">예약자</th>
						<th class="thHigh" width="80px">예약상태</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${ not empty cList }">
						  	<c:forEach items="${cList}" var="c">
								<tr>
								<th><input type="radio" name="cafeResNo" style="margin-left:20px" value="${c.cafeResNo}"/></th>
								<td>${ c.cafeResNo }</td>
								<td>${ c.cafeNo }</td>
								<td>${ c.cafeTitle }</td>
								<td>${ c.cafeAddress }</td>
								<td>${ c.resDate }</td>
								<td>
								<c:choose>
									<c:when test="${ c.resTime eq 5 }"> <select> <option selected disabled>10시~12시</option> </select> </c:when>
									<c:when test="${  c.resTime eq 7 }"> <select> <option selected disabled>12시~14시</option> </select> </c:when>
									<c:when test="${  c.resTime eq 9 }"> <select> <option selected disabled>14시~16시</option> </select> </c:when>
									<c:when test="${  c.resTime eq 11 }"> <select> <option selected disabled>16시~18시</option> </select> </c:when>
							 	 <c:otherwise>
									<select> <option selected disabled>18시~20시</option> </select>
								 </c:otherwise>
								</c:choose>
								</td>
								 <td>${ c.memId }</td>
								 <td>${ c.cafeResStatus}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							카페 예약건이 없습니다.
						</c:otherwise>
				  </c:choose>		  
				</tbody>
			</table>
		</div>
	</div>		
	
	<script>
		
		$('#deleteBtn').click(function(){
			var cafeResNo = $('input[name=cafeResNo]:checked').val();
			
			if(confirm('선택한 카페 예약을 삭제하시겠습니까?')){
				$.ajax({
					url : 'deleteCr',
					data : {cafeResNo : $('input[name=cafeResNo]:checked').val()},
					success : function(result){
						if(result == 'Y'){
							alert('성공적으로 삭제되었습니다.')
							location.href=location.href;
						}else{
							alert('삭제가 실패했습니다. 다시 시도해주세요.');
						}
					},
					error : function(){
						console.log('삭제 실패 ㅠㅠ');
					}
				})
			} else {
				return false;
			}
		})		
		
	</script>
	
	
	<script>
		
		$(function(){
			$('#naviTable tr').click(function(){
	
				location.href="info.do?cno=" + $(this).children().eq(2).text();
				
			})
		})
	</script>
	
	<div id="mypageFooter"><jsp:include page="../common/footer.jsp" /></div>
	

	
</body>
</html>