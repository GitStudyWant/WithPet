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
    .board-element2{
        border-bottom: 1.5px solid gray;
        border-top: 1.5px solid gray;
        float: left;
        width: 100%;
        height: 300px;
    }
    .board-element3{
        border-bottom: 3px solid gray;
        border-top: 1.5px solid gray;
        float: left;
        width: 100%;
        height: 300px;
    }

    #boardTitle{
        font-weight: bolder ;
        font-size: 20px;
        margin-top: 15px;
        display:inline-block;
        width: 60%;
        margin-left: 10px;
        overflow: hidden;
    }    

    #userImg{
        margin-top: 15px;
        display:inline-block;
        width: 10%; height: 40px;
    }      

    #userId{
        margin-top: 15px;
        display:inline-block;
        width: 10%; height: 40px;
    }    
    
    #thumbnail{
        margin-top: 10px;
        margin-right: 10px;
        display:inline-block;
        width: 18%; height: 200px;
    }
    
    #boardContent{
         display: block;
		  margin-left: 10px;
		  width: 80%;
		  height: 150px;
		  overflow: hidden;
		  text-overflow: ellipsis;
		  white-space: pre-wrap;
    }    

    #tag, #tag2, #tag3, #tag4, #tag5{
        display:inline-block;
        margin-top: 5px;
        margin-left: 10px;
        height: 40px;
        line-height: 40px;
        text-align: center;
        color: white;
        font-weight: bolder;
        padding-left:5px;
        padding-right:5px;
        background-color: rgb(73, 166, 112);
    }
    #heart{
        margin-top: 5px;
        margin-left: 10px;
        display:inline-block;
        width: 30px;
        height: 30px;
        font-size: 1.5em;
        text-align: center;
    }
    #comment{
        margin-left: 20px;
    }
    #create{
        margin-left: 20px;
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
	 
     img{
        width: 100%;
        height: 100%;
        object-fit:fill;
     }
     #starRating{
     	display:inline-block;
     	border:0;
     	margin-top:5px;
		margin-right: 45px;
		font-size: 2em;
	    color: transparent;
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	    float: right;
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
            <label for="" id="board-head">리뷰게시판</label>
            <c:if test="${ not empty sessionScope.loginMember }">
            <a class="btn btn-secondary" style="float:right; margin-right: 100px; width: 150px;" href="enrollForm.re">글쓰기</a>
            </c:if>
            <br>
            <label for="" id="board-subtext">고객님의 소중한 리뷰, 감사합니다.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <label style="float: right; margin-right: 100px;">
                <input type="radio" id="new" name="order" value="N">
                <label for="radioF">최신순</label>&nbsp;&nbsp;&nbsp;
                <input type="radio" id="popular" name="order" value="P">
                <label for="radioF">인기순</label>
                <input type="radio" id="stars" name="order" value="S">
                <label for="radioF">별점순</label>
            </label>
            <br><br>
            
            <c:forEach items="${ list }" var="b" >

                    		<div class="board-element">
                    		<div class="clickZone">
                <input type="hidden" name="bno" value="${ b.boardNo }" >
                <span id="boardTitle" >${ b.boardTitle }</span><span id="userImg"  >작성자프로필</span><span id="userId">${ b.boardWriter }</span><span id="thumbnail" style="float: right;"> <img src="https://i.namu.wiki/i/uIt7OBpwNR2Cgk90eW_s_0iAZ6628xqGiRY1YyG5drpYaFwXo4ZAKKLltMDxLc2qPyky0s6D9bociJ770v2mwA.webp" alt=""></span>
                <span id="boardContent">${ b.boardContent }</span>
                
                <br>
                <div id="starRating" >
				<c:choose>
				<c:when test="${b.rating == 0}">
				☆☆☆☆☆
				</c:when>
				<c:when test="${b.rating == 1}">
				★☆☆☆☆
				</c:when>
				<c:when test="${b.rating == 2}">
				★★☆☆☆
				</c:when>
				<c:when test="${b.rating == 3}">
				★★★☆☆
				</c:when>
				<c:when test="${b.rating == 4}">
				★★★★☆
				</c:when>
				<c:otherwise>
				★★★★★
				</c:otherwise>
				</c:choose>
       			</div>
       			<div style="clear:both; height: 0px;"></div>
       			</div>
				<br>
                <div id="tag-list_${b.boardNo}" style="height: auto;"></div>
                <div style="margin-bottom: 5px;margin-top: 5px;">
                <span id="heart" class="heart" data-board-no="${b.boardNo}">♡</span>
                <span id="heartCount_${b.boardNo}"></span>
                <span id="comment"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chat-right" viewBox="0 0 16 16">
  <path d="M2 1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h9.586a2 2 0 0 1 1.414.586l2 2V2a1 1 0 0 0-1-1H2zm12-1a2 2 0 0 1 2 2v12.793a.5.5 0 0 1-.854.353l-2.853-2.853a1 1 0 0 0-.707-.293H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12z"/>
