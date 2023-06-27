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

	<div class="modal fade" id="chattingFind" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
	    <div class="modal-dialog">
	      <div class="modal-content">
	       
	        <div class="modal-header" style="height:15px; background-color:lightgray">
	          <h5 class="modal-title"></h5>
	          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	        </div>
	        <div class="modal-body" align="center" id="friendResult">
	          <h3 class="modal-title" style="text-align:center;">친구 찾기</h3>
	          <br><br><br>
	          <table width="370" style="text-align:center">
		          <tr>
		          	<td style="width:100px;"><b>닉네임 : </b></td>
		          	<td style="width:100px;"><input type="text" name="findFriend" id="inputSearch"/></td>
		          	<td style="width:70px;"><button class="btn btn-success" onclick="findMember();">찾기</button></td>
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
	          	$(function(){
	          		$('#inputSearch').keyup(function(){
	          			$.ajax({
	          				url : 'liveSearch.me',
	          				data : {
	          					keyword : $('#inputSearch').val()
	          				},
	          				type : 'post',
	          				success : function(result){
	          					var val = "";
	          					if(result != ''){
	          						for(let i in result){
	          						val += '<p>'+ result[i].memNick +'</p>';
	          						};
									$('#searchList').css('display','block');
	          						$('#searchList').html(val);
	          					} else{
	          						val += '<p>조회결과 X</p>';
									$('#searchList').css('display','block');
	          						$('#searchList').html(val);
	          					}
	          					console.log(result);
	          				},
	          				error : function(){
	          					console.log('실패');
	          				}
	          			});
	          		});
	          	});

				function findMember(memId){
					$.ajax({
						url : 'findMember.me',
						data : {
							findMember : $('#inputSearch').val()
						},
						type : 'post',
						success : function(result){
							var value = '';
							if(result === '없음'){
								$('#alertTag').text('검색결과가 존재하지 않습니다.');
							} else{
								let memberId = '';
								memberId = result.memId;
								value += '<div>'
									 + '<img id="friendImg" src="resources/myPage/user.png" alt="">'
								 	 + '<p class="marginTop0px" id="searchId">아이디 : '+ result.memId +'</p>'
								     + '<p class="marginTop0px" id="searchNick">닉네임 : '+ result.memNick +'</p>'
								     + '<table id="buttonTable">'
									 + '<tr align="center">'
									 + '<td><button class="btn btn-success marginBotton20px btn-Size" onclick="oneChatInsert('+"'" + result.memId + "'"+');">1대1 채팅 </button></td>'
									 + '</tr>'
									 + '<tr>'
									 + '</tr>'
								     + '</table>'
								     + '<br>'
								     + '</div>'	;
							}
							$('#friendResult').html(value);
						},
						error : function(){
							console.log('실패');
						}
					})
				}

				function oneChatInsert(friendId){
					$('#friendId').val(friendId);
					$('#oneChatForm').attr('action', 'oneChatInsert.me').submit();
				}

	          </script>
	        </div>
	       </div>
	     </div>
	 </div>

</body>
</html>