<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">

<head>

<meta charset="UTF-8">

<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<title>체크리스트 1</title>

<style>

form ul{list-style: none;}

form ul>li{text-align:right;width:100px;

display: inline-block; margin-right:5px}

form li:last-child{

width:300px;

text-align: center;

}

form a{

text-decoration : none;

color : black;

}

</style>

</head>

<body>

<form action="/move" method="post">

<fieldset>

<legend>회원가입</legend>

<ul>

<li><label for="userId">아이디</label></li>

<li><input type="text" name='userId' id="userId" size='10' required></li>

<br>

<li><label>패스워드</label></li>

<li><input type="password" name='password' id="password" size='10' required></li>

<span id="out"></span>

<br>

<li><label>패스워드확인</label></li>

<li><input type="password" id="check_pw" size='10' required></li>

<br>

<li><label>이름</label></li>

<li><input type="text" name='userName' id="userName" size='10' required></li>

<br>

<li>성별</li>

<li><label>남<input type="radio" name='gender' class="gender1" value="M"></label>   

<label>여<input type="radio" name='gender' class="gender1" value="F"></label></li>

<br>

<li><label>이메일</label></li>

<li><input type="email" name='email' id="email" size='10' required></li>

<br><br>

<li>

<button onclick="check()">회원가입</button>   

<button type="reset">취소</button>

</li>

</ul>

</fieldset>

</form>

<script>

	$('#userId').on("focusout", function(){
		
		if((0 < $(this).val().length) && ($(this).val().length < 4)){
			alert("4글자이상, 첫글자는 대문자이고 영문자, 숫자만 가능");
			$(this).val("")
		}
		
	})
	
	$('#check_pw').on("keyup", function(){
		
		if($('#password').val() == ""){
			alert("패스워드를 입력하세요");
			$(this).val("");
			$('#password').focus();
			$('#out').text("").css("color", "transparent");
		} else if($('#check_pw').val() == $('#password').val()){
			$('#out').text("패스워드가 일치합니다").css("color", "green");
		} else{
			$('#out').text("패스워드가 일치하지 않습니다").css("color", "red");
		}
		
	})
	
	function check(){
		
		if(!($('.gender1').eq(0).prop("checked") || $('.gender1').eq(1).prop("checked"))){
			alert("성별을 선택하세요");
			return false;
		}
		
	}
	
</script>

</body>

</html>