<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장소 관리하기</title>
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
			<h3 style="text-align:center;">코스 장소 관리</h3>	
			<hr>
			<br>
			<button id="addBtn" style="margin-left:900px" class="btnn">추가</button>
			<button id="modifyBtn" class="btnn">수정</button>
			<button id="deleteBtn" class="btnn">삭제</button>
			<table id="naviTable" align="center" style="margin-left:50px">
				<thead>
					<tr>
						<th class="thHigh" width="40px">선택</th>
						<th class="thHigh" width="90px">번호</th>
						<th class="thHigh" width="90px">타입</th>
						<th class="thHigh" width="90px">장소명</th>
						<th class="thHigh" width="110px">주소</th>
						<th class="thHigh" width="110px">연락처</th>
						<th class="thHigh" width="110px">정보</th>
						<th class="thHigh" width="90px">사진</th>
						<th class="thHigh" width="80px">저장수</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${ not empty pList }">
						  	<c:forEach items="${pList}" var="i">
								<tr>
								<th><input type="radio" name="placeNo" style="margin-left:20px" value="${ i.placeNo }"/></th>
								<td>${ i.placeNo }</td>
								<td>
								<c:choose>
									<c:when test="${i.placeType eq 'A' }">
										<select>
											<option disabled selected value="식당/카페">식당/카페</option>
										</select>
									</c:when>
									<c:when test="${i.placeType eq 'B' }">
										<select>
											<option disabled selected value="숙박">숙박</option>
										</select>
									</c:when>
									<c:when test="${i.placeType eq 'C' }">
										<select>
											<option disabled selected value="야외시설">야외시설</option>
										</select>
									</c:when>
								</c:choose>
								</td>
								<td>${ i.placeName }</td>
								<td>${ i.placeLocation }</td>
								<td>${ i.placePhone }</td>
								<td>${ i.placeInfo }</td>
								<td>
										<input type="hidden" value="${i.placeChangeName}">
										<input type="hidden" value="${i.placeOriginName}">
								<c:choose>
									<c:when test="${ !empty i.placeChangeName  }">
										<button class="btnn" onclick="window.open('${i.placeChangeName}')">사진 보기</button>
									</c:when>
									<c:otherwise>
										-
									</c:otherwise>
								</c:choose>
								</td>
								<td>${ i.placeCount }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							등록된 장소가 없습니다.
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
         				<button class="btn btn-success" onclick="location.href='adminPlaceList?cPage=${ pi.currentPage - 1 }'">&lt</button>
         			</c:otherwise>
          		</c:choose>
             	<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
             		<button class="btn btn-success" onclick="location.href='adminPlaceList?cPage=${p}'">${ p }</button>
              	</c:forEach>
              	<c:choose>
         			<c:when test="${ pi.currentPage eq pi.maxPage }">
            			<button class="btn btn-success">&gt</button>
              		</c:when>
               		<c:otherwise>
               			<button class="btn btn-success" onclick="location.href='adminPlaceList?cPage=${pi.currentPage+1}'">&gt</button>
               		</c:otherwise>
               	</c:choose>
	
			</div>
	</div>		
	
	<script>
	
		$('#addBtn').click(function(){
			$('#addPlace').modal("show");
		})
		
	
		$('#deleteBtn').click(function(){
			if(confirm('선택한 장소를 삭제 처리 하시겠습니까?')){
				
				$.ajax({
					url : 'deletePlace',
					data : {placeNo : $('input[name=placeNo]:checked').val()},
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

		
	$('#modifyBtn').click(function(){
		
		var click = $('input[name=placeNo]:checked');
		var placeNo = $('input[name=placeNo]:checked').val();
		var placeType = click.parent().next().next().children().children().val();
		var placeName = click.parent().next().next().next().text();
		var placeLocation = click.parent().next().next().next().next().text();
		var placePhone = click.parent().next().next().next().next().next().text();
		var placeInfo = click.parent().next().next().next().next().next().next().text();
		var changeName = click.parent().next().next().next().next().next().next().next().children().eq(0).val();
		var originName = click.parent().next().next().next().next().next().next().next().children().eq(1).val();
		//console.log(placeInfo);
		
		$('#MplaceNo').val(placeNo);
		$('#MplaceName').val(placeName);
		$('#MplaceLocation').val(placeLocation);
		$('#MplacePhone').val(placePhone);
		$('#MplaceInfo').text(placeInfo);
		$('#MplaceType').val(placeType).attr('selected', true);
		$('#originFile').val(changeName);
		$('#originFile2').val(originName);
		
		console.log($('#originFile').val());
		$('#modifyPlace').modal("show");
		
	})
	
	
	function findXy(num){
			
			var location;
			var placeLat;
			var placeLng;
			var sbuBtn;
			
			if(num == 1){
				
				location = $('#placeLocation').val();
				placeLat = $('#placeLat');
				placeLng = $('#placeLng');
				subBtn = $('#subBtn'); 
				
			} else {
				
				location = $('#MplaceLocation').val();
				placeLat = $('#MplaceLat');
				placeLng = $('#MplaceLng');
				subBtn = $('#MsubBtn');
				
			}
			
			 $.ajax({
		            url : 'findXY',
		            data : {location : location },
		            success : function(result){

		                alert('주소 확인이 완료되었습니다.');
		                let lat = result.results[0].geometry.location.lat;
						let lng = result.results[0].geometry.location.lng;
		                placeLat.val(lat);
		                placeLng.val(lng);
		                console.log('xy찾기 성공! ');
		                console.log('위도:' + lat + '/경도:' + lng);
		                subBtn.removeAttr('disabled').css('background-color','rgb(73, 166, 112)');

		            },
		            error : function(){
		                console.log('위도 경도 찾기 실패 ㅠㅠ');
		            }
		        })
			
		}
		
		
		function goModify(){
			
			if($('#MplaceLat').val() == ''){
				alert('주소 확인 버튼 클릭하여 변경할 주소 확인 진행을 해주세요.')
				return false;
			} else {
				return true;
			}
			
		}
		
		function resetLocation(){
			if(confirm('주소를 변경하시겠습니까?')){
				$('#MplaceLocation').attr('readonly',false).val('');
				$('#MplaceLat').val('');
				$('#MplaceLng').val('');
				$('#MsubBtn').attr('disabled',true).css('background-color','gray');
			} 
		}
	
	</script>
	
	<div id="mypageFooter"><jsp:include page="../common/footer.jsp" /></div>
	
	
	
	<!-- 추가 모달창 -->
	 <div class="modal fade" id="addPlace" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
   <div class="modal-dialog modal-dialog-centered">
     <div class="modal-content">
     
       <div class="modal-header" style="height:15px; background-color:lightgray">
         <h5 class="modal-title"></h5>
         <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
       </div>
       
       <div class="modal-body">
            <p class="modal-title" style="font-size:15px; text-align:center; margin-top:15px; margin-bottom:5px"><b>새 장소 추가</b></p>
            <br>
         <form action="insertPlace" method="POST" enctype="multipart/form-data">
             <table width="100%" style="text-align:center">
                 <tr>
                    <td style="font-size:13px; color:gray; width: 30px; height: 10px;">타입 선택</td>
                    <td>
                        <select name="placeType" style="font-size: 12px; color:gray;">
                            <option value="A">식당/카페</option>
                            <option value="B">숙박</option>
                            <option value="C">야외시설</option>
                        </select>
                    </td>
                 </tr>
                 <tr style="height: 10px;"></tr>
                 <tr style="margin-top:5px">
                     <td width="80" height="25" style="font-size:13px; color:gray; width: 30px">
                     장소명</td>
                     <td width="100"><input type="text" maxlength="15" id="placeName" name="placeName" required style="width:90%; border:solid 1px lightgray"></td>
                </tr>
                <tr style="height: 10px;"></tr>
                 <tr>
                     <td style="font-size:13px; color:gray; width: 30px">주소 </td>
                     <td>
                        <input type="text" name="placeLocation" id="placeLocation" required style="width:70%; border:solid 1px lightgray" placeholder="도로명 주소로 정확히 입력해주세요">
                        <button onclick="findXy(1);" class="btnn" type="button">주소 확인</button>
                        <input type="hidden" name="placeLat" id="placeLat">
                        <input type="hidden" name="placeLng" id="placeLng">
                    </td>
                 </tr>
                 <tr style="height: 10px;"></tr>
                 <tr>
                     <td style="font-size:13px; color:gray; width: 30px">
                    사진 등록</td>
                     <td>
                        <input type="file" id="upfile" name="upfile" style="width:90%; border:solid 1px lightgray; font-size:13px; color:gray; ">
                    </td>
                 </tr>
                 <tr style="height: 10px;"></tr>
                 <tr>
                    <td style="font-size:13px; color:gray; width: 30px">
                   연락처</td>
                    <td>
                       <input type="text" name="placePhone" style="width:90%; border:solid 1px lightgray; font-size:13px; color:gray; ">
                   </td>
                </tr>
                <tr style="height: 10px;"></tr>
                 <tr>
                     <td style="font-size:13px; color:gray; width: 30px">
                     상세 정보</td>
                     <td>
                        <textarea name="placeInfo" style="resize: none; border:solid 1px lightgray; width: 90%; height: 200px;" placeholder="관련해서 추가 정보를 입력해주세요!"></textarea>
                    </td>
                </tr>
            
             </table>
             <button type="submit" id="subBtn" class="btnn" style="width:80%; display:block; margin:auto; background-color: rgb(73, 166, 112); border: 1px rgb(73, 166, 112);"  disabled>장소 추가</button>
              </form>
       </div>
      
     </div>
   </div>
 </div>

	<!-- 수정 모달창 -->
	<div class="modal fade" id="modifyPlace" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
   <div class="modal-dialog modal-dialog-centered">
     <div class="modal-content">
     
       <div class="modal-header" style="height:15px; background-color:lightgray">
         <h5 class="modal-title"></h5>
         <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
       </div>
       
       <div class="modal-body">
            <p class="modal-title" style="font-size:15px; text-align:center; margin-top:15px; margin-bottom:5px"><b>장소 수정하기</b></p>
            <br>
         <form action="modifyPlace" method="POST" enctype="multipart/form-data">
         	<input type="hidden" name="placeNo" id="MplaceNo">
             <table width="100%" style="text-align:center">
                 <tr>
                    <td style="font-size:13px; color:gray; width: 30px; height: 10px;">타입</td>
                    <td>
                        <select name="placeType" id="MplaceType" style="font-size: 12px; color:gray;">
                            <option value="식당/카페">식당/카페</option>
                            <option value="숙박">숙박</option>
                            <option value="야외시설">야외시설</option>
                        </select>
                    </td>
                 </tr>
                 <tr style="height: 10px;"></tr>
                 <tr style="margin-top:5px">
                     <td width="80" height="25" style="font-size:13px; color:gray; width: 30px">
                     장소명</td>
                     <td width="100"><input type="text" maxlength="15" id="MplaceName" name="placeName" required style="width:90%; border:solid 1px lightgray"></td>
                </tr>
                <tr style="height: 10px;"></tr>
                 <tr>
                     <td style="font-size:13px; color:gray; width: 30px">주소 </td>
                     <td>
                        <input type="text" name="placeLocation" id="MplaceLocation" required style="width:50%; border:solid 1px lightgray" readonly>
                        <button onclick="resetLocation();" type="button" class="btnn">주소 수정</button>
                        <button onclick="findXy(2);" type="button" class="btnn">주소 확인</button>
                        <input type="hidden" name="placeLat" id="MplaceLat" value="A">
                        <input type="hidden" name="placeLng" id="MplaceLng" value="A">
                    </td>
                 </tr>
                 <tr style="height: 10px;"></tr>
                 <tr>
                     <td style="font-size:13px; color:gray; width: 30px">
                    사진 등록</td>
                     <td>
                     	<input type="hidden" id="originFile" name="placeChangeName">
                     	<input type="hidden" id="originFile2" name="placeChangeName">
                        <input type="file" id="Mupfile" name="upfile" style="width:90%; border:solid 1px lightgray; font-size:13px; color:gray; ">
                    </td>
                 </tr>
                 <tr style="height: 10px;"></tr>
                 <tr>
                    <td style="font-size:13px; color:gray; width: 30px">
                   연락처</td>
                    <td>
                       <input type="text" name="placePhone" id="MplacePhone" style="width:90%; border:solid 1px lightgray; font-size:13px; color:gray; ">
                   </td>
                </tr>
                <tr style="height: 10px;"></tr>
                 <tr>
                     <td style="font-size:13px; color:gray; width: 30px">
                     상세 정보</td>
                     <td>
                        <textarea name="placeInfo" id="MplaceInfo" style="resize: none; border:solid 1px lightgray; width: 90%; height: 200px;" placeholder="관련해서 추가 정보를 입력해주세요!"></textarea>
                    </td>
                </tr>
            
             </table>
             <button type="submit" id="MsubBtn" class="btnn" style="width:80%; display:block; margin:auto;" onclick="return goModify();">수정하기</button>
              </form>
       </div>
      
     </div>
   </div>
 </div>
	

	
</body>
</html>