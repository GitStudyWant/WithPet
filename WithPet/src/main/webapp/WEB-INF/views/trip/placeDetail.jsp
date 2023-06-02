<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>place detail</title>
</head>
<body>

 <div class="modal fade" id="placeDetailModal" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
   <div class="modal-dialog modal-dialog-centered">
     <div class="modal-content">
     
       <div class="modal-header" style="height:15px; background-color:lightgray">
         <h5 class="modal-title"></h5>
         <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
       </div>
       
       <div class="modal-body">
            <p class="modal-title" style="font-size:15px; text-align:center; margin-top:15px; margin-bottom:5px"><b>상세 정보</b></p>
            <br>
             <table width="100%" style="text-align:center">
             	 <tr>
                    <td style="font-size:13px; color:gray; width: 30px; height: 10px;" colspan="2" id="photo"></td>
                 </tr>
                 <tr>
                    <td style="font-size:13px; color:gray; width: 30px; height: 10px;">분류 : </td>
                    <td id="placeType"></td>
                 </tr>
                 <tr style="height: 10px;"></tr>
                 <tr style="margin-top:5px">
                     <td width="80" height="25" style="font-size:13px; color:gray; width: 30px">장소명 : </td>
                     <td width="100" id="placeName"></td>
                </tr>
                <tr style="height: 10px;"></tr>
                <tr style="margin-top:5px">
                     <td width="80" height="25" style="font-size:13px; color:gray; width: 30px">저장된 수 : </td>
                     <td width="100" id="placeCount"></td>
                </tr>
                 <tr style="height: 10px;"></tr>
                 <tr>
                     <td style="font-size:13px; color:gray; width: 30px">주소 : </td>
                     <td id="placeLocation"></td>
                 </tr>
                 <tr style="height: 10px;"></tr>
                 <tr>
                    <td style="font-size:13px; color:gray; width: 30px">연락처 : </td>
                    <td></td>
                </tr>
                <tr style="height: 10px;"></tr>
                <tr>
                     <td style="font-size:13px; color:gray; width: 30px">상세 정보 : </td>
                     <td>
                        <textarea name="placeInfo" style="resize: none; border:solid 1px lightgray; width: 90%; height: 200px;" readonly></textarea>
                    </td>
                </tr>
            
             </table>
       </div>
     </div>
   </div>
 </div>
	
 <script>
 	$(function(){
 		
 		console.log('$(this).children().eq(3).text()');
 		console.log(진입성공?);
 		
	 	$.ajax({
				url : 'detail.place',
				data : { placeNo : $(this).children().eq(3).text() },
				success : function(result){
					console.log(result);
					$('#placeName').text(result.placeName);
				},
				error : function(){
					console.log('상세 페이지 내용 불러오기 실패 ')
				}
			})
 	
 	
 	})
 	
 
 
 </script>
	
	
</body>
</html>