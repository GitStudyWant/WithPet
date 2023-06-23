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
            <form action="" method="post" id="postForm">
            	<input type="hidden" name="cafeNo" value="${c.cafeNo }">
            </form>
        
        </div>
        <br><br>
​
    </div>	



</body>
</html>