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
	 #newPagingArea {
	 	
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
     .nickName{
     		float: left;
      		text-align:center;
      		margin-top: 5px;
      		margin-bottom: 10px; 			
       		margin-right: 10px;
       		margin-left: 10px;
   			background-color: rgb(73, 166, 112);
   			color: white;
            font-weight: bolder;
            padding:5px;
            width: auto;
			height: auto;
			vertical-align:middle;
     }   
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	<div id="body">
        <div id="wrap">
            <br><br><br>
            
            <label for="" id="board-head">크리에이터 게시판</label>
            <c:if test="${not empty sessionScope.loginMember and sessionScope.loginMember.memGrade eq 'CREATOR'}">
            <a class="btn btn-secondary" style="float:right; margin-right: 100px; width: 150px;" href="enrollForm.cr">글쓰기</a>
            </c:if>
            <br>
            <label for="" id="board-subtext">크리에이터분들의 창작 마당!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
        	
            <br>
            <br>
            <div style="height: auto;">
            <button type="button" id="all" class="btn btn-success" class="cbtn" style="margin-left: 10px;font-weight:bold; background-color: rgb(73, 166, 112); border: rgb(73, 166, 112); color: white;">&nbsp;&nbsp;전체&nbsp;&nbsp;</button>
            <c:forEach items="${ clist }" var="c" >
            <button type="button" class="btn btn-success" class="cbtn" style="background-color: rgb(73, 166, 112); border: rgb(73, 166, 112); color: white;" onclick="searchByMemNick('${c.memNick}')">&nbsp;&nbsp;${c.memNick}&nbsp;&nbsp;</button>
            </c:forEach>
            </div>
            <br><br>
            <div id="boardListContainer" class="board-list">
            <div class="origin">
            <c:forEach items="${ list }" var="b" >
                    		<div class="board-element">
                    		<div class="clickZone">
                <input type="hidden" name="bno" value="${ b.boardNo }" >
                <span id="boardTitle" >${ b.boardTitle }</span><span id="userImg"  >작성자프로필</span><span id="userId">${ b.boardWriter }</span><span id="thumbnail" style="float: right;"> <img src="https://geojecci.korcham.net/images/no-image01.gif" alt=""></span>
                <span id="boardContent">${ b.boardContent }</span>
               
                <br>
                </div>
                <div id="tag-list_${b.boardNo}" style="height: auto;"></div>
                <div style="margin-bottom: 5px;margin-top: 5px;">
                <span id="heart" class="heart" data-board-no="${b.boardNo}">♡</span>
                <span id="heartCount_${b.boardNo}"></span>
                <span id="comment"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chat-right" viewBox="0 0 16 16">
  <path d="M2 1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h9.586a2 2 0 0 1 1.414.586l2 2V2a1 1 0 0 0-1-1H2zm12-1a2 2 0 0 1 2 2v12.793a.5.5 0 0 1-.854.353l-2.853-2.853a1 1 0 0 0-.707-.293H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12z"/>
</svg></span> <span class="commentCount" id="commentCount_${b.boardNo}"></span><span id="create">작성일자 : </span><span id="createDate">${ b.enrolldate }</XXXX-XX-XX></span>    
					</div>
				</div>
                    </c:forEach>
            </div>
                    </div>
                    
            <div id="searchResult">
			</div>
            
            
			<br>
            
        <div id="pagingArea">
                <ul class="pagination">
                	
                	<c:choose>
                		<c:when test="${ pi.currentPage eq 1 }">
                		<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                		</c:when>
                		<c:otherwise>
                		<li class="page-item"><a class="page-link" href="list.creator?cPage=${pi.currentPage-1 }">Previous</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    
					
					<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
						<li class="page-item"><a class="page-link" href="list.creator?cPage=${p }">${p}</a></li>
					</c:forEach>
					
                    <c:choose>
                		<c:when test="${ pi.currentPage eq pi.maxPage }">
                		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                		</c:when>
                		<c:otherwise>
                		<li class="page-item"><a class="page-link" href="list.creator?cPage=${pi.currentPage+1 }">Next</a></li>
                		</c:otherwise>
                	</c:choose>
                    
                </ul>
            </div>
            <div id="newPagingArea">
             	<ul class="pagination">
    			</ul>
			</div>
           
        </div>
    </div>
    <script>		
				    $("#all").click(function () {
				    	 $(".origin .board-element").show(); 
				    	    $(".board-list .delete").remove();
				    	});
				    $(function() {
				        $('.clickZone').click(function() {
				            var bno = $(this).find('input[name="bno"]').val();
				            location.href = 'http://localhost:8787/withpet/detail.cr?bno=' + bno;
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
				    function searchByMemNick(memNick) {
				        $.ajax({
				            url: "search.creator",
				            method: "POST",
				            data: { memNick: memNick },
				            success: function(response) {
				            	console.log(response);
				                var listContainer = $(".board-list");

				                $(".origin .board-element").hide();
				                $(".board-list .delete").remove();

				                response.forEach(function(item) {
				                    var enrolldate = new Date(item.enrolldate);
				                    var year = enrolldate.getFullYear();
				                    var month = ('0' + (enrolldate.getMonth() + 1)).slice(-2);
				                    var day = ('0' + enrolldate.getDate()).slice(-2);
				                    var formattedDate = year + '-' + month + '-' + day;

				                    var listItem = $("<div>").addClass("delete")
				                        .append($("<div>").addClass("board-element")
				                            .append($("<div>").addClass("clickZone")
				                                .append($("<input>").attr("type", "hidden").attr("name", "bno").val(item.boardNo))
				                                .append($("<span>").attr("id", "boardTitle").text(item.boardTitle))
				                                .append($("<span>").attr("id", "userImg").text("작성자프로필"))
				                                .append($("<span>").attr("id", "userId").text(item.boardWriter))
				                                .append($("<span>").attr("id", "thumbnail").css("float", "right").html("<img src='https://geojecci.korcham.net/images/no-image01.gif' alt=''>"))
				                                .append($("<span>").attr("id", "boardContent").text(item.boardContent))
				                                .append($("<br>"))
				                            )
				                            .append($("<div>").attr("id", "tag-list_" + item.boardNo).addClass("new").css("height", "auto"))
				                            .append($("<div>").addClass("create-section").css("margin-bottom", "5px").css("margin-top", "5px")
				                                .append($("<span>").attr("id", "create").text("작성일자 : "))
				                                .append($("<span>").attr("id", "createDate").text(formattedDate))
				                            )
				                        );

				                    $(".board-list").append(listItem);

				                    // 태그 목록 조회 및 표시
				                    $.ajax({
				                        url: "select.tag",
				                        method: "POST",
				                        data: { boardNo: item.boardNo },
				                        success: function(response) {
				                            response.forEach(function(tagItem) {
				                                var tag = tagItem.tagName;
				                                var spanElement = $("<span>").attr("id", "tag").text(tag);
				                                $("#tag-list_" + item.boardNo + ".new").append(spanElement);
				                            });
				                        },
				                        error: function() {
				                            console.log("태그 목록 조회 실패!");
				                        }
				                    });
				                    var clickZone = listContainer.find(".board-element:last .clickZone");
				                    clickZone.click(function() {
				                        var bno = $(this).find('input[name="bno"]').val();
				                        location.href = "http://localhost:8787/withpet/detail.cr?bno=" + bno;
				                    });

				                });
				                

			                    

				            },
				            error: function() {
				                console.log("검색 실패!");
				            }
				        });
				    }
				            
    </script>
</body>
</html>