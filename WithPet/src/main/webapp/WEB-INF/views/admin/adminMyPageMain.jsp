<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
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
		height : 1000px;
		display: inline-block;	
		float:left;
	}

	#mainTable{
		border-top: 1px solid #dee2e6;
	}

	#mainTable p{
		margin-top: 10px;
	}

	#naviTable{
		width : 100%;
		height : 150px;
	}

	#naviTable td{
		text-align: right;
	}

	.thHigh{
		height : 120px;
		font-size: 25px;
	}
	.thHigh:hover{
		color:rgb(73, 166, 112);
	}

	.width10{
		width : 10%;
	}
	#boardList{
		border-top : 1px solid #dee2e6;
	}
	#boardList tr{
		height : 60px;
	}
	#boardList>tbody p{
		margin-bottom: 0px;
		margin-top : 10px;
	}

	#foogg{
		width : 100%;
        height : 65px;
	}

    #foogg>thead>tr{
        width: 25%;
    }

	.inCheck{
		width :20px;
		height: 20px;
		margin-right: 40px;
	}






    #wrap_12{
        width: 1200px;
        text-align: center;
        margin: auto;
    }
    #wrap{
        margin : auto;
        width : 800px;
        height : 100%;
    }
    button{
        color:white ;
        background-color: green;
        border: 1px #C2E5F2;
    }
   
   table{

   text-align : center;
    font-size : 13px;
   
   }
    #actH2{
        text-align: center;
       font-weight: 1000;
       margin-bottom: 40px;
       margin-top: 40px;
       color:#052159 ;
    }
    .actBtn{
        border-radius: 5px;
        color: white;
    }



