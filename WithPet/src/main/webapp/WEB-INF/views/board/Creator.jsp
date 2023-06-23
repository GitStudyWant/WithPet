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

    #creator{
        font-weight: bolder ;
        font-size: 30px;
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
    
    .thumbnail{
        margin-left: 50px;
        margin-top: 10px;
        margin-right: 50px;
        display:inline-block;
        width: 150px; height: 150px;
    }

    .btn1{
        margin-right: 50px;
        margin-top: 15px;
        float: right;
    }
    #boardTitle{
        text-align: center;
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
            <label for="" id="board-head">크리에이터 게시판</label>
            <c:if test="${not empty sessionScope.loginMember and sessionScope.loginMember.memGrade eq 'CREATOR'}">
            <a class="btn btn-secondary" style="float:right; margin-right: 100px; width: 150px;" href="enrollForm.cr">글쓰기</a>
            </c:if>
            <br>
            <label for="" id="board-subtext">크리에이터분들의 창작 마당!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <br><br>
            <c:forEach items="${ list }" var="b" >
            <div class="board-element">
                <span id="creator" >Creator1</span> <span class="btn1"><button type="button" class="btn btn-primary">더보기</button></span>
                <br>
                <div class="thumbnail">
                    <img alt="" src="https://via.placeholder.com/150">
                    <br>
                    <p id="boardTitle">제목</p>
                </div>
                <div class="thumbnail">
                    <img alt="" src="https://via.placeholder.com/150">
                    <br>
                    <p id="boardTitle">제목</p>
                </div>
                <div class="thumbnail">
                    <img alt="" src="https://via.placeholder.com/150">
                    <br>
                    <p id="boardTitle">제목</p>
                </div>
                <div class="thumbnail">
                    <img alt="" src="https://via.placeholder.com/150">
                    <br>
                    <p id="boardTitle">제목</p>
                </div>
                <div class="thumbnail">
                    <img alt="" src="https://via.placeholder.com/150">
                    <br>
                    <p id="boardTitle">제목</p>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>