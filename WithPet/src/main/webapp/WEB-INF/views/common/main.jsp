<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
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
	}
	
	#searchBtn{
		position : absolute;
		margin-left: 10px;		
		margin-top: 11px;
	}
	
	#searchBar{
		width : 500px;
		height : 50px;
		border-radius : 50px;
		background-color: rgb(185, 231, 140);
	}

	#search
	{
		padding-top: 50px;
	}

	#searchKeyword{
		margin-top: 10px;
		width: 300px;
	}

	.swiper {
        width: 1200px;
        height: 500px;
    }
	.swiper-slide{
		width: 100%;
		height: 100%;
	}
​
	.swiper-wrapper{
		width : 80%;
		height : 100%;
	}
    /* 이미지 사이즈 조절 */
    .swiper-slide>img {
        width : 100%;
        height : 100%;
    }
​
    /* 화살표 버튼색 변경 (기본색은 파란색) */
    div[class^=swiper-button] {
        color : white;
        background-color : white;
        /* display : none; */ /* 아니면 안보이게 숨기기도 가능 */
    }
	.swiper-button-prev{
		color : white;
	}
	.swiper-button-next{
		color : white;
	}

	#add{
		margin-top: 20px;
	}

	.a1{
      background-color : rgb(138, 204, 138);
       color : white;
       text-decoration: none;
       margin-left : 250px;
       display:inline-block;
       width : 90px;
       height : 50px;
       text-align : center;
	   border-radius: 10px;
     }

	 .a2{
		margin-top: 40px;
		font-size: 28px;
	}
	 #a4{
		font-size: 20px;
		padding-top: 8px;
	 }





</style>
</head>
<body>

	<jsp:include page="header.jsp" />
	
	<div id="body">
		<div id="search" align="center">
			<div id="searchBar">
				<form action="goSearch" method="GET">
					<input type="text"  id="searchKeyword" name="searchKeyword" onkeyup="searchKeyword1(this);">
					<div id="keywordResult"></div> 
					<button type="submit" class="btnn" id="searchBtn">검색</button><br>
				</form>
			</div>
			<div id="bestKeyword"></div>
		</div>

		<div id="add">
			<div id="content_1">
				<!-- Slider main container -->
				<div class="swiper">
					<!-- Additional required wrapper -->
					<div class="swiper-wrapper" align="cneter">
						<!-- Slides -->
						<div class="swiper-slide"><img src="resources/main/Advertising1.jpg"></div>
						<div class="swiper-slide"><img src="resources/main/Advertising2.jpg"></div>
						<div class="swiper-slide"><img src="resources/main/Advertising3.jpg"></div>
						<div class="swiper-slide"><img src="resources/main/Advertising4.jpg"></div>
						<div class="swiper-slide"><img src="resources/main/Advertising5.jpg"></div>
					</div>
				
					<!-- If we need pagination -->
					<div class="swiper-pagination"></div>
				
					<!-- If we need navigation buttons -->
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
				
					<!-- If we need scrollbar -->
				</div>
			</div>
		</div>

			<a href="list.review" class="a1 a2" id="a1">리뷰</a>
			<a href="list.free" class="a1 a2" id="a2">자유</a>
			<a href="list.qna" class="a1 a2" id="a3">질문</a>
			<a href="list.creator" class="a1" id="a4">Creator</a>
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

        // 슬라이더 동작 정의
        const swiper = new Swiper('.swiper', {
            autoplay : {
                delay : 3000 // 3초마다 이미지 변경
            },
            loop : true, //반복 재생 여부
            slidesPerView : 1, // 이전, 이후 사진 미리보기 갯수
            pagination: { // 페이징 버튼 클릭 시 이미지 이동 가능
                el: '.swiper-pagination',
                clickable: true
            },
            navigation: { // 화살표 버튼 클릭 시 이미지 이동 가능
                prevEl: '.swiper-button-prev',
                nextEl: '.swiper-button-next'
            }
        }); 
	
	</script>
	
	
	
	
	
	<jsp:include page="footer.jsp" />
	
</body>
</html>