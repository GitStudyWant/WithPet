<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style> 
        .content {
            background-color:rgb(247, 245, 245);
            width:80%;
            margin:auto;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }
​
        table * {margin:5px;}
        table {width:100%;}
       </style>
</head>
<body>
	
    <jsp:include page="../common/header.jsp" />
​
    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2><b>카페 이용안내</b></h2>
            <br>
​
            <a class="btn btn-secondary" style="float:right;" href="cafe.bo">목록으로</a>
            <br><br>
​
            <table id="contentArea" algin="center" class="table">
               	<tr>  
               	    <p class="img">
	            	    <img src="${c.changeName }" alt="카페이미지" style="width:800px; height:500px">
	            	</p>
	            </tr>	
                <tr>
                    <th width="100">제목</th>
                    <td colspan="3">${c.cafeTitle }</td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td>${c.cafeAddress }</td>
                    <th>서비스</th>
                    <td>${c.cafeService }</td>                    
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <td colspan="4"><p style="height:150px;">${c.cafeContent }</p></td>
                </tr>
            </table>
            <br>
​			
		   <!--  
			<c:if test="${loginUser.userId eq n.noticeWriter }">
	            <div align="center">
	                 수정하기, 삭제하기 버튼은 이 글이 본인이 작성한 글일 경우에만 보여져야 함 
	                <a class="btn btn-primary" onclick="postFormSubmit(1);">수정하기</a>
	                <a class="btn btn-danger" onclick="postFormSubmit(2);">삭제하기</a>
	            </div>
            </c:if>
          --> 
            <form action="" method="post" id="postForm">
            	<input type="hidden" name="cafeNo" value="${c.cafeNo }">
            </form>
            
           
            <!--  
            <script>
            	function postFormSubmit(num){
            		if(num == 1){	
	            		// 수정하기 클릭 시
	            		$('#postForm').attr('action', 'updateForm.no').submit();
            		} else {
	            		// 삭제하기 클릭 시 
	            		$('#postForm').attr('action', 'delete.no').submit();
            		}
            	}	
            </script>
            -->
           
            
           
            <br><br>
            <!-- 댓글 기능은 나중에 ajax 배우고 나서 구현할 예정! 우선은 화면구현만 해놓음 -->
            <!-- 
            <table id="replyArea" class="table" align="center">
                <thead>
                    <tr>
                        <th colspan="2">
                            <textarea class="form-control" name="" id="content" cols="55" rows="2" style="resize:none; width:100%;"></textarea>
                        </th>
                        <th style="vertical-align:middle"><button class="btn btn-secondary">등록하기</button></th>
                    </tr>
                    <tr>
                        <td colspan="3">댓글(<span id="rcount">3</span>)</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>user02</th>
                        <td>ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ꿀잼</td>
                        <td>2023-03-12</td>
                    </tr>
                    <tr>
                        <th>user01</th>
                        <td>재밌어요</td>
                        <td>2023-03-11</td>
                    </tr>
                    <tr>
                        <th>admin</th>
                        <td>댓글입니다!!</td>
                        <td>2023-03-10</td>
                    </tr>
                </tbody>
                </table>
  -->          
  
        
        </div>
        <br><br>
​
    </div>	














</body>
</html>