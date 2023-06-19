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
        float: left;
        width: 100%;
        height: 300px;
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
        display:inline-block;
        margin-left: 10px;
        width: 80%; height: 150px;
    }    

    #tag1, #tag2, #tag3, #tag4, #tag5{
        display:inline-block;
        margin-top: 5px;
        margin-left: 10px;
        height: 40px;
        line-height: 40px;
        text-align: center;
        color: white;
        font-weight: bolder;
        background-color: rgb(73, 166, 112);
    }
    #heart{
        margin-top: 5px;
        margin-left: 10px;
        display:inline-block;
        width: 30px;
        height: 30px;
    }
    #comment{
        margin-left: 20px;
    }
    #create{
        margin-left: 20px;
    }
    #star{
        margin-top: 10px;
        margin-right: 10px;
        display:inline-block;
        width: 250px; height: 40px;
        float: right;
    }
     img{
        width: 100%;
        height: 100%;
        object-fit:fill;
        background-color: white;
        color: white;
        border: none;
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
            <a class="btn btn-secondary" style="float:right; margin-right: 100px; width: 150px;" href="enrollForm.fr">글쓰기</a>
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
            <div class="board-element">
                <span id="boardTitle" >제목</span><span id="userImg"  >작성자프로필</span><span id="userId">작성자</span><span id="thumbnail" style="float: right;"> <img src="https://i.namu.wiki/i/uIt7OBpwNR2Cgk90eW_s_0iAZ6628xqGiRY1YyG5drpYaFwXo4ZAKKLltMDxLc2qPyky0s6D9bociJ770v2mwA.webp" alt=""></span>
                <span id="boardContent">내용</span>
                <span id="tag1">태그1</span>
                <span id="tag2">태그2</span>
                <span id="tag3">태그3</span>
                <span id="star"><img src="https://i.ibb.co/FqZ9Nxx/image.png" alt="" ></span>
                <br>
                <span id="heart"><img src="https://media.istockphoto.com/id/1294470271/ko/%EB%B2%A1%ED%84%B0/%EC%8B%AC%EC%9E%A5-%EC%8B%AC%ED%94%8C%ED%95%98%EA%B3%A0-%EA%B9%A8%EB%81%97%ED%95%9C-%EB%B9%88-%ED%95%98%ED%8A%B8-%EB%AA%A8%EC%96%91-%EB%82%99%EC%84%9C-%EC%8A%A4%ED%83%80%EC%9D%BC-%EC%86%90%EC%9C%BC%EB%A1%9C-%EA%B7%B8%EB%A6%B0-%EB%B2%A1%ED%84%B0.jpg?s=612x612&w=0&k=20&c=kOhcsR7-s7nt3m83Y4LrfJm_rjmJ8dqhVpCpJDEoy_k=" alt=""></span>
                <span id="heartCount">좋아요개수</span>
                <span id="comment">
<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chat-right" viewBox="0 0 16 16">
  <path d="M2 1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h9.586a2 2 0 0 1 1.414.586l2 2V2a1 1 0 0 0-1-1H2zm12-1a2 2 0 0 1 2 2v12.793a.5.5 0 0 1-.854.353l-2.853-2.853a1 1 0 0 0-.707-.293H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12z"/>
</svg></span> <span id="commentCount">XXX</span><span id="create">작성일자 : </span><span id="createDate">XXXX-XX-XX</XXXX-XX-XX></span>    
            </div>
            <div class="board-element2">
                <span id="boardTitle" >제목</span><span id="userImg"  >작성자프로필</span><span id="userId">작성자</span><span id="thumbnail" style="float: right;"> <img src="https://i.namu.wiki/i/uIt7OBpwNR2Cgk90eW_s_0iAZ6628xqGiRY1YyG5drpYaFwXo4ZAKKLltMDxLc2qPyky0s6D9bociJ770v2mwA.webp" alt=""></span>
                <span id="boardContent">내용</span>
                <span id="tag1">태그1</span>
                <span id="tag2">태그2</span>
                <span id="tag3">태그3</span>
                <span id="star"><img src="https://i.ibb.co/7y2JYS4/1.png" alt="" ></span>
                <br>
                <span id="heart"><img src="https://media.istockphoto.com/id/1294470271/ko/%EB%B2%A1%ED%84%B0/%EC%8B%AC%EC%9E%A5-%EC%8B%AC%ED%94%8C%ED%95%98%EA%B3%A0-%EA%B9%A8%EB%81%97%ED%95%9C-%EB%B9%88-%ED%95%98%ED%8A%B8-%EB%AA%A8%EC%96%91-%EB%82%99%EC%84%9C-%EC%8A%A4%ED%83%80%EC%9D%BC-%EC%86%90%EC%9C%BC%EB%A1%9C-%EA%B7%B8%EB%A6%B0-%EB%B2%A1%ED%84%B0.jpg?s=612x612&w=0&k=20&c=kOhcsR7-s7nt3m83Y4LrfJm_rjmJ8dqhVpCpJDEoy_k=" alt=""></span>
                <span id="heartCount">좋아요개수</span>
                <span id="comment">
<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chat-right" viewBox="0 0 16 16">
  <path d="M2 1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h9.586a2 2 0 0 1 1.414.586l2 2V2a1 1 0 0 0-1-1H2zm12-1a2 2 0 0 1 2 2v12.793a.5.5 0 0 1-.854.353l-2.853-2.853a1 1 0 0 0-.707-.293H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12z"/>
</svg></span> <span id="commentCount">XXX</span><span id="create">작성일자 : </span><span id="createDate">XXXX-XX-XX</XXXX-XX-XX></span>    
            </div>
            <div class="board-element3">
                <span id="boardTitle" >제목</span><span id="userImg"  >작성자프로필</span><span id="userId">작성자</span><span id="thumbnail" style="float: right;"> <img src="https://i.namu.wiki/i/uIt7OBpwNR2Cgk90eW_s_0iAZ6628xqGiRY1YyG5drpYaFwXo4ZAKKLltMDxLc2qPyky0s6D9bociJ770v2mwA.webp" alt=""></span>
                <span id="boardContent">내용</span>
                <span id="tag1">태그1</span>
                <span id="tag2">태그2</span>
                <span id="tag3">태그3</span>
                <span id="star"><img src="https://i.ibb.co/MDkBxzV/2.png" alt="" ></span>
                <br>
                <span id="heart"><img src="https://media.istockphoto.com/id/1294470271/ko/%EB%B2%A1%ED%84%B0/%EC%8B%AC%EC%9E%A5-%EC%8B%AC%ED%94%8C%ED%95%98%EA%B3%A0-%EA%B9%A8%EB%81%97%ED%95%9C-%EB%B9%88-%ED%95%98%ED%8A%B8-%EB%AA%A8%EC%96%91-%EB%82%99%EC%84%9C-%EC%8A%A4%ED%83%80%EC%9D%BC-%EC%86%90%EC%9C%BC%EB%A1%9C-%EA%B7%B8%EB%A6%B0-%EB%B2%A1%ED%84%B0.jpg?s=612x612&w=0&k=20&c=kOhcsR7-s7nt3m83Y4LrfJm_rjmJ8dqhVpCpJDEoy_k=" alt=""></span>
                <span id="heartCount">좋아요개수</span>
                <span id="comment">
<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chat-right" viewBox="0 0 16 16">
  <path d="M2 1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h9.586a2 2 0 0 1 1.414.586l2 2V2a1 1 0 0 0-1-1H2zm12-1a2 2 0 0 1 2 2v12.793a.5.5 0 0 1-.854.353l-2.853-2.853a1 1 0 0 0-.707-.293H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12z"/>
</svg></span> <span id="commentCount">XXX</span><span id="create">작성일자 : </span><span id="createDate">XXXX-XX-XX</XXXX-XX-XX></span>    
            </div>

            
        </div>
    </div>
</body>
</html>