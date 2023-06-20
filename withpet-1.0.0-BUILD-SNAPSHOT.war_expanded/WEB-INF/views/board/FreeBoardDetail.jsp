<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
<style>
    #board-head{
        font-weight: bolder ;
        font-size: 30px;
        padding-left: 10px;
    }
    #board-subtext{
        font-weight: bolder ;
        font-size: 20px;
        height: 45px;
        color: white;
        background-color: rgb(73, 166, 112);
        margin-left: 10px;
    }
    #wrap{
        padding-top: 100px;
        background-color:white;
        height: 100%;
        width: 80%;
        margin: auto;
    }

	#body{
	height: 1500px;
	background-color:lightyellow;
	}
	
	#searchForm {
            width:80%;
            margin:auto;
        }
	 #searchForm>* {
            float:left;
            margin:5px;
            height: 38px;
        }
        .select {width:20%;}
        .text {width:53%;}
        .searchBtn {width:20%;}
    .board-element{
        border-top: 2px solid gray;
        border-bottom: 1.5px solid gray;
        float: left;
        width: 100%;
        height: auto;
    }

    #boardTitle{
        font-weight: bolder ;
        font-size: 25px;
        margin-top: 15px;
        display:inline-block;
        width: 60%;
        margin-left: 10px;
    }    

    #userImg{
        margin-top: 15px;
        display:inline-block;
        width: 10%; height: 40px;
    }      

    #userId{
    	text-align:right;
        display:inline-block;
        width: 10%; height: 40px;
        margin-right: 10px;
        float: right;
    }    
    
    #thumbnail{
        margin-top: 10px;
        margin-right: 10px;
        display:inline-block;
        width: 18%; height: 200px;
    }
    
    #boardContent{
        display:inline-block;
        padding-left: 10px;
        width: 100%; height: auto;
    }    

    #tag, #tag2, #tag3, #tag4, #tag5{
        display:inline-block;
        margin-top: 5px;
        margin-left: 5px;
        margin-right : 5px;
        margin-bottom:5px;
        height: 40px;
        line-height: 40px;
        text-align: center;
        color: white;
        font-weight: bolder;
        background-color: rgb(73, 166, 112);
    }
    #heart{
        margin-left: 10px;
        display:inline-block;
        width: 30px;
        height: 30px;
    }
    #comment{
        margin-left: 20px;
    }
    #create{
    	margin-top: 15px;
        margin-right: 10px;
        float: right;
    }
    #count{
    	margin-top: 15px;
        margin-right: 10px;
        float: right;
    }
	 
     img{
        width: 100%;
        height: 100%;
        object-fit:fill;
     }   
</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp" />
	<div id="body">
        <div id="wrap">
	<form id="searchForm" action="" method="get" align="center">
                <div class="select" align="right">
                    <select class="custom-select" name="condition" style="height: 100%;">
                        <option value="writer">작성자</option>
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                </div>
                <div class="text">
                    <input type="text" class="form-control" name="keyword">
                </div>
                <button type="submit" class="searchBtn btn btn-secondary">검색</button>
            </form>
            <br><br><br>
            
            <label for="" id="board-head">자유게시판</label>
            <c:if test="${ not empty sessionScope.loginMember }">
            <a class="btn btn-secondary" style="float:right; margin-right: 100px; width: 150px;" href="enrollForm.fr">글쓰기</a>
            </c:if>
            <br>
            <label for="" id="board-subtext">자유롭게 이야기해봐요~&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
        
            <br><br>
            

                    		<div class="board-element" id="board-element">
                <div style="border-bottom: 1px solid gray;">
                <span id="boardTitle" >${ b.boardTitle }</span><span id="count">조회수 : ${ b.viewCount }</span><span id="create">작성일자 : ${ b.enrolldate }</span><span id="createDate"></span>
                <br>
				<span id="userId">작성자 : ${ b.boardWriter }</span>
				<br>
				</div>
                <div style="padding-top: 30px; padding-bottom: 30px; border-bottom: 1px solid gray;">
                <span id="boardContent">${ b.boardContent }</span>
                </div>
                <div style="border-bottom: 1px solid gray;">
                <c:forEach var="tag" items="${t}">
				    <span>${tag.tagName}</span>
				  </c:forEach>
                </div>
                <div style="margin-top: 5px; margin-bottom: 5px;">
                <span id="heart"><img src="https://media.istockphoto.com/id/1294470271/ko/%EB%B2%A1%ED%84%B0/%EC%8B%AC%EC%9E%A5-%EC%8B%AC%ED%94%8C%ED%95%98%EA%B3%A0-%EA%B9%A8%EB%81%97%ED%95%9C-%EB%B9%88-%ED%95%98%ED%8A%B8-%EB%AA%A8%EC%96%91-%EB%82%99%EC%84%9C-%EC%8A%A4%ED%83%80%EC%9D%BC-%EC%86%90%EC%9C%BC%EB%A1%9C-%EA%B7%B8%EB%A6%B0-%EB%B2%A1%ED%84%B0.jpg?s=612x612&w=0&k=20&c=kOhcsR7-s7nt3m83Y4LrfJm_rjmJ8dqhVpCpJDEoy_k=" alt=""></span>
                <span id="heartCount">좋아요개수</span>
                <span id="comment"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chat-right" viewBox="0 0 16 16">
  <path d="M2 1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h9.586a2 2 0 0 1 1.414.586l2 2V2a1 1 0 0 0-1-1H2zm12-1a2 2 0 0 1 2 2v12.793a.5.5 0 0 1-.854.353l-2.853-2.853a1 1 0 0 0-.707-.293H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12z"/>
