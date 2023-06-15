<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정</title>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

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
	
	#modifyFooter{
		margin-top:1000px;
	}
	
	#body>p{
		margin-top:15px;
		text-align:center;
		font-size:35px;
	}

	#modifymain{
		width : 100%;
		height : 1000px;
		padding-top : 15px;
		float:left;
	}
	
	#modifymain p{
		font-size:25px;
		margin-left:60px;
	}
	
	#modifyDiv{
		height:500px;
		text-align:center;
	}
	
	#modifyDiv table{
		width : 300px;
		margin : auto;
		margin-top : 10px;
	}
	
	#modifyDiv td{
		height : 40px;
	}
	
	#modifyDiv #profileTd{
		height : 100px;
	}
	
	#modifyDiv .checkTd{
		height : 10px;
	}
	
	#modifyDiv p{
		font-size : 10px;
		color : gray;
		margin : auto;
	}
	
	#modifyDiv input{
		height : 25px;
		width : 100%;
		border : none;
		font-size : 12px;
	}
	
	#modifyDiv textarea{
		height : 100%;
		width : 100%;
		resize : none;
		border : 1px solid silver;
		font-size : 12px;
	}
	
	#profileImg{
        width : 90%;
        height : 90%;
        border-radius: 100px;
    }

</style>
</head>
<body>
	<div id="memoSide"><jsp:include page="../../common/myPageSide.jsp" /></div>
	<div id="memoSendback"><jsp:include page="../../common/sendBack.jsp" /></div>
	
	<div id="body">	
		<div id="modifymain">
			<form action="updateMember" method="Post" enctype="multipart/form-data">
			  <div>
			  	<p style="font-size:15px; text-align:center; margin:0px">정보수정</p>
			  </div>
			  <div id="modifyDiv">
		    		<table style="width:65%">
		    			<tr>
		    				<td width="20%" id="profileTd"><p>PROFILE</p></td>
		    				<td width="30%"><div align="center">
		    				<div style="width:100%; height:100%">
			    				<c:choose>
			    				<c:when test="${loginMember.memPath != null}">
			    				<img id="profileImg" src="${loginMember.memPath}" alt="프로필사진">
			    				</c:when>
			    				<c:otherwise>
			    				<img id="profileImg" src="https://moyeoyou.kr/assets/common/img/user/default_photo.jpg" alt="프로필사진">
			    				</c:otherwise>
			    				</c:choose>
		    				</div>
		    				</div></td>
		    				<td width="50%" style="text-align:right">
		    				<input class="btn btn-primary" type="button" style="width:60px; height:30px; font-size:14px; margin:0px; padding:0px" onclick="profileImgButton()" value="사진등록">
		    				<input class="btn btn-primary" type="file" style="display:none" id="profileImgFile" onchange="loadProfileImg(this)" value="등록" name="profileImgData">
		    				</td>
		    			</tr>
		    			<tr>
		    				<td><p>ID </p><p style="color:skyblue">수정불가</p></td>
		    				<td colspan="2"><input type="text" name="memId" id="UmemId" value="${loginMember.memId}" readonly></td>
		    			</tr>
		    			<tr>
		    				<td><p>NICKNAME</p></td>
		    				<td colspan="2"><input type="text" name="memNick" id="UmemNick" value="${loginMember.memNick}"></td>
		    			</tr>
		    			<tr id="UnickCheck">
		          			<td colspan="3" class="checkTd"><p style="font-size:3px; margin:auto"></p></td>
		          		<tr>
		    			<tr>
		    				<td><p>NEW PASSWORD</p></td>
		    				<td colspan="2"><input type="password" name="memPwd" id="UmemPwd" placeholder="새 비밀번호"></td>
		    			</tr>
		    			<tr class="UpwdCheck">
		          			<td colspan="3" class="checkTd"><p style="font-size:3px; margin:auto"></p></td>
		          		<tr>
		    			<tr>
		    				<td><p>NEW PASSWORD CHECK</p></td>
		    				<td colspan="2"><input type="password" name="memPwd2" id="UmemPwd2" placeholder="새 비밀번호 확인"></td>
		    			</tr>
		    			<tr class="UpwdCheck">
		          			<td colspan="3" class="checkTd"><p style="font-size:3px; margin:auto"></p></td>
		          		<tr>
		    			<tr>
		    				<td><p>PHONE</p></td>
		    				<td colspan="2"><input type="number" name="memPhone" id="UmemPhone" maxlength="11" value="${loginMember.memPhone}"></td>
		    			</tr>
		    			<tr id="UphoneCheck">
		          			<td colspan="3" class="checkTd"><p style="font-size:3px; margin:auto"></p></td>
		          		<tr>
		    			<tr>
		    				<td><p>EMAIL</p></td>
		    				<td colspan="2"><input type="text" name="memEmail" id="UmemEmail" value="${loginMember.memEmail}"></td>
		    			</tr>
		    			<tr id="UemailCheck">
		          			<td colspan="3" class="checkTd"><p style="font-size:3px; margin:auto"></p></td>
		          		<tr>
		    			<tr>
		    				<td><p>INTRO</p></td>
		    				<td colspan="2"><textarea height="100%" width="100%" resize="none" name="memIntro">${loginMember.memIntro}</textarea></td>
		    			</tr>
		    		</table>
		    		<br><br>
		    		<div style="text-align:right; margin-right:20px">
		    		<button class="btn btn-danger" type="reset" style="width:40px; height:30px; font-size:14px; margin:0px; padding:0px">취소</button>
		    		<button class="btn btn-primary" type="submit" style="width:40px; height:30px; font-size:14px; margin:0px; padding:0px" id="updateFormButton">수정</button>
		    		</div>
		    	</div>
		    </form>
		 </div>
	</div>
	
	<div id="modifyFooter"><jsp:include page="../../common/footer.jsp" /></div>
	<script>
	
	function profileImgButton(){
		$('#profileImgFile').click();
	}
	
	function loadProfileImg(inputFile) {
		
		if (inputFile.files.length == 1) {
			let reader = new FileReader();
			reader.readAsDataURL(inputFile.files[0]);
			
			reader.onload = function (e) {
				$('#profileImg').attr('src', e.target.result);
				$('#filetext').val("");
			}
		} else {
			$('#profileImg').attr('src', 'https://moyeoyou.kr/assets/common/img/user/default_photo.jpg');
		}
	}
	
	</script>
	<script>
		
	var buttonEnable
	
	var buttonEnable1 = 1;
	var buttonEnable2 = 1;
	var buttonEnable3 = 1;
	$('#UnickCheck').hide();
	$('#UphoneCheck').hide();
	$('#UemailCheck').hide();
	$('.UpwdCheck').hide();
		
	function mbuttonEnableCheck(){
		buttonEnable = buttonEnable1 + buttonEnable2 + buttonEnable3;
		
		if(buttonEnable == 3){
			$('#updateFormButton').removeAttr("disabled");
		} else{
			$('#updateFormButton').attr("disabled", true);
		}
	}
	
		$('#UmemNick').on('keyup', function(){
			if($(this).val().length >= 3){
	    		var empty = $(this).val();
	    		
	    		$.ajax({
	    			url : "nickCheck.me",
	    			data : {checkNick : $(this).val()},
	    			success : function(result){
	    				
	    				if((empty != "" && result == '0') || (empty != "" && empty == '${loginMember.memNick}')){
	    					$('#UnickCheck').show();
	    					$('#UnickCheck p').css('color', 'lightgreen').text('멋진 닉네임이네요!');
	    					buttonEnable1 = 1;
	    				} else if(empty != "" && result == '1' && (empty != '${loginMember.memNick}')){
	    					$('#UnickCheck').show();
	    					$('#UnickCheck p').css('color', 'red').text('중복된 닉네임이 존재합니다.');
	    					buttonEnable1 = 0;
	    				} else{
	    					$('#UnickCheck').hide();
	    					buttonEnable1 = 0;
	    				}
	    				
	    				mbuttonEnableCheck();
	    			}
	    		})
			} else{
				$('#UnickCheck').hide();
				buttonEnable1 = 0;
				
				mbuttonEnableCheck();
			}
			
		})
		
		$('#UmemPhone').on('keyup', function(){
			if($(this).val().length == 11){
	    		var empty = $(this).val();
	    		
	    		$.ajax({
	    			url : "phoneCheck.me",
	    			data : {checkPhone : $(this).val()},
	    			success : function(result){
	    				
	    				if((empty != "" && result == '0') || (empty != "" && empty == '${loginMember.memPhone}')){
	    					buttonEnable2 = 1;
	    				} else if(empty != "" && result == '1' && (empty != '${loginMember.memPhone}')){
	    					$('#UphoneCheck').show();
	    					$('#UphoneCheck p').css('color', 'red').text('중복된 번호가 존재합니다.');
	    					buttonEnable2 = 0;
	    				} else{
	    					$('#UphoneCheck').hide();
	    					buttonEnable2 = 0;
	    				}
	    				
	    				mbuttonEnableCheck();
	    			}
	    		})
			} else{
				$('#UphoneCheck').hide();
				buttonEnable2 = 0;
				
				mbuttonEnableCheck();
			}
			
		})
		
		$('#UmemEmail').on('keyup', function(){
			if($(this).val().includes("@")){
	    		var empty = $(this).val();
	    		
	    		$.ajax({
	    			url : "emailCheck.me",
	    			data : {checkEmail : $(this).val()},
	    			success : function(result){	    				
	    				
	    				if((empty != "" && result == '0') || (empty != "" && empty == '${loginMember.memEmail}')){
	    					buttonEnable3 = 1;
	    				} else if(empty != "" && result == '1' && (empty != '${loginMember.memEmail}')){
	    					$('#UemailCheck').show();
	    					$('#UemailCheck p').css('color', 'red').text('중복된 메일이 존재합니다.');
	    					buttonEnable3 = 0;
	    				} else{
	    					$('#UemailCheck').hide();
	    					buttonEnable3 = 0;
	    				}
	    				
	    				mbuttonEnableCheck();
	    			}
	    		})
			} else{
				$('#UemailCheck').hide();
				buttonEnable3 = 0;
				
				mbuttonEnableCheck();
			}
			
		})
		
		$('#UmemPwd').on('keyup', function(){
			if($(this).val().length >= 8 ){
	    		if($('#UmemPwd').val()!=$('#UmemPwd2').val()){
	    			$('.UpwdCheck').show();
	    			$('.UpwdCheck p').css('color', 'red').text('비밀번호가 일치하지 않습니다');
	    			$('#updateFormButton').attr("disabled", true);
	    		} else{    			
	    			$('.UpwdCheck').hide();
	    			$('#updateFormButton').removeAttr("disabled");
	    			mbuttonEnableCheck();
	    		}
			} else if($(this).val().length == 0 && ($('#UmemPwd').val()==$('#UmemPwd2').val())){
				$('.UpwdCheck').hide();
				mbuttonEnableCheck();
			} else{
				$('.UpwdCheck').show();
    			$('.UpwdCheck p').css('color', 'red').text('8자 이상 입력해주세요');
    			$('#updateFormButton').attr("disabled", true);
			}
		})
		
		$('#UmemPwd2').on('keyup', function(){
			if($(this).val().length >= 8 ){
	    		if($('#UmemPwd').val()!=$('#UmemPwd2').val()){
	    			$('.UpwdCheck').show();
	    			$('.UpwdCheck p').css('color', 'red').text('비밀번호가 일치하지 않습니다');
	    			$('#updateFormButton').attr("disabled", true);
	    		} else{    			
	    			$('.UpwdCheck').hide();
	    			$('#updateFormButton').removeAttr("disabled");
	    			mbuttonEnableCheck();
	    		}
			} else if($(this).val().length == 0 && ($('#UmemPwd').val()==$('#UmemPwd2').val())){
				$('.UpwdCheck').hide();
				mbuttonEnableCheck();
			} else{
				$('.UpwdCheck').show();
    			$('.UpwdCheck p').css('color', 'red').text('8자 이상 입력해주세요');
    			$('#updateFormButton').attr("disabled", true);
			}
		})
	</script>
	
	
</body>
</html>