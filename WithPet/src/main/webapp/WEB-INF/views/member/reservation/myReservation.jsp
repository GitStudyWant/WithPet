<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 예약 조회</title>
 
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



</style>
</head>
<body>
<jsp:include page="../../common/myPageSide.jsp" />
	
	<div id="body">	
		    <p>내 예약 조회</p>
		    <hr>
		    <div id="myReservationmain">
		    <div class="container" style="width:75%;">

		        <div id="transList">
		         	<h5>택시 예약</h5>
		         	<button class="btnn" style="margin-left:900px" onclick="deleteRes(1);">취소</button>
		         	<button class="btnn"><a class="aTag" href="transReservation">예약하러 가기</a></button>
		         	<br><br>
		         	<table id="taxiList">
		         		<c:choose>
		         			<c:when test="${ not empty tList }">
		         		<thead>
		         			<tr>
		         			<th width="70px">선택</th>
		         			<th width="100px">택시번호</th>
		         			<th width="120">예약일</th>
		         			<th width="120">예약시간</th>
		         			<th width="120">타입</th>
		         			<th width="120">상태</th>
		         			</tr>
		         		</thead>
		         		<tbody>
		         				<c:forEach var="i" items="${ tList }">
		         					<tr>
		         						<td>
		         						<c:choose>
		         						<c:when test="${i.status eq 'N'}">
		         						<input type="radio" value="${ i.taxiRno }" name="tRno" disabled>
		         						</c:when>
		         						<c:otherwise>
		         						<input type="radio" value="${ i.taxiRno }" name="tRno">
		         						</c:otherwise>
		         						</c:choose>
		         						</td>
		         						<td>${ i.trNo }</td>
		         						<td id="${i.taxiRno}taxiRDate">${ i.taxiRDate }</td>
		         							<c:choose>
		         								<c:when test="${ i.taxiRTime eq 1}">
		         									<td>06:00~07:00</td>
		         								</c:when>
	         									<c:when test="${ i.taxiRTime eq 2}">
	         										<td>07:00~08:00</td>
	         									</c:when>
	         									<c:when test="${ i.taxiRTime eq 3}">
	         										<td>08:00~09:00</td>
	         									</c:when>
	         									<c:when test="${ i.taxiRTime eq 4}">
	         										<td>09:00~10:00</td>
	         									</c:when>
	         									<c:when test="${ i.taxiRTime eq 5}">
	         										<td>10:00~11:00</td>
	         									</c:when>
	         									<c:when test="${ i.taxiRTime eq 6}">
	         										<td>11:00~12:00</td>
	         									</c:when>
	         									<c:when test="${ i.taxiRTime eq 7}">
	         										<td>12:00~13:00</td>
	         									</c:when>
	         									<c:when test="${ i.taxiRTime eq 8}">
	         										<td>13:00~14:00</td>
	         									</c:when>
	         									<c:when test="${ i.taxiRTime eq 9}">
	         										<td>14:00~15:00</td>
	         									</c:when>
	         									<c:when test="${ i.taxiRTime eq 10}">
	         										<td>15:00~16:00</td>
	         									</c:when>
	         									<c:when test="${ i.taxiRTime eq 11}">
	         										<td>16:00~17:00</td>
	         									</c:when>
	         									<c:when test="${ i.taxiRTime eq 12}">
	         										<td>17:00~18:00</td>
	         									</c:when>
	         									<c:when test="${ i.taxiRTime eq 13}">
	         										<td>18:00~19:00</td>
	         									</c:when>
	         									<c:when test="${ i.taxiRTime eq 14}">
	         										<td>19:00~20:00</td>
	         									</c:when>
	         									<c:when test="${ i.taxiRTime eq 15}">
         											<td>20:00~21:00</td>
	         									</c:when>
	         									<c:when test="${ i.taxiRTime eq 16}">
	         										<td>21:00~22:00</td>
	         									</c:when>
	         									<c:when test="${ i.taxiRTime eq 16}">
	         										<td>22:00~23:00</td>
	         									</c:when>
	         									<c:when test="${ i.taxiRTime eq 16}">
	         										<td>23:00~24:00</td>
	         									</c:when>
		         							</c:choose>
		         							<c:choose>
			         							<c:when test="${ i.trType2 eq 'J' }">
			         								<td>중형세단</td>
			         							</c:when>
			         							<c:when test="${ i.trType2 eq 'D' }">
			         								<td>대형세단</td>
			         							</c:when>
			         							<c:when test="${ i.trType2 eq 'S' }">
			         								<td>SUV</td>
			         							</c:when>
		         							</c:choose>
		         						<td>${ i.status }</td>
		         					</tr>
		         				</c:forEach>
		         			</tbody>
		         			</c:when>
		         			<c:otherwise>
		         			택시 예약내역이 없습니다.
		         			</c:otherwise>
		         		</c:choose>
		         	</table>
		         	<br>
		         		<h5>렌터카 예약</h5>
		         		<button class="btnn" style="margin-left:900px" onclick="deleteRes(2);">취소</button>
		         		<button class="btnn"><a class="aTag" href="transReservation">예약하러 가기</a></button>
		         		<br><br>
		         	<table id="carList">
		         		<c:choose>
		         		<c:when test="${ not empty cList }">
		         		<thead>
		         			<tr>
								<th width="100">선택</th>
								<th width="100">차번호</th>
								<th width="120">시작일</th>
								<th width="120">종료일</th>
								<th width="120">타입</th>
								<th width="120">결제일</th>
								<th width="120">카드번호</th>
								<th width="120">결제금액</th>
								<th width="80">상태</th>
		         			</tr>
		         		</thead>
		         		<tbody>
		         			<c:forEach var="c" items="${ cList }">
		         			<tr>
		         				<td>
		         					<c:choose>
		         						<c:when test="${c.status eq 'N'}">
		         						<input type="radio" value="${ c.carRno }" name="cRno" disabled>
		         						</c:when>
		         						<c:otherwise>
		         						<input type="radio" value="${ c.carRno }" name="cRno">
		         						</c:otherwise>
		         					</c:choose>
		         				</td>
		         				<td>${ c.trNo }</td>
		         				<td id="${c.carRno}startDate">${ c.startDate }</td>
		         				<td>${ c.endDate }</td>
		         				<c:choose>
         							<c:when test="${ c.trType22 eq 'J' }">
         								<td>중형세단</td>
         							</c:when>
         							<c:when test="${ c.trType22 eq 'D' }">
         								<td>대형세단</td>
         							</c:when>
         							<c:when test="${ c.trType22 eq 'S' }">
         								<td>SUV</td>
         							</c:when>
       							</c:choose>
		         				<td>${ c.trPaymentDate }</td>
		         				<td>${ c.trCardNo }</td>
		         				<td>${ c.trFee * c.reservationDay }</td>
		         				<td>${ c.status }</td>
		         			</tr>
		         			</c:forEach>
		         		</tbody>
		         		</c:when>
		         		<c:otherwise>
		         		렌터카 예약내역이 없습니다.
		         		</c:otherwise>
		         		</c:choose>
		         	</table>
		         
		        </div>
		        <br>
		        <div>
					<h5>카페 예약</h5>     
		         		<button class="btnn" style="margin-left:900px" onclick="deleteCafeRes();">취소</button>
		         		<button class="btnn"><a class="aTag" href="cafe.bo">예약하러 가기</a></button>
		         		<br><br>					   
		        	<table id="cafeList">
		         		<c:choose>
		         		<c:when test="${ not empty cpList }">
		         		<thead>
		         			<tr>
								<th width="100">선택</th>
								<th width="100">카페예약번호</th>
								<th width="120">카페번호</th>
								<th width="120">카페명</th>
								<th width="120">카페주소</th>
								<th width="120">예약일</th>
								<th width="120">예약시간</th>
								<th width="120">예약상태</th>
		         			</tr>
		         		</thead>
		         		<tbody>
		         			<c:forEach var="cp" items="${ cpList }">
		         			<tr>
		         				<td>
		         					<c:choose>
		         						<c:when test="${cp.cafeResStatus eq 'N'}">
		         						<input type="radio" value="${ cp.cafeResNo }" name="cafeResNo" disabled>
		         						</c:when>
		         						<c:otherwise>
		         						<input type="radio" value="${ cp.cafeResNo }" name="cafeResNo">
		         						</c:otherwise>
		         					</c:choose>
		         				</td>
		         				<td>${ cp.cafeResNo }</td>
		         				<td>${ cp.cafeNo }</td>
		         				<td>${ cp.cafeTitle }</td>
		         				<td>${ cp.cafeAddress }</td>
		         				<td>${ cp.resDate }</td>
		         				<td>${ cp.resTime }</td>
		         				<td>${ cp.cafeResStatus }</td>
		         			</tr>
		         			</c:forEach>
		         		</tbody>
		         		</c:when>
		         		<c:otherwise>
		         		카페 예약내역이 없습니다.
		         		</c:otherwise>
		         		</c:choose>		         				        	
		        	</table>
		        
		        </div>
			</div>
		</div>
	</div>
	
	<script>
	
	
		function deleteRes(num){
			
			if(num == 1){
				trType = 'T';
				resNo = $('input[name=tRno]:checked').val();
				console.log(resNo);
				taxiRDate = $('#'+resNo+'taxiRDate').text();
				taxiDay = taxiRDate.substr(-1);
				console.log(taxiDay);
				taxiMonth = taxiRDate.substr(3, 2);
				console.log(taxiMonth);
				let today = new Date();
				let month2 = today.getMonth()+1;
				let day2 = today.getDate();
				console.log(day2+'/'+month2+'/');
				
				if(month2 == taxiMonth && taxiDay-day2 < 2){
					
					if(month2 == taxiMonth && taxiDay-day2 < 0 ){
						alert('이미 지난 예약입니다.');
						return false;
					}
					
				alert('예약일 1일전부터는 취소가 불가능 합니다. 문의사항을 따로 남겨주세요.');
				return false;
					
				} 
					
			} else {
				
				trType = 'C';
				resNo = $('input[name=cRno]:checked').val();
				console.log(resNo);
				
				carSDate = $('#'+resNo+'startDate').text();
				console.log(carSDate);
				carDay = carSDate.substr(-1);
				console.log(carDay);
				carMonth = carSDate.substr(3, 2);
				console.log(carMonth);
				let today = new Date();
				let month2 = today.getMonth()+1;
				let day2 = today.getDate();
				
				if(month2 == carMonth && carDay-day2 < 2){
					
					if(month2 == carMonth && carDay-day2 < 0 ){
						alert('이미 지난 예약입니다.');
						return false;
					}
					
				alert('예약일 1일전부터는 취소가 불가능 합니다. 문의사항을 따로 남겨주세요.');
				return false;
					
				} 
				
				
			}
				
						$.ajax({
							url : 'deleteTRes',
							data : { resNo : resNo,
									 trType : trType	
									},
							success : function(result){
								console.log(result);
								if(result == 'Y'){
									alert('예약 취소가 완료 되었습니다.');
									location.href=location.href;
								
								} else {
									alert('예약 취소가 실패했습니다. 다시 시도해주세요');
								}
							},
							error : function(){
								console.log('취소 요청 실패');
							}
						})
					
				
		}
		
	</script>
	
	<script>
		function deleteCafeRes(){
			
			cafeResNo = $('input[name=cafeResNo]:checked').val();
			
			$.ajax({
				url : 'deleteCafeRes',
				data : { cafeResNo : cafeResNo },
				success : function(result){
					console.log(result);
					if(result == 'Y'){
						alert('예약 취소가 완료 되었습니다.');
						location.href=location.href;
					
					} else {
						alert('예약 취소가 실패했습니다. 다시 시도해주세요');
					}
				},
				error : function(){
					console.log('취소 요청 실패');
				}
			})
			
			
		}
	</script>
	
	
	

<div id="mypageFooter"><jsp:include page="../../common/footer.jsp" /></div>

</body>
</html>