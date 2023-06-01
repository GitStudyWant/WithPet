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
        height: 80%;
        margin-left: 10%;
        margin-right: 10%;
    }

    #notice-form>thead>tr>th{
        border: 1px solid black;
        width: 30%;
       
        
    }
    #notice-form>tbody>tr>td{
        border: 1px solid black;
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
                        <option value="writer" wid>작성자</option>
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
            <label for="" id="board-head">공지게시판</label>
            <a class="btn btn-secondary" style="float:right; margin-right: 100px; width: 150px;" href="enrollForm.bo">글쓰기</a>
            <br>
            <label for="" id="board-subtext">With pet의 새로운 소식!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <br><br>
            <div class="board-element">
                <table id="notice-form">
                    <thead>
                        <tr>
                            <th>글번호</th>
                            <th>제목</th>
                            <th>작성일자</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>첫 공지사항</td>
                            <td>20XX.XX.XX</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>두번째 공지사항</td>
                            <td>20XX.XX.XX</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            
        </div>
    </div>
</body>
</html>