</style>
</head>
<body>

	<jsp:include page="../common/adminMyPageSide.jsp" />

	<div id="body">
		<div id="mainmain">
		<h1>회원 관리</h1>	
    <hr>
    <br><br>
    <form action="adminMemberList" method="post">
        <table id="memberlist" align="center">
           <thead>
            <tr>
                <td colspan="7">
                    <select id="search" name="search">
                        <option name="search" value="memId">아이디</option>
                        <option name="search" value="memNick">닉네임</option>
                    </select> : <input type="text" name="Skeyword" id="searchGo" onclick="noSearch();">
                    <button class="actBtn" type="submit">검색</button>
                </td>
            </tr>
            <tr>
                <th colspan="5"><b></b></th>
                <th><button class="actBtn" onclick="return updateMemType2();">상태 변경</button></th>
            </tr>
            <tr>
                <th colspan="5"><b></b></th>
                <th><button class="actBtn" onclick="return updateMemType3();">등급 변경</button></th>
            </tr>            
            <tr></tr>
            <tr height="20"></tr>
            <tr>
                <th width="100px;">아이디</th>
                <th>닉네임</th>
                <th width="250px;">활동정보<br>(가입일자)</th>
                <th width="90px;">회원상태</th>
                <th>선택</th>
                <th width="90px;">회원등급</th>
                <th>선택</th>
            </tr>
           </thead>
           </tbody>
           
                <c:choose>
                    <c:when test="${ empty list }">
                        <tr><td colspan="8">회원이 없습니다.</td></tr>
                    </c:when>
                    <c:otherwise>
                       <c:forEach var="m" items="${list}">
                           <tr>
                            <td>${m.memId}</td>
                            <td>${m.memNick}</td>
				   			<td>${m.memDate}</td>
				    		<td class="member${m.memId}">
				    			<c:choose>
				    				<c:when test="${m.memStatus eq 'Y' }">
		                       			 <select name="memStatus" id="${m.memId}memStatus">
			                                <option value="Y" disabled selected>정상</option>
			                                <option value="N">정지</option>
		                            	</select> 
				    				</c:when>
				    				<c:otherwise>
				    					<select name="memStatus" id="${m.memId}memStatus">
			                                <option value="Y">정상</option>
			                                <option value="N" disabled selected>정지</option>
		                            	</select> 
				    				</c:otherwise>
				    			</c:choose>
                            </td>		
                    		<td><input type="checkbox" name="memStaus" value="${m.memId}"></td>                            
				    		<td class="member${m.memId}">
				    			<c:choose>
				    				<c:when test="${m.memGrade eq 'ADMIN' }">
		                       			 <select name="${m.memId}memGrade" id="${m.memId}memGrade">
			                                <option value="ADMIN" disabled selected>ADMIN</option>
			                                <option value="NORMAL">NORMAL</option>
			                                <option value="CREATOR">CREATOR</option>
		                            	</select> 
				    				</c:when>
				    				<c:when test="${m.memGrade eq 'NORMAL' }">
		                       			 <select name="${m.memId}memGrade" id="${m.memId}memGrade" >
			                                <option value="ADMIN">ADMIN</option>
			                                <option value="NORMAL" disabled selected>NORMAL</option>
			                                <option value="CREATOR">CREATOR</option>
		                            	</select> 
				    				</c:when>
				    				<c:otherwise>
		                       			 <select name="${m.memId}memGrade" id="${m.memId}memGrade">
			                                <option value="ADMIN">ADMIN</option>
			                                <option value="NORMAL">NORMAL</option>
			                                <option value="CREATOR" disabled selected>CREATOR</option>
		                            	</select> 
				    				</c:otherwise>
				    			</c:choose>
                            </td>
                    		<td>
                    		<input type="checkbox" name="memGrade" value="${m.memId}">
                    		</td>
                		 </tr>
                       </c:forEach>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>				
           </form>
		</div>
	</div>	
	
	

		<script>
		
		
			function updateMemType2() {
			  var selectedMembers = $('input[name="memGrade"]:checked');
			  console.log(selectedMembers.val());
			  if (selectedMembers.length === 0) {
			    alert("회원을 선택해주세요.");
			  }
				
			  selectedMembers.each(function() {
			    var memId = $(this).val();
			    var memGrade = $('#'+memId+'memGrade').val();
			   // console.log("memId " + memId);
			   // console.log("memGrade " + memGrade);
			    
			   
			    $.ajax({
			      url: 'adminGradeUpdate',
			      type: 'post',
			      data: { memId: memId, memGrade: memGrade },
			      success: function(result) {
			    	  if(result === 'Y'){
			        $('#'+memId+'memGrade').val(memGrade);
			        console.log("회원 등급이 변경되었습니다.");
			    	  }
			      },
			      error: function(error) {
			        console.error("회원 등급 변경 중 오류가 발생했습니다.");
			      }
			   
			    });
			   
			  })
			
			}
		
           </script>
           
		<script>
		
		
			function updateMemType3() {
			  var selectedMembers = $('input[name="memStatus"]:checked');
			  console.log(selectedMembers.val());
			  if (selectedMembers.length === 0) {
			    alert("회원을 선택해주세요.");
			  }
				
			  selectedMembers.each(function() {
			    var memId = $(this).val();
			    var memStatus = $('#'+memId+'memStatus').val();
			   // console.log("memId " + memId);
			   // console.log("memGrade " + memGrade);
			    
			   
			    $.ajax({
			      url: 'adminStatusUpdate',
			      type: 'post',
			      data: { memId: memId, memStatus: memStatus },
			      success: function(result) {
			    	  if(result === 'Y'){
			        $('#'+memId+'memGrade').val(memStatus);
			        console.log("회원 상태가 변경되었습니다.");
			    	  }
			      },
			      error: function(error) {
			        console.error("회원 상태 변경 중 오류가 발생했습니다.");
			      }
			   
			    });
			   
			  })
			
			}
		
           </script>           
           
           
           
	              <script>  	
	             /*  	
	                 function noSearch(){
	                        
	                        var result = $('#search option:selected').val();
	                        console.log(result);
	                        if (result == 'report') {
	                            $('#searchGo').attr('readonly', true).val("검색 없이 조회 됩니다.").css('background-color','#C2E5F2');
	                            
	                                } else {
	                                    $('#searchGo').removeAttr('readonly');
	                                    $('#searchGo').css('background-color','white').val('').focus;
	                                }
	                    	}
	                 
	                 
	                	$(function(){
	                		
	                		for(var i = 1; i < ${list}.length(); i++){
	                			if(($('.member'+i+'').text()) === 'A'){
	                				console.log(($('.member'+i+'').text()));
	                				$(".search-area"+i+"option[value='A']").attr('selected',true);
	                				$(".search-area"+i+"option[value='A']").attr('disabled',true);
	                			};
	                			
	                		     if(($('.member'+ i +'').text()) ==='B'){
	                                 console.log(($('.member'+ i +'').text()));
	                                 $(".search-area"+ i +" option[value='B']").attr('selected', true);
	                                  $(".search-area"+ i +" option[value='B']").attr('disabled', true);
	                             };
	                              
	                             if(($('.member'+ i +'').text()) ==='C'){
	                                 console.log(($('.member'+ i +'').text()));
	                                 $(".search-area"+ i +" option[value='C']").attr('selected', true);
	                                  $(".search-area"+ i +" option[value='C']").attr('disabled', true);
	                              };
	           
	                          console.log(($('.member'+ i +'').text()));
	                              };
	                	})	                    	                	
	              
	                	*/
	</script>
	
	
	
	
	
	
	
	<div id="mypageFooter"><jsp:include page="../common/footer.jsp" /></div>
	
</body>
</html>