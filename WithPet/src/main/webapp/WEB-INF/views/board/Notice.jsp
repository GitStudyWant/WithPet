<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	height: 1000px;
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
        border-top: 3px solid gray;
        border-bottom: 1.5px solid gray;
        width: 100%;
        height: 70%;
    }

    #boardTitle{
        font-weight: bolder ;
        font-size: 20px;
        margin-top: 15px;
        display:inline-block;
        width: 60%;
        margin-left: 10px;
    }    

    
    #boardContent{
        display:inline-block;
        margin-left: 10px;
        width: 80%; height: 150px;
    }
    #notice-form{
        width: 80%;
        margin: 0 auto;
        margin-top: 30px;
    }

    #notice-form>thead>tr>th{
        border: 1px solid grey;
        height: 40px;
        text-align: center;
       
        
    }
    #notice-form>tbody>tr>td{
        border: 1px solid grey;
    }
     #notice-form>tbody>tr{
   		height: 40px;
    }
    #head{
    	color: white;
        background-color: rgb(73, 166, 112);
    }
     #pagingArea {
	 	
	 	text-align: center;
	 }
	 
	 .pagination {
		 width:fit-content;
		 margin:auto;
		 display: inline-block;	
		 padding-top: 50px;
	}
	#boardContent img {
        display: none;
    }
    #boardContent iframe {
        display: none;
    }   

    
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	<div id="body">
        <div id="wrap">
	
            <br><br><br>
            <label for="" id="board-head">공지게시판</label>
            <c:if test="${not empty sessionScope.loginMember and sessionScope.loginMember.memId eq 'A'}">
            <a class="btn btn-secondary" style="float:right; margin-right: 100px; width: 150px;" href="enrollForm.no">글쓰기</a>
            </c:if>
            <br>
            <label for="" id="board-subtext">With pet의 새로운 소식!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <br><br>
            <div class="board-element">
                <table id="notice-form">
                    <thead id="head">
                        <tr>
                            <th style="width: 10%;">글번호</th>
                            <th style="width: 60%;">제목</th>
                            <th style="width: 10%;">조회수</th>
                            <th style="width: 20%;">게시일자</th>
                        </tr>
                    </thead>
                    <tbody >
                        <c:forEach items="${ list }" var="b">
                    		<tr align="center">
                    			<td class="bno">${ b.boardNo }</td>
                    			<td>${ b.boardTitle }</td>
                    			<td>${ b.viewCount }</td>
                    			<td>${ b.enrolldate }</td>
                    		</tr>
                    </c:forEach>
                    </tbody>
                </table>
			<br><div id="pagingArea">
                <ul class="pagination">
                	
                	<c:choose>
                		<c:when test="${ pi.currentPage eq 1 }">
                		<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                		</c:when>
                		<c:otherwise>
                		<li class="page-item"><a class="page-link" href="list.no?cPage=${pi.currentPage-1 }">Previous</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    
					
					<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
						<li class="page-item"><a class="page-link" href="list.no?cPage=${p }">${p}</a></li>
					</c:forEach>
					
                    <c:choose>
                		<c:when test="${ pi.currentPage eq pi.maxPage }">
                		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                		</c:when>
                		<c:otherwise>
                		<li class="page-item"><a class="page-link" href="list.no?cPage=${pi.currentPage+1 }">Next</a></li>
                		</c:otherwise>
                	</c:choose>
                    
                </ul>
            </div>
            </div>
            
        </div>
    </div>
    <script>
				$(function() {
					$('#notice-form > tbody > tr').click(function() {
						location.href = 'detail.no?bno='+$(this).children('.bno').text();
					})				
				})
			</script>
</body>
</html>