</svg></span> <span id="commentCount"></span>
				</div>   
            </div>
            
                        <br>
            <form action="" method="post" id="updateForm">
            	<input type="hidden" name="bno" value="${ b.boardNo }" >
            	<input type="hidden" name="filePath" value="${ b.changeName }" >
            </form>
	
			<c:if test="${ loginMember.memId eq b.boardWriter }">
            <div align="center">
            
                <!-- 수정하기, 삭제하기 버튼은 이 글이 본인이 작성한 글일 경우에만 보여져야 함 -->
                <a class="btn btn-primary" onclick="updateFormSubmit(1);">수정하기</a>
                <button class="btn btn-danger" onclick="updateFormSubmit(2);">삭제하기</button>
            </div>
            </c:if>
            
            
           	<script>
           		function updateFormSubmit(num) {
           			var boardNo = $('#updateForm input[name=bno]').val();

           		  	console.log("bno:", boardNo);
           			
           			
           			if(num==1){
           			// 수정하기 클릭시
           				$('#updateForm').attr('action','updateForm.fr').submit();
           			}else{
           			// 삭제하기 클리시
           				$('#updateForm').attr('action','delete.fr').submit();
           			}
				}
           	</script>
            
            <br><br>
            
            
            <table id="replyArea" class="table" align="center">
                <thead>
                
                	<c:choose>
                	
                	<c:when test="${ empty loginMember }">
	                    <tr>
	                        <th colspan="2" style="background-color: #E2E2E2;">
	                            <textarea class="form-control" readonly cols="55" rows="2" style="resize:none; width:100%;">로그인 후 이용가능합니다.</textarea>
	                        </th>
	                        <th style="vertical-align:middle; background-color: #E2E2E2;"><button class="btn btn-secondary" style="background-color: rgb(73, 166, 112); border: rgb(73, 166, 112);">등록하기</button></th>
	                    </tr>
                    </c:when>
                    
                    <c:otherwise>
	                     <tr>
	                        <th colspan="2" style="background-color: #E2E2E2;">
	                            <textarea class="form-control"  id="content" cols="55" rows="2" style="resize:none; width:100%;"></textarea>
	                        </th>
	                        <th style="vertical-align:middle; background-color: #E2E2E2;" ><button class="btn btn-secondary" onclick="addReply();" style="background-color: rgb(73, 166, 112); border: rgb(73, 166, 112);">등록하기</button></th>
	                    </tr>
                    
                    <tr>
                        <td colspan="3"><span id="rcount"></span></td>
                    </tr>
                    </c:otherwise>
                    
                    </c:choose>
                    
                </thead>
                <tbody>

                </tbody>
            </table>

           
        </div>
    </div>
    <script>
    	$(function() {
    		selectCommentsList();
		});	
    	
    	function addReply() { // 댓글 작성용 함수
			
    		if($('#content').val().trim() != ''){
    			$.ajax({
    				url : 'rinsert.bo',
    				data : {
    					boardNo : ${b.boardNo},
    					commentText : $('#content').val(),
    					commentWriter : '${loginMember.memId}'
    				},
    				success : function(result) {
						console.log(result);
						
						if(result === 'success'){
							selectCommentsList();
							$('#content').val('');
						}
					},
					error : function() {
						console.log('실패');
					}
    			});
    		}else{
    			alertify.alert('알림', '공백은 입력 할 수 없습니다!');
    		}
    		
		}
    	
    	
    	function selectCommentsList(){
			
    		$.ajax({
    			url : 'rlist.bo',
				data : {bno : ${b.boardNo}},    			
    			success : function(list) {
    				console.log(list);
    				
    				let value = "";
					for(let i in list){
						value += '<tr>'
							   +  '<th>'+ list[i].commentWriter +'</th>'
							   +  '<th>'+ list[i].commentText +'</th>'
							   +  '<th>'+ list[i].regDate +'</th>'
							   +  '</tr>';
					};
					$('#replyArea tbody').html(value);
					$('#commentCount').text(list.length);
				},
				error : function() {
					console.log('AJAX 댓글 목록 조회 실패!');
				}
    		});
		};
    
    </script>
</body>
</html>