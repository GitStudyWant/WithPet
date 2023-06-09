<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
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
        #enrollForm>table {width:100%;}
        #enrollForm>table * {margin:5px;}
    </style>
</head>
<body>
        
    <jsp:include page="../common/header.jsp" />
​
    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>카페 등록</h2>
            <br>
​
            <form id="enrollForm" method="post" action="cafeInsert.bo" enctype="multipart/form-data"> <!-- 파일 첨부 할 수도 있기 때문에 multipart/form-data 작성 -->
                <table algin="center">
                    <tr>
                        <th><label for="title">업체명</label></th>
                        	<td><input type="text" id="title" class="form-control" name="cafeTitle" required></td>
                    </tr>
                    <tr>
                        <th><label for="writer">서비스</label></th>
                        <td colspan="2">
	                        <input type="checkbox" name="cafeService" id="dogCafe" value="애견카페">애견카페<label for="dogCafe"></label>
	                        <input type="checkbox" name="cafeService" id="animalCafe" value="동물카페">동물카페<label for="animalCafe"></label>
	                        <input type="checkbox" name="cafeService" id="unAccompanied" value="반려견동반불가">반려견동반가능<label for="unAccompanied"></label>                        
	                        <input type="checkbox" name="cafeService" id="parking" value="주차가능">주차가능<label for="parking"></label>                        
                    	</td>
                    </tr>                    
                    <tr>
                        <th><label for="writer">주소</label></th>
                        	<td><input type="text" id="address" class="form-control" name="cafeAddress" ></td>
                    </tr>
                    <tr>
     					<th><label for="upfile">카페사진</label></th>
                        	<td><input type="file" id="upfile" class="form-control-file border" name="upfile"></td>
                    </tr>
                    <tr>
                        <th><label for="content">소개</label></th>
                        	<td><textarea id="content" class="form-control" rows="10" style="resize:none;" name="cafeContent" required></textarea></td>
                    </tr>
                </table>
                <br>
                <div align="center">
                    <button type="submit" class="btn btn-primary">등록하기</button>
                    <button type="reset" class="btn btn-danger">취소하기</button>
                </div>
            </form>
        </div>
        <br><br>
​
    </div>
    

    
</body>
</html>