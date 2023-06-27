<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.margin-left20px{
		margin-left : 5px;
	}
	
	#searchList{
		margin-top : -8px !important;
		border: 1px solid rgb(192, 188, 188);
		display : none;
	}
</style>
</head>
<body>

	<div class="modal fade" id="enrollFormSelect" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
	    <div class="modal-dialog">
	      <div class="modal-content">
	       
	        <div class="modal-header" style="height:15px; background-color:lightgray">
	          <h5 class="modal-title"></h5>
	          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	        </div>
	        <div class="modal-body" align="center" id="friendResult">
	          <h3 class="modal-title" style="text-align:center;">글쓰기 게시판 선택</h3>
	          <br><br><br>
	          <table width="370" style="text-align:center">
		          <tr>
					<form method="get" id="enrollFormList">
		          		<td style="width:370px;">
							<select id="boardSelectList">
								<option value="enrollForm.re">리뷰 게시판</option>
								<option value="enrollForm.fr">자유 게시판</option>
								<option value="enrollForm.fr">질문 게시판</option>
								<option value="enrollForm.bo">크리에이터 게시판</option>
								<option value="enrollForm.fr">공유 게시판</option>
							</select>
							<br><br>
							<a onclick="goEnrollForm();" class="btn btn-success">해당 게시판 글작성하러 가기~</a>
					</td>
					</form>
				  </tr>
				  <tr>
				  	<td></td>
				  	<td>
				  		<div id="searchList"></div>
				  	</td>
				  	<td></td>
				  <tr>
				  <tr id="alertDiv"></tr>
	          </table>
	          <br><br><br>
	          <script>
				function goEnrollForm(){
					let enrollUrl = $('#boardSelectList').val();
					$('#enrollFormList').attr('action', ''+ enrollUrl +'').submit();
				}

	          </script>
	        </div>
	       </div>
	     </div>
	 </div>

</body>
</html>