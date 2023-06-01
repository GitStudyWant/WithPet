<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버모달</title>
                
	<style>
	 	#kakaoLoginButton:hover {cursor:pointer}
	 	#naverLoginButton:hover {cursor:pointer}
	</style>
</head>
<body>
	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js" integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>
	<script>
		Kakao.init('261f64346cb2da405692b542c232a7d3&');
	</script>

	<div class="modal fade" id="loginModal" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" data-bs-backdrop="static" tabindex="-1">
 	   <div class="modal-dialog modal-dialog-centered">
	      <div class="modal-content">
	      
	        <div class="modal-header" style="height:15px; background-color:lightgray">
	          <h5 class="modal-title"></h5>
	          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	        </div>
	        
	        <div class="modal-body">
	        
	          <p class="modal-title" style="font-size:15px; text-align:center; margin-top:15px; margin-bottom:30px">회원 로그인</p>
	          <form action="login.me" method="POST">
	          	<table width="100%" style="text-align:center">
		          	<tr>
		          		<td width="80"><p style="font-size:10px; color:gray; margin-top:12px">ID</p></td>
		          		<td width="100"><input type="text" name="memId" style="width:100%; border:solid 1px lightgray"></td>
		          	<tr>
		          	<tr>
			          	<td><p style="font-size:10px; color:gray; margin-top:12px">Password</p></td>
			          	<td><input type="text" name="memPwd" style="width:100%; border:solid 1px lightgray"></td>
		          	</tr>
	          	</table>
	          	<button type="submit" class="btn btn-primary" style="width:80%; margin:35px 50px">로그인</button>
	       		</form>
	       		
	          	<img src="https://i.postimg.cc/B6cfdvKx/kakao-Login-Button.png" id="kakaoLoginButton" onclick="kakaoLogin()" style="display:block; margin:auto; height:40%; width:50%;">
	          	<div style="height:10px"></div>
				<img src="https://i.postimg.cc/VLNPVmLC/naver-Login-Button.png" id="naverLoginButton" onclick="naverLogin()" style="display:block; margin:auto; height:40%; width:50%;">
				
	        </div>
	        
	        <div class="modal-footer">
	        <div style="margin:auto">
	          <button type="button" class="btn btn-secondary" data-bs-target="#joinModal" data-bs-toggle="modal" id="insertMember">회원가입</button>
	          <button type="button" class="btn btn-secondary" data-bs-target="#idFind" data-bs-toggle="modal">아이디 찾기</button>
	          <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#pwdFind">비밀번호 찾기</button>
	        </div>
	        </div>
	      
	      </div>
	    </div>
	  </div>
	  
	  <div class="modal fade" id="joinModal" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" data-bs-backdrop="static" tabindex="-1">
 	   <div class="modal-dialog modal-dialog-centered">
	      <div class="modal-content">
	      
	        <div class="modal-header" style="height:15px; background-color:lightgray">
	          <h5 class="modal-title"></h5>
	          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	        </div>
	        
	        <div class="modal-body">
	       	  <p class="modal-title" style="font-size:15px; text-align:center; margin-top:15px; margin-bottom:5px">회원 가입</p>
	          <form action="insert.me" method="POST">
	          	<table width="100%" style="text-align:center">
		          	<tr style="margin-top:5px">
		          		<td width="80" height="10"><p style="font-size:10px; color:gray;"><img id="memIdImg" src="https://i.postimg.cc/0j8WNTkS/graycheck.png" width="14px" height="14px">
		          		ID</p></td>
		          		<td width="100"><input type="text" maxlength="15" id="memId" name="memId" style="width:100%; border:solid 1px lightgray"></td>
		          	<tr>
		          	<tr>
		          		<td height="17"></td>
		          		<td><p id="idCheck" style="font-size:3px; color:gray; margin-bottom:0px;">5글자 이상 입력해주세요</p></td>
		          	<tr>
		          	<tr>
			          	<td><p style="font-size:10px; color:gray;"><img id="memNickImg" src="https://i.postimg.cc/0j8WNTkS/graycheck.png" width="14px" height="14px">
			          	NICKNAME</p></td>
			          	<td><input type="text" id="memNick" name="memNick" maxlength="15" style="width:100%; border:solid 1px lightgray"></td>
		          	</tr>
		          	<tr>
		          		<td height="17"></td>
		          		<td><p id="nickCheck" style="font-size:3px; color:gray; margin-bottom:0px;">3글자 이상 입력해주세요</p></td>
		          	<tr>
		          	<tr>
			          	<td><p style="font-size:10px; color:gray;"><img class="memPwdImg" src="https://i.postimg.cc/0j8WNTkS/graycheck.png" width="14px" height="14px">
			          	PASSWORD</p></td>
			          	<td><input type="password" id="memPwd" name="memPwd" maxlength="15" style="width:100%; border:solid 1px lightgray"></td>
		          	</tr>
		          	<tr>
		          		<td height="17"></td>
		          		<td><p class="pwdCheck" style="font-size:3px; color:gray; margin-bottom:0px;">8글자 이상 입력해주세요</p></td>
		          	<tr>
		          	<tr>
			          	<td><p style="font-size:10px; color:gray;"><img class="memPwdImg" src="https://i.postimg.cc/0j8WNTkS/graycheck.png" width="14px" height="14px">
			          	PASSWORD CHECK</p></td>
			          	<td><input type="password" id="memPwd2" name="memPwd2" maxlength="15" style="width:100%; border:solid 1px lightgray"></td>
		          	</tr>
		          	<tr>
		          		<td height="17"></td>
		          		<td><p class="pwdCheck" style="font-size:3px; color:gray; margin-bottom:0px;">8글자 이상 입력해주세요</p></td>
		          	<tr>
		          	<tr>
			          	<td><p style="font-size:10px; color:gray;"><img id="memPhoneImg" src="https://i.postimg.cc/0j8WNTkS/graycheck.png" width="14px" height="14px">
			          	PHONE</p></td>
			          	<td><input type="text" id="memPhone" name="memPhone" maxlength="11" style="width:100%; border:solid 1px lightgray"></td>
		          	</tr>
		          	<tr>
		          		<td height="17"></td>
		          		<td><p id="phoneCheck" style="font-size:3px; color:gray; margin-bottom:0px; display:none;"></p></td>
		          	<tr>
		          	<tr>
			          	<td><p style="font-size:10px; color:gray;"><img id="memEmailImg" src="https://i.postimg.cc/0j8WNTkS/graycheck.png" width="14px" height="14px">
			          	EMAIL</p></td>
			          	<td><input type="Email" id="memEmail" name="memEmail" maxlength="30" style="width:100%; border:solid 1px lightgray"></td>
		          	</tr>
		          	<tr>
		          		<td height="17"></td>
		          		<td><p style="font-size:3px; color:gray; margin-bottom:0px; display:none;"></p></td>
		          	<tr>
		          	<input type="hidden" name="memKakaoId" value="${sessionScope.kakaoId}">
	          	</table>
	          	<button id="insertFormButton" type="submit" class="btn btn-primary" style="width:80%; display:block; margin:auto" disabled>회원 가입</button>
	       		</form>
	        </div>
	        
	        <div class="modal-footer">
	        <div style="margin:auto">
	          <button type="button" class="btn btn-secondary"data-bs-target="#loginModal" data-bs-toggle="modal">로그인 창으로</button>
	        </div>
	        </div>
	      </div>
	    </div>
	  </div>
	  
	  <script>
	  	$(function(){
	    	
	  		if('${sessionScope.kakaoId}' != ""){
	  			$.ajax({
 		 	    	url : "kakaoLogin.me",
 		 	    	type : 'POST',
 		 	    	data : {kakaoId : '${sessionScope.kakaoId}'},
 		 	    	success : function(result){
 		 	    		if(result == "1"){
 		 	    			location.href = "http://localhost:8787/withpet";
 		 	    		} else{
 		 	    			$('#insertMember').click();
 		 	    		}
 		 	    	}
 		    	})
	  		}
	  	})
	  	
	  	$('.btn-close').on('click', function(){
	  		location.href = "http://localhost:8787/withpet/deleteKakaoId"
	  	})
	  	
	  	
	    function kakaoLogin(){	    	
	    	$.ajax({
	 	    	url : "kakaoGetCodeUrl",
	 	    	type : 'GET',
	 	    	data : {},
	 	    	success : function(result){
	 	    		location.href = result;
	 	    	}
	    	})	    	
	 	};
    </script>
    
    <script>
    	<!-- 회원가입 -->
    	var buttonEnable
    	
   		var buttonEnable1;
   		var buttonEnable2;
   		var buttonEnable3;
   		var buttonEnable4;
   		var buttonEnable5;
   		
    	function buttonEnableCheck(){
    		buttonEnable = buttonEnable1 + buttonEnable2 + buttonEnable3 + buttonEnable4 + buttonEnable5;
    		
    		if(buttonEnable == 5){
    			$('#insertFormButton').removeAttr("disabled");
    		} else{
    			$('#insertFormButton').attr("disabled", true);
    		}
    	}
    	
    	$('#memId').on('keyup', function(){
    		if($(this).val().length >= 5){
	    		var empty = $(this).val();
	    		
	    		$.ajax({
	    			url : "idCheck.me",
	    			data : {checkId : $(this).val()},
	    			success : function(result){
	    				if(empty != "" && result == '0'){
	    					$('#idCheck').show();
	    					$('#idCheck').css('color', 'lightgreen').text('멋진 아이디네요!');
	    					$('#memIdImg').attr('src', 'https://i.postimg.cc/BvHMBStD/bluecheck.png');
	    					buttonEnable1 = 1;
	    				} else if(empty != "" && result == '1'){
	    					$('#idCheck').show();
	    					$('#idCheck').css('color', 'red').text('중복된 아이디가 존재합니다.');
	    					$('#memIdImg').attr('src', 'https://i.postimg.cc/0j8WNTkS/graycheck.png');
	    					buttonEnable1 = 0;
	    				} else{
	    					$('#idCheck').hide();
	    					$('#memIdImg').attr('src', 'https://i.postimg.cc/0j8WNTkS/graycheck.png');
	    					buttonEnable1 = 0;
	    				}
	    			}
	    		})
    		} else{
    			$('#idCheck').hide();
				$('#memIdImg').attr('src', 'https://i.postimg.cc/0j8WNTkS/graycheck.png');
				buttonEnable1 = 0;
    		}
    		
			buttonEnableCheck();
			
    	})
    	
    	$('#memNick').on('keyup', function(){
    		if($(this).val().length >= 3){
	    		var empty = $(this).val();
	    		
	    		$.ajax({
	    			url : "nickCheck.me",
	    			data : {checkNick : $(this).val()},
	    			success : function(result){
	    				if(empty != "" && result == '0'){
	    					$('#nickCheck').show();
	    					$('#nickCheck').css('color', 'lightgreen').text('멋진 닉네임이네요!');
	    					$('#memNickImg').attr('src', 'https://i.postimg.cc/BvHMBStD/bluecheck.png');
	    					buttonEnable2 = 1;
	    				} else if(empty != "" && result == '1'){
	    					$('#nickCheck').show();
	    					$('#nickCheck').css('color', 'red').text('중복된 닉네임이 존재합니다.');
	    					$('#memNickImg').attr('src', 'https://i.postimg.cc/0j8WNTkS/graycheck.png');
	    					buttonEnable2 = 0;
	    				} else{
	    					$('#nickCheck').hide();
	    					$('#memNickImg').attr('src', 'https://i.postimg.cc/0j8WNTkS/graycheck.png');
	    					buttonEnable2 = 0;
	    				}
	    			}
	    		})
    		} else{
    			$('#nickCheck').hide();
				$('#memNickImg').attr('src', 'https://i.postimg.cc/0j8WNTkS/graycheck.png');
				buttonEnable2 = 0;
    		}
	    	
    		buttonEnableCheck();
    		
    	})
    	
    	$('#memPhone').on('keyup', function(){
    		if($(this).val().length == 11){
	    		var empty = $(this).val();
	    		
	    		$.ajax({
	    			url : "phoneCheck.me",
	    			data : {checkPhone : $(this).val()},
	    			success : function(result){
	    				if(empty != "" && result == '0'){
	    					$('#memPhoneImg').attr('src', 'https://i.postimg.cc/BvHMBStD/bluecheck.png');
	    					buttonEnable4 = 1;
	    				} else if(empty != "" && result == '1'){
	    					$('#phoneCheck').show();
	    					$('#phoneCheck').css('color', 'red').text('중복된 번호가 존재합니다.');
	    					$('#memPhoneImg').attr('src', 'https://i.postimg.cc/0j8WNTkS/graycheck.png');	
	    					buttonEnable4 = 0;
	    				} else{
	    					$('#phoneCheck').hide();
	    					$('#memPhoneImg').attr('src', 'https://i.postimg.cc/0j8WNTkS/graycheck.png');
	    					buttonEnable4 = 0;
	    				}
	    			}
	    		})
    		} else{
    			$('#phoneCheck').hide();
				$('#memPhoneImg').attr('src', 'https://i.postimg.cc/0j8WNTkS/graycheck.png');
				buttonEnable4 = 0;
    		}
    		
    		buttonEnableCheck();
    		
    	})
    	
    	$('#memEmail').on('keyup', function(){
    		if($(this).val().includes("@")){
	    		var empty = $(this).val();
	    		
	    		$.ajax({
	    			url : "emailCheck.me",
	    			data : {checkEmail : $(this).val()},
	    			success : function(result){
	    				if(empty != "" && result == '0'){
	    					$('#memEmailImg').attr('src', 'https://i.postimg.cc/BvHMBStD/bluecheck.png');
	    					buttonEnable5 = 1;
	    				} else if(empty != "" && result == '1'){
	    					$('#emailCheck').show();
	    					$('#emailCheck').css('color', 'red').text('중복된 메일이 존재합니다.');
	    					$('#memEmailImg').attr('src', 'https://i.postimg.cc/0j8WNTkS/graycheck.png');
	    					buttonEnable5 = 0;
	    				} else{
	    					$('#emailCheck').hide();
	    					$('#memEmailImg').attr('src', 'https://i.postimg.cc/0j8WNTkS/graycheck.png');
	    					buttonEnable5 = 0;
	    				}
	    			}
	    		})
    		} else{
    			$('#emailCheck').hide();
				$('#memEmailImg').attr('src', 'https://i.postimg.cc/0j8WNTkS/graycheck.png');
				buttonEnable5 = 0;
    		}
    		
    		buttonEnableCheck();
    		
    	})
    	
    	$('#memPwd').on('keyup', function(){
    		if($(this).val().length >= 8 ){
	    		if($('#memPwd').val()!=$('#memPwd2').val()){
	    			$('.pwdCheck').show();
	    			$('.pwdCheck').css('color', 'red').text('비밀번호가 일치하지 않습니다');
	    			$('.memPwdImg').attr('src', 'https://i.postimg.cc/0j8WNTkS/graycheck.png');
	    			buttonEnable3 = 0;
	    		} else{    			
	    			$('.pwdCheck').hide();
	    			$('.memPwdImg').attr('src', 'https://i.postimg.cc/BvHMBStD/bluecheck.png');
	    			buttonEnable3 = 1;
	    		}
    		} else{
    			$('.pwdCheck').hide();
    			$('.memPwdImg').attr('src', 'https://i.postimg.cc/0j8WNTkS/graycheck.png');
    			buttonEnable3 = 0;
    		}
    		
    		buttonEnableCheck();
    		
    	})
    	
    	$('#memPwd2').on('keyup', function(){
    		if($(this).val().length >= 8 ){
	    		if($('#memPwd').val()!=$('#memPwd2').val()){
	    			$('.pwdCheck').show();
	    			$('.memPwdImg').attr('src', 'https://i.postimg.cc/0j8WNTkS/graycheck.png');
	    			buttonEnable3 = 0;
	    		} else{    			
	    			$('.pwdCheck').hide();
	    			$('.memPwdImg').attr('src', 'https://i.postimg.cc/BvHMBStD/bluecheck.png');
	    			buttonEnable3 = 1;
	    		}	
    		} else{
    			$('.pwdCheck').hide();
    			$('.memPwdImg').attr('src', 'https://i.postimg.cc/0j8WNTkS/graycheck.png');
    			buttonEnable3 = 0;
    		}
    		
    		buttonEnableCheck();
    		
    	})
    </script>

</body>
</html>