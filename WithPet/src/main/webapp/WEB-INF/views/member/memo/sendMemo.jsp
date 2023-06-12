<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>

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
	
	#diaryFooter{
		margin-top:1000px;
	}
	
	#body>p{
		margin-top:15px;
		text-align:center;
		font-size:35px;
	}

	#schedulemain{
		width : 100%;
		height : 1000px;
		padding-top : 15px;
		float:left;
	}
	
	#memomain p{
		font-size:25px;
		margin-left:60px;
	}
	
	#memomain a{
		color:black;
		text-decoration:none;
	}
	
	#memokind{
		width : 100%;
		text-align : center;
		font-size  : 20px;
	}
	
	#memokind td{
		border-left :  1px silver solid; 
		border-right : 1px silver solid; 
	}
	
	#memolist{
		width : 95%;
		text-align : center;
		margin : auto;
	}
	
	#memolist th{
		background-color : lightgray;
		border : 1px solid silver;
	}
	
	#memoetc{
		width : 95%;
		margin : auto;
	}

</style>
</head>
<body>
	<div id="memoSide"><jsp:include page="../../common/myPageSide.jsp" /></div>
	<div id="memoSendback"><jsp:include page="../../common/sendBack.jsp" /></div>
	
	<div id="body">	
		    <div id="memomain">
		    <br>
		    <p>[${ loginMember.memNick }] 님의 쪽지</p>
		    <br><br><br>
		    
		    <hr>
		    <table id="memokind">
		    	<tr>
		    		<td><a href="receiveMemo">받은쪽지함</a></td>
		    		<td><a href="sendMemo">보낸쪽지함</a></td>
		    		<td><a href="newMemo">새 쪽지</td>
		    	</tr>
		    </table>
		    <hr>
		    <br><br><br><br><br>
		    
		    <table id="memolist" >
		    	<tr>
		    		<th class="memolisthead"><input type="checkbox"></th>
		    		<th class="memolisthead">받은사람</th>
		    		<th class="memolisthead">제목</th>
		    		<th class="memolisthead">발송시간</th>
		    		<th class="memolisthead">읽음확인</th>
		    	</tr>
		    	<c:choose>
		    	<c:when test="${ empty list}">
			    	<tr>
			    		<td colspan="5">쪽지가 없어요</td>>
			    	</tr>
		    	</c:when>
		    	<c:otherwise>
			    	<c:forEach items="${list}" var="memos">
			    	<tr>
			    		<td class="memotd"><input type="checkbox"></td>
			    		<td class="memotd">${memos.memoReceiver}</td>
			    		<td class="memotd">${memos.memoTitle}</td>   	
			    		<td class="memotd">${memos.memoDate}</td>   	
			    		<td class="memotd">
			    		<c:choose>
			    			<c:when test="${memos.memoCheck == 'N'}">
			    				읽지않음
			    			</c:when>
			    			<c:otherwise>
			    				읽음
			    			</c:otherwise>
			    		</c:choose>
			    		</td>   	
			    	</tr>
			    	</c:forEach>
		    	</c:otherwise>
		    	</c:choose>
		    </table>
		    
		    <script>
		    	$(function(){
		    		console.log($('.memotd'));
		    		$('.memotd').css("height", "40px").css("border", "1px solid silver");		    		
		    	})
		    </script>
		    
		    <br><br>
		    
		    <table id="memoetc">
		    	<tr>
		    		<td colspan="3">
		    		<button class="btn btn-danger" style="width:8%; height:30px; display:flex; align-items: center; justify-content: center;">삭제</button>
		    		</td>
		    	</tr>
		    	<tr>
		    		<td colspan="3" width="100%">
		    			<div id="pagingArea" style="width:1%; margin:auto">
				                <ul class="pagination">
				                
				                	<c:choose>
				                		<c:when test="${ pi.currentPage eq 1 }">
					                   		<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
				    					</c:when>
				    					<c:otherwise>
					                    	<li class="page-item"><a class="page-link" href="list.bo?cPage=${ pi.currentPage - 1 }">&lt;</a></li>  					
				    					</c:otherwise>            	
				                	</c:choose>
				                    
				                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
				                    	<li class="page-item"><a class="page-link" href="list.bo?cPage=${p}">${ p }</a><li>
				                    </c:forEach>
				                    
				                    
				                    <c:choose>
				                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
				                    		<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
				                    	</c:when>
				                    	<c:otherwise>
				                    		<li class="page-item"><a class="page-link" href="list.bo?cPage=${ pi.currentPage + 1 }">&gt;</a></li>
				                  		</c:otherwise>
				                    </c:choose>
				                    
				                </ul>
				            </div>
		    		</td>
		    	</tr>
		    </table>
		
		        
		    
	<div id="diaryFooter"><jsp:include page="../../common/footer.jsp" /></div>
	
</body>
</html>