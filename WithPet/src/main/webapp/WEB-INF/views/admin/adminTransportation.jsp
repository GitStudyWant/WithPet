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
			<h3 style="text-align:center;">교통 수단 관리</h1>	
			<hr>
			<button style="margin-left:800px" id="addBtn" class="btnn">추가</button>
			<button id="deleteBtn" class="btnn">삭제</button>
			<table id="naviTable" align="center" style="margin-left:50px">
				<thead>
					<tr>
						<th class="thHigh" width="50px">선택</th>
						<th class="thHigh">번호</th>
						<th class="thHigh">타입</th>
						<th class="thHigh">타입2</th>
						<th class="thHigh">요금(1일)</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${ not empty trList }">
						  	<c:forEach items="${trList}" var="i">
								<tr>
								<th><input type="radio" name="trNo" style="margin-left:20px" value="${ i.trNo }"/></th>
								<td>${ i.trNo }</td>
								<c:choose>
									<c:when test="${i.trType eq 'T' }">
										<td>펫택시</td>
									</c:when>
									<c:otherwise>
										<td>렌터카</td>
									</c:otherwise>
								</c:choose>
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
								<c:choose>
									<c:when test="${i.trFee ne 0 }">
										<td>${i.trFee}</td>
									</c:when>
									<c:otherwise>
										<td>-</td>
									</c:otherwise>
								</c:choose>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							등록된 교통수단이 없습니다.
						</c:otherwise>
				  </c:choose>		  
				</tbody>
			</table>
		</div>
	</div>		
	
	<script>
		
		$('#addBtn').click(function(){
			
			//var trNo = $('input[name=trNo]:checked').val();
			$('#goAddTr').modal("show");
			
		})
	
		
		$('#deleteBtn').click(function(){
			if(confirm('선택한 교통수단을 삭제하시겠습니까?')){
				$.ajax({
					url : 'deleteTr',
					data : {trNo : $('input[name=trNo]:checked').val()},
					success : function(result){
						console.log(result);
						if(result == 'Y'){
							alert('성공적으로 삭제 되었습니다.');
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
	
	<div id="mypageFooter"><jsp:include page="../common/footer.jsp" /></div>
	
	
	
	
	
	<!-- 추가 모달창 -->
<div class="modal fade" id="goAddTr" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
   <div class="modal-dialog modal-dialog-centered">
     <div class="modal-content">
     
       <div class="modal-header" style="height:15px; background-color:lightgray">
         <h5 class="modal-title"></h5>
         <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
       </div>
       
       <div class="modal-body">
            <p class="modal-title" style="font-size:15px; text-align:center; margin-top:15px; margin-bottom:5px"><b>교통수단 추가하기</b></p>
            <br>
            <form action="goAddTr" method="POST">
             <table width="100%" style="text-align:center">
             	<tr>
                    <td style="font-size:13px; color:gray; height: 10px; width:70px">타입 선택 : </td> 
                    <td style="font-size:13px; color:gray; width: 75%;">
                    <select name="trType" id="trType">
                    	<option value="T">펫택시</option>
                    	<option value="C">렌터카</option>
                    </select>
                 </tr>
             	 <tr style="height: 10px;"></tr>
                 <tr>
                    <td style="font-size:13px; color:gray; height: 10px; width:70px">타입2 선택 : </td> 
                    <td style="font-size:13px; color:gray; width: 75%;"><input type="radio" name="trType2" value="J" checked> 중형세단   
                    	<input type="radio" name="trType2" value="D"> 대형 세단 <input type="radio" name="trType2" value="S"> SUV </td>
                 </tr>
                 <tr style="height: 10px;"></tr>
                  <tr>
                    <td style="font-size:13px; color:gray; height: 10px; width:70px">1일 요금 : </td> 
                    <td style="font-size:13px; color:gray; width: 75%;"><input type="text" style="width:75%" id="trFee" name="trFee" value="0">  
                 </tr>
                <tr style="height: 10px;"></tr>
                </table>
             <button type="submit" style="margin-left: 200px;" id="submitBtn2" onclick="return goAdd();" class="btnn">추가하기</button>
            </form>
       </div>
     </div>
   </div>
 </div>
	
	
	
	
	
</body>
</html>