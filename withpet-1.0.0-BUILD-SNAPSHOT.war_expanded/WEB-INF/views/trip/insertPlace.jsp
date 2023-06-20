<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    input::placeholder { font-size: 70%; }
    textarea::placeholder { font-size: 70%; }
</style>
</head>
<body>

 <div class="modal fade" id="placeModal" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
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
                        <button onclick="findXy();" type="button">주소 확인</button>
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
             <button type="submit" id="subBtn" class="btn btn-primary" style="width:80%; display:block; margin:auto; background-color: rgb(73, 166, 112); border: 1px rgb(73, 166, 112);"  disabled>장소 추가</button>
              </form>
       </div>
      
     </div>
   </div>
 </div>
	
 <script>
    function findXy(){

        $.ajax({
            url : 'findXY',
            data : {location : $('#placeLocation').val()},
            success : function(result){

                alert('주소 확인이 완료되었습니다.');
                let lat = result.results[0].geometry.location.lat;
				let lng = result.results[0].geometry.location.lng;
                $('#placeLat').val(lat);
                $('#placeLng').val(lng);
                console.log('xy찾기 성공! ');
                console.log('위도:' + lat + '/경도:' + lng);
                $('#subBtn').removeAttr('disabled');

            },
            error : function(){
                console.log('위도 경도 찾기 실패 ㅠㅠ');
            }
        })


    }


 </script>
	
	
</body>
</html>