</svg></span> <span class="commentCount" id="commentCount_${b.boardNo}"></span><span id="create">작성일자 : </span><span id="createDate">${ b.enrolldate }</span>    
            	</div>
            </div>
                    		
                    		
                    </c:forEach>
            
            
            
			<br>
            
        <div id="pagingArea">
                <ul class="pagination">
                	
                	<c:choose>
                		<c:when test="${ pi.currentPage eq 1 }">
                		<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                		</c:when>
                		<c:otherwise>
                		<li class="page-item"><a class="page-link" href="list.review?cPage=${pi.currentPage-1 }">Previous</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    
					
					<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
						<li class="page-item"><a class="page-link" href="list.review?cPage=${p }">${p}</a></li>
					</c:forEach>
					
                    <c:choose>
                		<c:when test="${ pi.currentPage eq pi.maxPage }">
                		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                		</c:when>
                		<c:otherwise>
                		<li class="page-item"><a class="page-link" href="list.review?cPage=${pi.currentPage+1 }">Next</a></li>
                		</c:otherwise>
                	</c:choose>
                    
                </ul>
            </div>

           
        </div>
    </div>
    <script>
					    $(function() {
					        $('.clickZone').click(function() {
					            var bno = $(this).find('input[name="bno"]').val();
					            location.href = 'http://localhost:8787/withpet/detail.re?bno=' + bno;
					        });
					    });
					    $(document).ready(function() {
					        $(".commentCount").each(function() {
					            var boardNo = $(this).attr("id").split("_")[1];
					            
					            $.ajax({
					                url: "select.co",
					                method: "POST",
					                data: { boardNo: boardNo },
					                success: function(response) {
					                    var commentCount = response;
					                    $("#commentCount_" + boardNo).text(commentCount);
					                },
					                error: function() {
					                	console.log('댓글수 목록 조회 실패!');
					                }
					            });
					        });
					    });
					    $(document).ready(function() {
					        $(".commentCount").each(function() {
					            var boardNo = $(this).attr("id").split("_")[1];
					            
					            $.ajax({
					                url: "select.tag",
					                method: "POST",
					                data: { boardNo: boardNo },
					                success: function(response) {
					                    response.forEach(function(item) {
					                        var tag = item.tagName;
					                        var spanElement = $('<span>').attr('id', 'tag').text(tag);
					                        $('#tag-list_' + boardNo).append(spanElement);
					                    });
					                },
					                error: function() {
					                	console.log('태그 목록 조회 실패!');
					                }
					            });
					        });
					    });
					    $(document).ready(function() {
					        $(".commentCount").each(function() {
					            var boardNo = $(this).attr("id").split("_")[1];
					            
					            $.ajax({
					                url: "like.bo",
					                method: "POST",
					                data: { boardNo: boardNo },
					                success: function(response) {
					                    var likeCount = response;
					                    $("#heartCount_" + boardNo).text(likeCount);
					                },
					                error: function() {
					                	console.log('좋아요 개수 조회 실패!');
					                }
					            });
					        });
					    });
					    $(document).ready(function() {
					        $(".commentCount").each(function() {
					            var boardNo = $(this).attr("id").split("_")[1];
					            var memberId = $("input[name='memberId']").val();
					            var heartIcon = $(this).parent().find(".heart");
					
					            $.ajax({
					                url: "like.chk",
					                method: "POST",
					                data: { memId: memberId, boardNo: boardNo },
					                success: function(result) {
					                    if (result === 'success') {
					                        heartIcon.text("♥");
					                    }
					                },
					                error: function() {
					                    console.log('게시글 목록 좋아요 조회 실패!');
					                }
					            });
					        });
					    });
					    
					    $(document).on('click', '.board-element .heart', function() {
					        var memberId = $("input[name='memberId']").val();
					        if (memberId === "") {
					            alert("로그인이 필요합니다.");
					        } else {
					            var boardNo = $(this).closest('.board-element').find('input[name="bno"]').val();
					            var heartElement = $(this);
					
					            $.ajax({
					                url: 'like.add',
					                method: 'POST',
					                data: { memId: memberId, boardNo: boardNo },
					                success: function(result) {
					                    if (result === 'success') {
					                        heartElement.text('♥');
					                        alert("좋아요 성공!");
					
					                        $.ajax({
					                            url: 'like.bo',
					                            method: 'POST',
					                            data: { boardNo: boardNo },
					                            success: function(response) {
					                                var likeCount = response;
					                                $("#heartCount_" + boardNo).text(likeCount);
					                            },
					                            error: function() {
					                                console.log('좋아요 개수 조회 실패!');
					                            }
					                        });
					                    } else if (result === 'fail') {
					                    	heartElement.text('♡');
					                        alert("좋아요 취소!");
					                        
					                        $.ajax({
					                            url: 'like.bo',
					                            method: 'POST',
					                            data: { boardNo: boardNo },
					                            success: function(response) {
					                                var likeCount = response;
					                                $("#heartCount_" + boardNo).text(likeCount);
					                            },
					                            error: function() {
					                                console.log('좋아요 개수 조회 실패!');
					                            }
					                        });
					                    }
					                },
					                error: function() {
					                    console.log('좋아요 실패!');
					                }
					            });
					        }
					    });
			</script>
</body>
</html>