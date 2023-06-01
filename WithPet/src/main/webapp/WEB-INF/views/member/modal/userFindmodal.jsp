<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
</style>
</head>
<body>

	<!-- 아이디 찾기 1번 모달-->
	<div class="modal" id="idFind">
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
		          		<td width="80"><p style="font-size:10px; color:gray; margin-top:12px">아이디 :</p></td>
		          		<td width="200"><input type="text" style="width:100%; border:solid 1px lightgray" required placeholder="내용을 입력해주세요"></td>
						<td></td>
		          	<tr>
		          	<tr>
			          	<td><p style="font-size:10px; color:gray; margin-top:12px">이메일 : </p></td>
						<td><input type="text" style="width:100%; border:solid 1px lightgray" class="dis_inline" required placeholder="내용을 입력해주세요"></td>
						<td><a class="btn_size btn_font btn btn-primary">인증번호 받기</a></td>
		          	</tr>
					  <tr>
						<td><p style="font-size:10px; color:gray; margin-top:12px">인증번호 : </p></td>
						<td><input type="text" style="width:100%; border:solid 1px lightgray" required placeholder="내용을 입력해주세요"></td>
						<td></td>
					</tr>
	          	</table>
	          	<a class="btn btn-primary" style="width:80%; margin:35px 50px" data-bs-toggle="modal" data-bs-target="#idResult">다음	</a>
	       

	          </form>
		      
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
		          		<td width="20"><input type="checkbox"></td>
		          		<td width="100"><b>user01</b></td>
						<td>가입일 : 2023-05-26</td>
		          	<tr>
		          	<tr>
			          	<td><input type="checkbox"></td>
						<td><b>user01</b></td>
						<td>가입일 : 2023-05-26</td>
		          	</tr>
					  <tr>
						<td><input type="checkbox"></td>
						<td><b>user01</b></td>
						<td>가입일 : 2023-05-26</td>
					</tr>
	          	</table>
				<br><br><br><br>
	          	<a class="btn btn-primary dis_inline" style="width:40%; margin:10px 10px" data-bs-toggle="modal" data-bs-target="#login">로그인하기</a>
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
		          		<td width="80"><p style="font-size:10px; color:gray; margin-top:12px">이름 :</p></td>
		          		<td width="200"><input type="text" style="width:100%; border:solid 1px lightgray" required placeholder="내용을 입력해주세요"></td>
						<td></td>
		          	<tr>
		          	<tr>
			          	<td><p style="font-size:10px; color:gray; margin-top:12px">아이디 : </p></td>
						<td><input type="text" style="width:100%; border:solid 1px lightgray" class="dis_inline" required placeholder="내용을 입력해주세요"></td>
						<td></td>
		          	</tr>
					<tr>
						<td><p style="font-size:10px; color:gray; margin-top:12px">이메일 : </p></td>
						<td><input type="text" style="width:100%; border:solid 1px lightgray" required placeholder="내용을 입력해주세요"></td>
						<td><a class="btn_size btn_font btn btn-primary">인증번호 받기</a></td>
					</tr>
					<tr>
						<td><p style="font-size:10px; color:gray; margin-top:12px">인증번호 : </p></td>
						<td><input type="text" style="width:100%; border:solid 1px lightgray" required placeholder="내용을 입력해주세요"></td>
						<td><a class="btn_size btn_font btn btn-primary">인증번호 확인</a></td>
					</tr>
	          	</table>
	          	<a class="btn btn-primary" style="width:80%; margin:35px 50px" data-bs-toggle="modal" data-bs-target="#pwdResult">다음</a>
	       

	          </form>
		      
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
	          <form action="login.me" method="get">
	          	<table width="400" style="text-align:center">
					<tr>
						<td width="90" align="right"><p style="font-size:10px; color:gray; margin-top:12px">아이디 :</p></td>
						<td width="200" align="left"><b class="margin-Left5">user01</b></td>
					  <td></td>
					<tr>
		          	<tr>
		          		<td align="right"><p style="font-size:10px; color:gray; margin-top:12px">새 비밀번호 :</p></td>
		          		<td align="left"><input type="text" class="margin-Left5" style="width:100%; border:solid 1px lightgray" required placeholder="내용을 입력해주세요"></td>
						<td></td>
		          	<tr>
		          	<tr>
			          	<td align="right"><p style="font-size:10px; color:gray; margin-top:12px">새 비밀번호 확인 : </p></td>
						<td align="left"><input type="text" class="margin-Left5" style="width:100%; border:solid 1px lightgray" class="dis_inline" required placeholder="내용을 입력해주세요"></td>
						<td></td>
		          	</tr>
					
	          	</table>
	          	<button class="btn btn-primary" style="width:80%; margin:35px 50px">확인</button>
	       

	          </form>
		      
	        </div>
	        
	        <div class="modal-footer">
	        </div>
	      
	      </div>
	    </div>
	</div>
</body>
</html>