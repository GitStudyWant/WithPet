<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>헤더</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jqupwdEmailery.min.js"></script>
<style>
	.dis_inline{
		display: inline-block;
	}

	.btn_size{
		width: 95%;
	}

	.btn_font{
		font-size : 9px;
	}
	.margin-Left5{
		margin-left: 10px;
	}

	.idNext{
		display : none;
	}

</style>
</head>
<body>

	<!-- 아이디 찾기 1번 모달-->
	<div class="modal fade" id="idFind" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
	    <div class="modal-dialog">
	      <div class="modal-content">
	      
	        <div class="modal-header" style="height:15px; background-color:lightgray">
	          <h5 class="modal-title"></h5>
	          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	        </div>
	        
	        <div class="modal-body" align="center">
	        
	        
	        
	          <p class="modal-title" style="font-size:15px; text-align:center; margin-top:15px; margin-bottom:30px">아이디 찾기</p>
	          <form action="login.me" method="get">
	          	<table width="400" style="text-align:center">
		          	<tr>
			          	<td width="80"><p style="font-size:10px; color:gray; margin-top:12px">이메일 : </p></td>
						<td width="200"><input type="text" id="email" style="width:100%; border:solid 1px lightgray" class="dis_inline" required placeholder="내용을 입력해주세요" name="email1"></td>
						<td><button type="button" class="btn_size btn_font btn btn-primary" onclick="authenticationNumber();">인증번호 받기</button></td>
		          	</tr>
					  <tr>
						<td><p style="font-size:10px; color:gray; margin-top:12px">인증번호 : </p></td>
						<td><input type="text" id="code" style="width:100%; border:solid 1px lightgray" required placeholder="내용을 입력해주세요"></td>
						<td><button type="button" class="btn_size btn_font btn btn-primary" onclick="numberCheck();">인증번호 확인</button>
							<p id="notCode"></p>
						</td>
					</tr>
	          	</table>
	          	<a class="btn btn-primary idNext" id="idNext" style="width:80%; margin:35px 50px" data-bs-toggle="modal" data-bs-target="#idResult" onclick="idFind();">다음	</a>
	       

	          </form>
		      
		      <script>
		      	function authenticationNumber(){
					if($('#email').empty){
		      		$.ajax({
		      			url : 'sendMail.bo',
		      			data : {email : $('#email').val()},
		      			type : 'post',
		      			success : function(num){
		      				console.log(num);
		      			},
		      			error : function(){
		      				console.log('메일 보내기 실패');
		      			}
		      			
		      		});
					} else{
						alert('이메일을 입력해주세요!');
					}
		      		
		      	};
		      	
		      	function numberCheck(){
		      		
		      		httpRequest = new XMLHttpRequest();
		      		const code = document.getElementById('code').value;
		      		httpRequest.onreadystatechange = () =>{
		      			if(httpRequest.readyState === XMLHttpRequest.DONE){
		      				if(httpRequest.status === 200){
		      					
		      					let result = httpRequest.response;
		      					
		      					console.log(result);
									if(result == 0) {
										
										document.getElementById('notCode').innerText='인증번호가 일치하지 않습니다.';
										document.getElementById('idNext').style.display='none';
										
									}
									else{
										document.getElementById('notCode').innerText='다음으로 넘어가주세요.';
										document.getElementById('idNext').style.display='block';
									}
		      				}
		      			}
		      		}
		      		httpRequest.open('POST', 'check?code=' + code);
		      		httpRequest.responseType = 'text/html';
		      		httpRequest.send();
		      	};
		      	
		      	function idFind(){
		      		
		      		httpRequest = new XMLHttpRequest();
		      		const email = document.getElementById('email').value;
		      		httpRequest.onreadystatechange = () =>{
		      			if(httpRequest.readyState === XMLHttpRequest.DONE){
		      				if(httpRequest.status === 200){
		      					let result = httpRequest.response;
		      					if(result != null){
									console.log(result.memId);
									document.getElementById('resultId').innerText='아이디 : '+ result.memId+'';
									document.getElementById('resultDate').innerText='가입일 : '+ result.memDate+'';
								} else{
									document.getElementById('resultId').innerText='아이디가 존재하지 않습니다.';
								}
		      				}
		      			}
		      		}
		      		httpRequest.open('POST', 'idFind?email=' + email);
		      		httpRequest.responseType = 'json';
		      		httpRequest.send();
		      	};
		      	
		      	
		      </script>
	        </div>
	        
	        <div class="modal-footer">
	        </div>
	      
	      </div>
	    </div>
	</div>

	<!-- 아이디 찾기 2번 모달-->

	<div class="modal" id="idResult">
	    <div class="modal-dialog">
	      <div class="modal-content">
	      
	        <div class="modal-header" style="height:15px; background-color:lightgray">
	          <h5 class="modal-title"></h5>
	          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	        </div>
	        
	        <div class="modal-body" align="center">
	        
	        
	        
	          <p class="modal-title" style="font-size:15px; text-align:center; margin-top:15px; margin-bottom:30px">아이디 목록</p>
	          <form action="login.me" method="get">
	          	<table width="300" style="text-align:center">
		          	<tr>
		          		<td width="100" id="resultId"></td>
		          		<td width="150" id="resultDate"></td>
		          	<tr>
	          	</table>
				<br><br><br><br>
	          	<a class="btn btn-primary dis_inline" style="width:40%; margin:10px 10px" data-bs-toggle="modal" data-bs-target="#loginModal">로그인하기</a>
				<a class="btn btn-primary" style="width:40%; margin:10px 10px" data-bs-toggle="modal" data-bs-target="#pwdFind">비밀번호 찾기</a>
	       
	          </form>
		      
	        </div>
	        
	        <div class="modal-footer">
	        </div>
	      
	      </div>
	    </div>
	</div>

	<!-- 비밀번호 찾기 1-->

	<div class="modal" id="pwdFind">
	    <div class="modal-dialog">
	      <div class="modal-content">
	      
	        <div class="modal-header" style="height:15px; background-color:lightgray">
	          <h5 class="modal-title"></h5>
	          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	        </div>
	        
	        <div class="modal-body" align="center">
	        
	        
	        
	          <p class="modal-title" style="font-size:15px; text-align:center; margin-top:15px; margin-bottom:30px">비밀번호 찾기</p>
	          <form action="login.me" method="get">
	          	<table width="400" style="text-align:center">
		          	<tr>
			          	<td width="80"><p style="font-size:10px; color:gray; margin-top:12px">아이디 : </p></td>
						<td width="200"><input type="text" id="memberId" style="width:100%; border:solid 1px lightgray" class="dis_inline" required placeholder="내용을 입력해주세요"></td>
						<td></td>
		          	</tr>
		          	<tr>
			          	<td width="80"><p style="font-size:10px; color:gray; margin-top:12px">이메일 : </p></td>
						<td width="200"><input type="text" id="pwdEmail" style="width:100%; border:solid 1px lightgray" class="dis_inline" required placeholder="내용을 입력해주세요"></td>
						<td><button type="button" class="btn_size btn_font btn btn-primary" onclick="authenticationPwd();">인증번호 받기</button></td>
		          	</tr>
					  <tr>
						<td><p style="font-size:10px; color:gray; margin-top:12px">인증번호 : </p></td>
						<td><input type="text" id="pwdCode" style="width:100%; border:solid 1px lightgray" required placeholder="내용을 입력해주세요"></td>
						<td><button type="button" class="btn_size btn_font btn btn-primary" onclick="pwdCheck();">인증번호 확인</button>
							<p id="pwdCode"></p>
						</td>
					</tr>
	          	</table>
	          	<a class="btn btn-primary idNext" id="pwdNext" style="width:80%; margin:35px 50px" data-bs-toggle="modal" data-bs-target="#pwdResult">다음	</a>
			

	          </form>
		      <script>
				console.log(document.getElementById('pwdNext'));
				console.log(document.getElementById('memberId'));

				function authenticationPwd(){
					if($('#pwdEmail').val() != ""){
						$.ajax({
							url : 'pwdMail.bo',
							data : {email : $('#pwdEmail').val()},
							type : 'post',
							success : num=>{
									alert('메시지 전송 성공');
							},
							error : ()=>{
								alert('메일 보내기 실패');
							}
						});
							
					}else{
						alert('이메일을 입력해주세요');
					}

				};
	      	
		      	function pwdCheck(){
					if(document.getElementById('memberId').value != ""){
						httpRequest = new XMLHttpRequest();
						const code = document.getElementById('pwdCode').value;
						httpRequest.onreadystatechange = () =>{
							if(httpRequest.readyState === XMLHttpRequest.DONE){
								if(httpRequest.status === 200){
									
									let result = httpRequest.response;
									console.log(result);
									
									
										if(result == 0) {
											
											document.getElementById('pwdCode').innerText='인증번호가 일치하지 않습니다.';
											document.getElementById('pwdNext').style.display='none';
											console.log(document.getElementById('pwdNext').style);
											
										}
										else{
											document.getElementById('pwdCode').innerText='다음으로 넘어가주세요.';
											console.log(document.getElementById('pwdNext').style);
											document.getElementById('pwdNext').style.display='block';
											document.getElementById('findMemberPwd').innerText=document.getElementById('memberId').value;
											document.getElementById('hiddenId').value=document.getElementById('memberId').value;
											document.getElementById('hiddenEamil').value=document.getElementById('pwdEmail').value;

										}
								}
							}
						}
		      		
		      		httpRequest.open('POST', 'pwdCheck?code=' + code);
		      		httpRequest.responseType = 'text/html';
		      		httpRequest.send();
					}else{
		      			alert('아이디를 입력해주세요');
		      			}
		      	};
		      	
				/*
		      	function pwdFind(){
		      		
		      		httpRequest = new XMLHttpRequest();
		      		const id = document.getElementById('memberId').value;
		      		const email = document.getElementById('pwdEmail').value;

					const pwd = {'id' : id, 'email' : email};
		      		httpRequest.onreadystatechange = () =>{
		      			if(httpRequest.readyState === XMLHttpRequest.DONE){
		      				if(httpRequest.status === 200){
		      					let result = httpRequest.response;
		      					if(result != null){
									console.log(result.memId);
								}
		      				}
		      			}
		      		}
		      		httpRequest.open('POST', 'pwdFind?pwd=' + pwd);
		      		httpRequest.responseType = 'json';
		      		httpRequest.send();
		      	};
		      	*/
		      	
		      </script>
	        </div>
	        
	        <div class="modal-footer">
	        </div>
	      
	      </div>
	    </div>
	</div>

	<!-- 비밀번호 찾기 2-->
	<div class="modal" id="pwdResult">
	    <div class="modal-dialog">
	      <div class="modal-content">
	      
	        <div class="modal-header" style="height:15px; background-color:lightgray">
	          <h5 class="modal-title"></h5>
	          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	        </div>
	        
	        <div class="modal-body" align="center">
	        
	        
	        
	          <p class="modal-title" style="font-size:15px; text-align:center; margin-top:15px; margin-bottom:30px">비밀번호 찾기</p>
	          <form action="pwdFind" method="Post">
	          	<table width="400" style="text-align:center">
					<tr>
						<td width="90" align="right"><p style="font-size:10px; color:gray; margin-top:12px">아이디 :</p></td>
						<td width="200" align="left"><p class="margin-Left5" id="findMemberPwd">user01</p>
						<input type="hidden" name="memberId" id="hiddenId">
						<input type="hidden" name="email" id="hiddenEamil">	
						</td>
					  <td></td>
					<tr>
		          	<tr>
		          		<td align="right"><p style="font-size:10px; color:gray; margin-top:12px">새 비밀번호 :</p></td>
		          		<td align="left"><input type="text" id="password" name="password" class="margin-Left5" style="width:100%; border:solid 1px lightgray" required placeholder="내용을 입력해주세요"></td>
						<td id="pwChk"></td>
		          	<tr>
		          	<tr>
			          	<td align="right"><p style="font-size:10px; color:gray; margin-top:12px">새 비밀번호 확인 : </p></td>
						<td align="left"><input type="text" id="password_check" name="passwordCheck" class="margin-Left5" style="width:100%; border:solid 1px lightgray" class="dis_inline" required placeholder="내용을 입력해주세요"></td>
						<td id="pwChk2"></td>
		          	</tr>
					
	          	</table>
	          	<button class="btn btn-primary" style="width:80%; margin:35px 50px">확인</button>
	       

	          </form>
		      <script>
					$("#password_check").on("keyup", function() {
			
						let pwCheckVal = $(this).val();
						let pwVal = $("#password").val();
						
						if(pwCheckVal === "") {
							$(this).css("background", "pink");
							$("#pwChk2").html("<b style='color:red;'>[패스워드 확인은 필수!]</b>");
							chk3 = false;
						} else if(pwCheckVal !== pwVal) {
							$(this).css("background", "pink");
							$("#pwChk2").html("<b style='color:red;'>[위에랑 똑같이 쓰세요!]</b>");
							chk3 = false;
						} else {
							$(this).css("background", "aqua");
							$("#pwChk2").html("<b style='color:green;'>[참 잘했어요!]</b>");
							chk3 = true;
						}
						
						
					});

		//패스워드 입력값 검증.
					$('#password').on('keyup', function() {
						//비밀번호 공백 확인
						if($("#password").val() === ""){
							$('#password').css("background-color", "pink");
							$('#pwChk').html('<b style="color:red;">[패스워드는 필수정보에요!]</b>');
							chk2 = false;
						}		         
						//비밀번호 유효성검사
						else if(!getPwCheck.test($("#password").val()) || $("#password").val().length < 8){
							$('#password').css("background-color", "pink");
							$('#pwChk').html('<b style="color:red;">[특수문자 포함 8자이상으루다가~]</b>');
							chk2 = false;
						} else {
							$('#password').css("background-color", "aqua");
							$('#pwChk').html('<b style="color:green;">[참 잘했어요~♡]</b>');
							chk2 = true;
						}
						
					});
			  </script>
	        </div>
	        
	        <div class="modal-footer">
	        </div>
	      
	      </div>
	    </div>
	</div>
</body>
</html>