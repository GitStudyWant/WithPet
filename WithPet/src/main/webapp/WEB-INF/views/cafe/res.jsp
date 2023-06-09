<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<jsp:include page="../common/header.jsp"/>

<style>

.write_ty01 table {
    width: 100%;
    border: 1px solid #ebebeb;
    border-top: 1px solid #222222;
}
table {
    display: table;
    border-spacing: 0;
    border-collapse: collapse;
    font-size: 12px;
}
colgroup {
    display: table-column-group;
}
tr {
    display: table-row;
    padding: 0;
    margin: 0;
}

		 input::placeholder { font-size: 90%; }
		 
</style>

		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		
</head>
<body>
	
<br>
<h3 class="sub_title03 mt_38">애견카페 정보</h3><br>
	<div class="write_ty01 m_write_ty01 wr_type">
		<table border=1px;>
			<caption>애견카페 정보(애견카페 시설명)</caption>
			<colgroup>
				<col style="width: 18%">
				<col style="width: auto">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">시설명</th>
					<td>${c.cafeTitle}</td>
				</tr>
				
				<tr>
					<th scope="row">예약안내</th>
					<td>★예약방법
						<br>* 개인
						<br>- 중복예약, 대리예약 불가
						<br>
						<br>*단체
						<br>- 1일 1개소만 이용 가능
						<br>- 1회당 영유아 최대 12명 (인원 입력 시 인솔자 제외)
						<br>
						<br>* 부득이한 사정으로 이용이 어려울 시, 다른 이용자를 위해 반드시 예약을 취소해주시기 바랍니다.
						<br>* 노쇼 시 환불 X
						<br>
						<br>★ 당일 예약 방법
						<br>- 1회차 단체 이용이 없는 경우 : 전화예약 후 방문
						<br>- 2-3회차 이용을 희망할 경우 : 온라인 잔여석 확인 및 예약
						<br>* 해당 회차가 시작된 이후에는 전화 문의 부탁드립니다.
						<br>
						<br>★패널티 안내
						<br>- 당일 회차 시작 전 사전 연락없이 불참 시 패널티가 적용될 수 있습니다.
						<br>- 패널티 1회 적용 시 30일간 예약 및 이용이 불가합니다.
						<br>- 당일 취소 시 사전에 꼭 연락주세요
						<br>
						<br>★ 주차안내
						<br>해당 카페 이용안내를 확인하여 이용해주세요</td>
				</tr>
			</tbody>
		</table>
	</div>
<br>
<hr>
<h3 class="sub_title03 mt_38">예약 일자 및 시간 선택</h3>
<br>
 <div>
 <br><br>
 	<h1><b>${c.cafeTitle}</b></h1>
 	<br>
 	<tr>
 		<a><img src="${c.changeName}" style="width:600px; height:600px"/></a> <br>
 	</tr> 
 	<br><br>
 	<tr>
 		<th>카페주소 : </th>
 		<td>${c.cafeAddress}</td>
 	</tr>
 	<br><br>
 	<tr>
 		<th>서비스 : </th>
 		<td>${c.cafeService}</td>
 	</tr> 	
    <br><br>	  
    	  
 <button id="resCafe">카페 예약 하기</button>
 </div>
 
 
 <script>
	$('#resCafe').click(function(){
		 $('#cafeRes').modal("show");	
		 
	})
 
 </script>
 
 	<!-- 카페 예약 모달 -->
 	<div class="modal fade" id="cafeRes" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
   <div class="modal-dialog modal-dialog-centered">
     <div class="modal-content">
     
       <div class="modal-header" style="height:15px; background-color:lightgray">
         <h5 class="modal-title"></h5>
         <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
       </div>
       
       <div class="modal-body">
            <p class="modal-title" style="font-size:15px; text-align:center; margin-top:15px; margin-bottom:5px"><b>카페 예약하기</b></p>
            <br>
            <form action="cafeReservation" method="POST">
            <input type="hidden" name="memId" id="memId" value="${ loginMember.memId }">
             <table width="100%" style="text-align:center">
                 <tr style="height: 10px;"></tr>
                 <tr style="margin-top:5px">
                     <td height="25" style="font-size:13px; color:gray; width: 70px">예약일 : </td>
                     <td width="100"><input type="text" name="resDate" id="resDate" style="width:75%; border:solid 1px lightgray"></td>
                </tr>
                <tr style="height: 10px;"></tr>
                <tr style="margin-top:5px">
                     <td height="25" style="font-size:13px; color:gray; width: 70px">방문 시간 : </td>
                     <td width="100">
                     	<select style="width:75%; border:solid 1px lightgray" name="resTime" id="resTime">
                     		<option style="font-size:90%; color:gray;" value="5">10:00~12:00</option>  
                     		<option style="font-size:90%; color:gray;" value="7">12:00~14:00</option>  
                     		<option style="font-size:90%; color:gray;" value="9">14:00~16:00</option>  
                     		<option style="font-size:90%; color:gray;" value="11">16:00~18:00</option>  
                     		<option style="font-size:90%; color:gray;" value="12">18:00~20:00</option>  
                     	</select>
                     	
                     </td>
                </tr>
                 <tr style="height: 10px;"></tr>
                <tr style="height: 10px;"></tr>
                
                </table>
                
                <p style="font-size:15px; text-align:center;">*예약취소는 예약일 1일전까지 가능 합니다.</p>
              
             <button type="submit" style="margin-left: 200px; background-color:gray" id="submitBtn">예약하기</button>
            </form>
       </div>
     </div>
   </div>
 </div>







<script>
	$(function(){
		$('#resDate').click(function(){
			$('#resDate').datepicker({
			});
			var choiceDate = $('#resDate').val();
		})
		
	})
</script>

 <script>
	$('#goTReservation').click(function(){
		 $('#goResTaxi').modal("show");	
		 
	})
 
 </script>


</body>
</html>