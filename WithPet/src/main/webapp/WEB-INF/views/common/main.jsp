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
	background-color:lightyellow;
	}
	
	.btnn{
	background-color:rgb(73, 166, 112);
	color:white;
	border-radius:5px;
	border: 1px rgb(73, 166, 112);
	width: 60px
	}
	
	#keywordResult{
		width : 400px;
		border : 1px solid rgb(73, 166, 112);
		background-color : white;
		border-radius : 5px;
		padding : 10px;
		display : none;
	}
	
	.goBestSearch{
		text-decoration : none;
		color : black;
	}
	
	#bestKeyword{
		margin-left : 690px;
		margin-top : 20px;
	}
	
	#searchBtn{
		position : absolute;
		margin-top : 31px;
		margin-left : 10px;
		
	}

  	
</style>
</head>
<body>

	<jsp:include page="header.jsp" />
	
	<div id="body">
		<div id="searchBar">
			<form action="goSearch" method="GET">
				<input type="text" style="margin-left:700px; margin-top:30px; width: 400px" id="searchKeyword" name="searchKeyword" onkeyup="searchKeyword1(this);">
				<div id="keywordResult" style="margin-left:700px;"></div> 
				<button type="submit" class="btnn" id="searchBtn">검색</button><br>
				<div id="bestKeyword"></div>
			</form>
		</div>	
	</div>
	
	
	
	
	
	<script>
	
	function searchKeyword1(e){
		$.ajax({
			url : 'searchKeyword',
			data : {
				key : $(e).val()
			},
			success : function(result){
				console.log(result);
				let searchKey = '';
					for(let i in result){
						if($(e).val() != ''){
							searchKey += '<p>' + result[i].searchKeyword + '<p>'
						}
					}
					if($(e).val() == '' || result.length == 0){
						$('#keywordResult').css('display','none');
					}
					else {
						$('#keywordResult').html(searchKey);
						$('#keywordResult').css('display','block');
					} 
				
					$('#keywordResult>p').click(function(){
						let keywordPick = $(this).text();
						$('#searchKeyword').val(keywordPick);
						$('#keywordResult').css('display', 'none');
					})
				},
			error : function(){
				console.log('검색어 자동완성 실패 ㅠㅠ ');
			}
		})
		
	}
	

	$(function(){
	
		$.ajax({
			url : 'bestKeyword',
			success : function(result){
				var value= '<b>인기검색어 : </b>';
				for(let i in result){
					value +='<a class="goBestSearch" href="goSearch?searchKeyword='
					      + result[i].searchKeyword+'">'
					      + result[i].searchKeyword + '</a>' + ' | ';
				}
				$('#bestKeyword').html(value);
			},
			error : function(){
				console.log('인기 검색어 조회 실패 ㅜㅜ');
			}
		});
	})
	
	
	</script>
	
	
	
	
	
	<jsp:include page="footer.jsp" />
	
</body>
</html>