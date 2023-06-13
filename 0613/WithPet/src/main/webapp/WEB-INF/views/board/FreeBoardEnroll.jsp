<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<jsp:include page="../common/header.jsp" />
	
	<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js-->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="/resources/js/summernote-ko-KR.js"></script>

	
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

</style>
</head>
<body>
						
	<script>
		$(document).ready(function() {
			  $('#summernote').summernote({
		 	    	placeholder: '게시글을 입력해주세요',
			        minHeight: 370,
			        maxHeight: 500,
			        focus: true, 
			        lang : 'ko-KR'
			  });
			});
		
		
	</script>
			<!--  비로그인으로 접근시 이전 페이지로
	        <c:if test="${ empty sessionScope.loginMember }">
            <script>
            	window.alert('비정상적인 접근입니다. 로그인을 해주세요');
                history.back();
            </script>
            </c:if>
            -->
	
	<div id="body">
        <div id="wrap">

            <br><br><br>
            
            <label for="" id="board-head">자유게시판</label>
            <br>
            <label for="" id="board-subtext">자유롭게 이야기해봐요~&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
        

            <br><br><br>
            
            
            <div style="width: 60%; margin: auto;">
				<form method="post" action="insert.free" enctype="multipart/form-data">
					<input type="hidden" id="boardWriter" name="boardWriter" value="${ loginMember.memId }">
					<input type="text" name="boardTitle" style="width: 40%;" placeholder="제목" required/>
					<br><br> 
					<input type="file" id="upfile" class="form-control-file border" name="upfile">
					
					<textarea id="summernote" name="boardContent">
					</textarea>

			        
					<div align="center">
						<br><br><br>
	                    <button type="submit" class="btn btn-primary">등록하기</button>
	                    <button type="reset" class="btn btn-danger" >취소하기</button>
                	</div>
				</form>
			</div>
			<br>
            

        </div>
    </div>
    
</body>
</html>