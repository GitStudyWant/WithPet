<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교통 예약 관리</title>
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
			<h3 style="text-align:center;">교통 예약 관리</h3>	
			<hr>
			<button style="width:180px; margin-left:300px; background-color : white; color:black;" id="taxiList" class="btnn">펫택시 예약 목록</button>
			<button style="width:180px; margin-left:300px" id="carList" class="btnn">렌터카 예약 목록</button>
			<br><br>
			<button id="deleteBtn" style="margin-left:1100px" class="btnn">예약 취소 처리</button>
			<table id="naviTable" align="center" style="margin-left:50px">
				<thead>
					<tr>
						<input type="hidden" value="T" class="trType">
						<th class="thHigh" width="40px">선택</th>
						<th class="thHigh" width="90px">예약번호</th>
						<th class="thHigh" width="90px">택시번호</th>
						<th class="thHigh" width="90px">택시타입</th>
						<th class="thHigh" width="110px">예약일</th>
						<th class="thHigh" width="110px">예약시간</th>
						<th class="thHigh" width="90px">예약자</th>
						<th class="thHigh" width="80px">예약상태</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${ not empty tList }">
						  	<c:forEach items="${tList}" var="i">
								<tr>
								<th>
								<c:choose>
									<c:when test="${ i.status eq 'Y' }">
										<input type="radio" name="trNo" style="margin-left:20px" value="${ i.taxiRno }"/>
									</c:when>
									<c:otherwise>
										<input type="radio" name="trNo" disabled style="margin-left:20px" value="${ i.taxiRno }"/>
									</c:otherwise>
								</c:choose>
								</th>
								<td>${ i.taxiRno }</td>
								<td>${ i.trNo }</td>
								<c:choose>
									<c:when test="${i.trType2 eq 'J' }">
										<td>중형세단</td>
									</c:when>
									<c:when test="${i.trType2 eq 'S' }">
										<td>SUV</td>
									</c:when>
									<c:when test="${i.trType2 eq 'D' }">
										<td>대형세단</td>
									</c:when>
								</c:choose>
									<td>${ i.taxiRDate }</td>
								<td>
								<c:choose>
									<c:when test="${ i.taxiRTime eq 1 }">
										<select>
										<option selected disabled>6시~7시</option>
										</select>
									</c:when>
									<c:when test="${  i.taxiRTime eq 2 }">
										<select>
										<option selected disabled>7시~8시</option>
										</select>
									</c:when>
									<c:when test="${  i.taxiRTime eq 3 }">
										<select>
										<option selected disabled>8시~9시</option>
										</select>
									</c:when>
									<c:when test="${  i.taxiRTime eq 4 }">
										<select>
										<option selected disabled>9시~10시</option>
										</select>
									</c:when>
									<c:when test="${  i.taxiRTime eq 5 }">
										<select>
										<option selected disabled>10시~11시</option>
										</select>
									</c:when>
									<c:when test="${  i.taxiRTime eq 6 }">
										<select>
										<option selected disabled>11시~12시</option>
										</select>
									</c:when>
									<c:when test="${  i.taxiRTime eq 7 }">
										<select>
										<option selected disabled>12시~13시</option>
										</select>
									</c:when>
									<c:when test="${  i.taxiRTime eq 8 }">
										<select>
										<option selected disabled>13시~14시</option>
										</select>
									</c:when>
									<c:when test="${  i.taxiRTime eq 9 }">
										<select>
										<option selected disabled>14시~15시</option>
										</select>
									</c:when>
									<c:when test="${  i.taxiRTime eq 10 }">
										<select>
										<option selected disabled>15시~16시</option>
										</select>
									</c:when>
									<c:when test="${  i.taxiRTime eq 11 }">
										<select>
										<option selected disabled>16시~17시</option>
										</select>
									</c:when>
									<c:when test="${  i.taxiRTime eq 12 }">
										<select>
										<option selected disabled>17시~18시</option>
										</select>
									</c:when>
									<c:when test="${  i.taxiRTime eq 13 }">
										<select>
										<option selected disabled>18시~19시</option>
										</select>
									</c:when>
									<c:when test="${  i.taxiRTime eq 14 }">
										<select>
										<option selected disabled>19시~20시</option>
										</select>
									</c:when>
									<c:when test="${  i.taxiRTime eq 15 }">
										<select>
										<option selected disabled>20시~21시</option>
										</select>
									</c:when>
									<c:when test="${  i.taxiRTime eq 16 }">
										<select>
										<option selected disabled>21시~22시</option>
										</select>
									</c:when>
									<c:when test="${  i.taxiRTime eq 17 }">
										<select>
										<option selected disabled>22시~23시</option>
										</select>
									</c:when>
									<c:otherwise>
										<select>
										<option selected disabled>23시~24시</option>
										</select>
									</c:otherwise>
								</c:choose>
								</td>
								<td>${ i.memId }</td>
								<td>${ i.status}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							택시 예약건이 없습니다.
						</c:otherwise>
				  </c:choose>		  
				</tbody>
			</table>
		</div>
	</div>		
	
	<script>
		
	
		$('#deleteBtn').click(function(){
			if(confirm('선택한 예약건을 취소 처리 하시겠습니까?')){
				
				var resNo = $('input[name=trNo]:checked').val();
				var trType = $('.trType').val();
				
				$.ajax({
					url : 'deleteTReservation',
					data : {resNo : resNo,
						    trType : trType},
					success : function(result){
						console.log(result);
						if(result == 'Y'){
							alert('취소 처리 되었습니다.');
							location.href=location.href;
						}else{
							alert('취소 처리가 실패했습니다. 다시 시도해주세요.');
						}
						
					},
					error : function(){
						console.log('취소처리 실패 ㅠㅠ');
					}
				})
			} else {
				return false;
			}
		})
		
		$('#carList').click(function(){
			$('#taxiList').css('background-color','rgb(73, 166, 112)').css('color','white');
			$('#carList').css('background-color','white').css('color','black');
			
			var value =  '<thead><tr><input type="hidden" value="C" class="trType"><th class="thHigh" width="60px">선택</th><th class="thHigh" width="90px">예약번호</th>'
		      		  + '<th class="thHigh" width="90px">차번호</th><th class="thHigh" width="90px">차 타입</th><th class="thHigh" width="110px">시작일</th>'
		              + '<th class="thHigh" width="110px">종료일</th><th class="thHigh" width="90px">예약자</th><th class="thHigh" width="90px">예약상태</th>'
		              + '<th class="thHigh" widht="90px">결제번호</th><th class="thHigh" widht="110px">결제일</th><th class="thHigh" width="90px">결제카드</th>'
		              + '</tr></thead>';
			
			$.ajax({
				url : 'carReservationList',
				success : function(resultArr){
					console.log(resultArr);
					
					if(resultArr != ''){
						
						for(var i in resultArr){
							
							let result = resultArr[i];
							
								
									if(result.status == 'Y'){
										value +=  '<tr>' + '<th><input type="radio" name="trNo" style="margin-left:20px" value="'+result.carRno+'"/></th>'
										  + '<td>'+result.carRno+'</td><td>'+result.trNo+'</td>'
									} else {
										value +=  '<tr>' + '<th><input type="radio" name="trNo" disabled style="margin-left:20px" value="'+result.carRno+'"/></th>'
										  + '<td>'+result.carRno+'</td><td>'+result.trNo+'</td>'
									}
							
							      
								   	 
								   	 if(result.trType2 == 'J'){
								   		 value+='<td>중형세단</td>'
								   	 } else if(result.trType2 == 'S'){
								   		 value+='<td>SUV</td>'
								   	 } else{
								   		 value+='<td>대형세단</td>'
								   	 }
						    value += '<td>'+result.startDate+'</td>'
						          + '<td>'+result.endDate+'</td>'
								  + '<td>'+result.memId+'</td>'
								  + '<td>'+result.status+'</td>'
								  + '<td>'+result.trPaymentNo+'</td>'
								  + '<td>'+result.trPaymentDate+'</td>'
								  + '<td>'+result.trCardNo+'</td></tr>'
								  
						}
						$('#naviTable').html(value);
					
					}
				},
				error : function(){
					console.log('카예약 목록 불러오기 실패 ㅠㅠ');
				}
	
			})
			
			
		})
		
	$('#taxiList').click(function(){
		location.href=location.href;
	})
		
	</script>
	
	<div id="mypageFooter"><jsp:include page="../common/footer.jsp" /></div>
	

	
</body>
</html>