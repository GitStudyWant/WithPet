<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<style>


	#body{
	height: 1000px;
	width: 100%;
	background-color:white;
	box-sizing: border-box;
	}

	#mainSi{
		height : 1000px;
		display: inline-block;	
		float:left;
	}

	#mainmain{
		width : 75%;
		height : 1000px;
		display: inline-block;	
		float:left;
	}

	#mainTable{
		border-top: 1px solid #dee2e6;
	}

	#mainTable p{
		margin-top: 10px;
	}

	#naviTable{
		width : 100%;
		height : 150px;
	}

	#naviTable td{
		text-align: right;
	}

	.thHigh{
		height : 120px;
		font-size: 25px;
	}
	.thHigh:hover{
		color:rgb(73, 166, 112);
	}

	.width10{
		width : 10%;
	}
	#boardList{
		border-top : 1px solid #dee2e6;
	}
	#boardList tr{
		height : 60px;
	}
	#boardList>tbody p{
		margin-bottom: 0px;
		margin-top : 10px;
	}

	#foogg{
		width : 100%;
        height : 100px;
	}

    #foogg>thead>tr{
        width: 25%;
    }

	.inCheck{
		width :20px;
		height: 20px;
		margin-right: 40px;
	}




</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	<div id="body">
			<div id="mainSi"><jsp:include page="../common/myPageSide.jsp" /></div>
			<div id="mainmain">
				<table id="naviTable">
					<thead>
						<tr>
							<th class="width10"></th>
							<th class="thHigh">작성글 확인</th>
							<th class="thHigh">작성 댓글 확인</th>
							<th class="thHigh">스크랩한 글</th>
							<th class="thHigh">출석하기</th>
							<th class="thHigh"></th>
						</tr>
						<tr>
							<td colspan="5">삭제한 게시글 조회</td>
						</tr>
					</thead>
				</table>
				<br>
				<table class="table table-hover" id="mainTable">
					<thead>
						<tr align="center">
						<th scope="col"><p>선택</p></th>
						<th scope="col"><p>제목</p></th>
						<th scope="col"><p>작성일</p></th>
						<th scope="col"><p>조회수</p></th>
						</tr>
					  </thead>
					  <tbody align="center">
						<tr>
						<th scope="row"><p><input type="checkbox"/></p></th>
						<td><p>제목1</p></td>
						<td><p>작성일</p></td>
						<td><p>1</p></td>
						</tr>
						<tr>
						<th scope="row"><p><input type="checkbox"/></p></th>
						<td><p>제목1</p></td>
						<td><p>작성일</p></td>
						<td><p>1</p></td>
						</tr>
						<tr>
						<th scope="row"><p><input type="checkbox"/></p></th>
						<td><p>제목1</p></td>
						<td><p>작성일</p></td>
						<td><p>1</p></td>
						</tr>
						<tr>
							<th scope="row"><p><input type="checkbox"/></p></th>
							<td><p>제목1</p></td>
							<td><p>작성일</p></td>
							<td><p>1</p></td>
						</tr>
						<tr>
							<th scope="row"><p><input type="checkbox"/></p></th>
							<td><p>제목1</p></td>
							<td><p>작성일</p></td>
							<td><p>1</p></td>
						</tr>
						<tr>
							<th scope="row"><p><input type="checkbox"/></p></th>
							<td><p>제목1</p></td>
							<td><p>작성일</p></td>
							<td><p>1</p></td>
						</tr>
						<tr>
							<th scope="row"><p><input type="checkbox"/></p></th>
							<td><p>제목1</p></td>
							<td><p>작성일</p></td>
							<td><p>1</p></td>
						</tr>
						<tr>
						   <th scope="row"><p><input type="checkbox"/></p></th>
							<td><p>제목1</p></td>
							<td><p>작성일</p></td>
							<td><p>1</p></td>
							</tr>
						<tr>
							<th scope="row"><p><input type="checkbox"/></p></th>
							<td><p>제목1</p></td>
							<td><p>작성일</p></td>
							<td><p>1</p></td>
						</tr>
						<tr>
							 <th scope="row"><p><input type="checkbox"/></p></th>
							<td><p>제목1</p></td>
							<td><p>작성일</p></td>
							<td><p>1</p></td>
						</tr>
					  </tbody>
				 </table>
	
				<table id="foogg">
					<thead>
						<tr align="center">
							<th style="width : 30%;"><input class="inCheck" type="checkbox"/><button class="btn btn-success">선택 삭제</button></th>
							<th style="width : 50%;">
								<button class="btn btn-success">&lt</button>
								<button class="btn btn-success">1</button>
								<button class="btn btn-success">2</button>
								<button class="btn btn-success">3</button>
								<button class="btn btn-success">4</button>
								<button class="btn btn-success">&gt</button>
							
							</th>
							<th style="width : 10%;"><button class="btn btn-success">삭제</button></th>
							<th style="width : 10%;" ><button class="btn btn-success">글쓰기</button></th>
						</tr>
					</thead>
				</table>
			</div>
	</div>		

	
	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>