<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<% 
	String contextPath = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
.sub_container {
    width: 100%;
    height: auto;
    margin-top: 28px;
}

.sub_container {
    width: 100%;
    height: auto;
    margin-top: 57px;
}
.sub_container > div:last-child {
    padding-bottom: 40px;
}

.sub_container > div:last-child {
    padding-bottom: 80px;
}
.sub_content {
    position: relative;
    padding-bottom: 40px;
}
.sub_content {
    width: 100%;
    padding: 0 4%;
}
.sub_content {
    width: 1200px;
    height: auto;
    margin: 0 auto;
    padding-bottom: 80px;
}



    .board_petcafe {
        margin-top: 80px;
        padding-bottom: 20px;
    }
    .petcafe_info{
        display : flex;
        -webkit-box-orient : horizontal;
        flex-direction: row;
        flex-wrap: wrap;
        align-content : space-between;
    }

    .petcafe_info dd.company {
    width: 40%;
    background-image: url();
    background-position: 50px 50px;
	}
	.petcafe_info dd.company {
	    min-height: 57px;
	}
	
	.petcafe_info dd {
	    min-height: auto;
	}
	.petcafe_info dd {
	    background-repeat: no-repeat;
	    box-sizing: border-box;
	    font-size: 18px;
	    color: #666;
	    line-height: 1.3;
	    word-break: keep-all;
	}
	dd {
	    margin-bottom: 0.5rem;
	    margin-left: 0;
	}

    .petcafe_info dd.company {
    min-height: 57px;
    }

    .petcafe_info .btn_wrap {
        width: 100%;
        margin-top: 20px;
    }

    .petcafe_info .btn_wrap a {
    display : inline-block;    
    width: 106px;
    height: 44px;
    line-height: 44px;
    background-color: #fff;
    border: 1px solid #999;
    border-radius: 4px;
    box-sizing: border-box;
    color: #222;
    text-align: center;
    text-decoration : none;
    }

	.petcafe_info dt {
	    margin-bottom: 25px;
	}
	
	.petcafe_info dt {
	    width: 100%;
	    margin-bottom: 35px;
	    font-size: 24px;
	    color: #333;
	    font-weight: 600;
	}
	dt {
	    font-weight: 700;
	}

    .petcafe_info dt {
    width: 100%;
    margin-bottom: 35px;
    font-size: 24px;
    color: #333;
    font-weight: 600;
	}

    .petcafe_info dl + dl {
    padding-left: 30px;
	}

	.petcafe_info dl + dl {
	    width: 500px;
	    padding-left: 50px;
	    box-sizing: border-box;
	}
	
	.petcafe_info dl {
	    position: relative;
	    width: calc(100% - 350px);
	    display: -webkit-box;
	    display: -ms-flexbox;
	    display: flex;
	    flex-direction: row;
	    flex-wrap: wrap;
	    align-content: flex-start;
	}
	
	.petcafe_info {
    width: calc(100% - 444px);
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: horizontal;
    -ms-flex-direction: row;
    flex-direction: row;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    align-content: space-between;
}
	
	dl, ol, ul {
	    margin-top: 0;
	}
	
	ul, ol, li, dl {
	    list-style: none;
	}
	
	@media screen and (max-width: 1199px)
	.petcafe_wrap {
	    max-width: 800px;
	    margin: 0 auto;
	}
	.petcafe_wrap + .petcafe_wrap {
    margin-top: 60px;
    padding-top: 60px;
    border-top: 1px solid #eee;
}
	
	@media screen and (max-width: 1199px)
	.petcafe_body {
	    -webkit-box-orient: vertical;
	    -webkit-box-direction: normal;
	    -ms-flex-direction: column;
	    flex-direction: column;
	}
	
	.petcafe_info dt {
	    margin-bottom: 25px;
	}
	.inline_black{
	    display: inline-block;
	}
	
.title_1 {
    margin-bottom: 15px !important;
}

@media screen and (max-width: 1199px)
.search_box {
    padding: 30px 20px;
}

.search_box {
    position: relative;
    width: 100%;
    border-top: 1px solid #3b3b3b;
    border-bottom: 1px solid #ebebeb;
    background-color: #f8f8f8;
    padding: 30px;
}

.search_input {
    width: 870px;
    height: 44px;
    border: 1px solid #cccccc;
    border-radius: 5px;
    background-color: #fff;
}

.search_input input {
    width: 100%;
    height: 100%;
    font-size: 15px;
    color: #555;
    padding: 0 13px;
}

ul, ol, li, dl {
    list-style: none;
}
.area_chk > li {
    float: left;
    margin-right: 10px;
    margin-top: 10px;
}
element.style {
}

.area_chk input[type="checkbox"] + label {
    width: 101px;
}
.area_chk input[type="checkbox"] + label {
    width: 105px;
    height: 44px;
    text-align: center;
    line-height: 44px;
    display: inline-block;
    position: relative;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    font-size: 15px;
    color: #222222;
    background-color: #eeeeee;
    border-radius: 3px;
}

.area_chk input[type="checkbox"] {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: 0;
    overflow: hidden;
    clip: rect(0,0,0,0);
    border: 0;
}

.search_btn a {
    display: block;
    width: 100%;
    height: 100%;
    font-size: 15px;
    font-weight: bold;
    color: #fff;
    line-height: 44px;
}

.search_form > li {
    float: left;
}
@media screen and (max-width: 767px)
.search_input {
    width: 100%;
    margin-bottom: 10px;
}
@media screen and (max-width: 1199px)
.search_input {
    width: calc(100% - 260px);
}

.search_btn {
    width: 100px;
    height: 44px;
    text-align: center;
    border-radius: 3px;
    background-color: #eb6565;
    margin-left: 10px;
}

@media screen and (max-width: 1199px)
.title_dogCafe {
    font-size: 30px;
    margin-bottom: 26px;
}

.title_dogCafe {
    font-size: 40px;
    font-weight: bold;
    color: #222222;
}
.title_dogCafe {
    margin-bottom: 55px;
}

a, a:link {
    text-decoration: none;
}
a {
    text-decoration: none;
    background-color: transparent;
}

@media screen and (max-width: 1199px)
.search_form_bt {
    right: 20px;
}
.search_form_bt {
    position: absolute;
    width: auto;
    top: 30px;
    right: 30px;
    border-bottom: 0;
    padding: 0;
    margin: 0;
}
.petcafe_body {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: horizontal;
    -ms-flex-direction: row;
    flex-direction: row;
}

html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, menu, nav, output, ruby, section, summary, time, mark, audio, video, input, textarea {
    margin: 0;
    padding: 0;
    border: 0;
    font-size: 100%;
    vertical-align: baseline;
    /* outline: none; */
    -webkit-text-size-adjust: none;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
img {
    vertical-align: middle;
    border-style: none;
}
img, fieldset {
    border: 0;
}
img {
    border: 0;
    max-width: 70%;
    vertical-align: top;
	}
        #pagingArea {width:fit-content; margin:auto;}	
	
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
<div id="container" class="sub_container">
	<div class="sub_content">
	<div>
		<img src="resources/cafe_upfiles/KakaoTalk_20230519_172830644.png" alt="애견카페 로고" class="title_1">
	</div>
	<h2 class="title_dogCafe">애견카페 안내</h2>
			<div class="search_box">
				<ul class="search_form">
					<li class="search_input">
						<input type="text" name="q_searchVal" id="q_searchVal" title="애견카페 검색어 입력" placeholder="검색하실 애견카페명을 입력해주세요." value="">
					</li>
				</ul>
				<ul class="area_pc_chk area_chk">
					<li><input type="checkbox" name="area_all" id="area_all" value=""><label for="area_all">전체</label></li>
					<li><input type="checkbox" class="chk11" name="cafeAddress" id="area_1" value="서울"><label for="area_1">서울</label></li>
					<li><input type="checkbox" class="chk11" name="cafeAddress" id="area_2" value="경기"><label for="area_2">경기</label></li>
					<li><input type="checkbox" class="chk11" name="cafeAddress" id="area_3" value="대전"><label for="area_3">대전</label></li>
					<li><input type="checkbox" class="chk11" name="cafeAddress" id="area_4" value="대구"><label for="area_4">대구</label></li>
					<li><input type="checkbox" class="chk11" name="cafeAddress" id="area_5" value="부산"><label for="area_5">부산</label></li>
				</ul>
				<ul class="search_form search_form_bt">
					<li class="search_btn">
						<a href="#" onclick="searchVal();">
							<img src="" alt="">검색
						</a>
					</li>
				</ul>	
			</div>

	<br><br><br>
	
	
	
	<a href="cafeEnrollForm.bo" style="float:left; background-color: rgb(73, 166, 112); color:white; text-decoration:none; margin-left:880px; width:80x">카페 등록하기</a>
	<div id="paste">
	<c:forEach items="${list}" var="c">
	    <div class="board_petcafe" id="paste${c.cafeNo}">
	            <div class="petcafe_wrap">
	            <input type="hidden" id="cafeAddress" name="cafeAddress"/>
	            <input type="hidden" id="${c.cafeNo}cafeNo" value="${c.cafeNo}">
	            <br>
	            <h1><b>${c.cafeTitle }</b></h1> <br>
	                <div class="petcafe_body">
	                    <div class="petcafe_image">
	                        <p class="img">
	                                <img src="${c.changeName}" alt="카페이미지" style="width:500px; height:400px">
	                        </p>
	                    </div>
	                    <div class="petcafe_info">
	                        <dl>
	                            <dt>서비스</dt>
	                            <image class="inline_black" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMp9zzDfZNZcj0V_NYREG3hGeYt5YSi9JH5g&usqp=CAU" style="width:100px; height: 100px;"/>
	                                <dd class="company inline_black">
	                                    <b class="inline_black"></b>
	                                    <br>
	                                    <p class="inline_black">${c.cafeService}</p>
	                                </dd>
	                        </dl>
	                        <br>
	                        <dl>
	                            <dt>주소</dt>
	                                <dd name="cafeAddress" id="address">${c.cafeAddress}</dd>
	                        </dl> 
	                        <div class="btn_wrap">
	                            <a href="info.do?cno=${c.cafeNo}" id="infor" onclick="info();" class="md_btn">이용안내</a>
	                            <a href="map.do?cafeAddress='${c.cafeAddress}'&cafeTitle='${c.cafeTitle}'" method="POST" class="md_btn">카페위치</a>
	                            <input type="hidden" value="${c.cafeNo}">
	                            <a href="res.me?cno=${c.cafeNo}" method="GET" class="md_btn">예약신청</a>
	                        </div>
	                    </div>
	                  </div>
	                </div>
	            </div>
	</c:forEach>
	</div>
	
	
	
	
	
	
	<script>
			
		var all = document.getElementById('area_all');
		var seoul = document.getElementById('area_1');
		var gyeonggi = document.getElementById('area_2');
		var daejeon = document.getElementById('area_3');
		var daegu = document.getElementById('area_4');
		var busan = document.getElementById('area_5');
		
		
		
		$(all).click(function(){
			location.href= "cafe.bo";
		});
        
		$('.chk11').click(function(){
			
			var keyword = $(this).val();
			var value2 = '';
			
			
			<c:forEach items="${list}" var="c">
			if('${c.cafeAddress}'.includes(keyword)){
				console.log('${list}');
				var asd = 'paste' + "${c.cafeNo}";
				value2 += $('#' + asd).html();
			 }
			</c:forEach>
			$('body').find('#paste').html(value2);
			
		})
		
	</script>	 
	
	<script>
		
	
	</script>
	
	           
	</div>
</div>	
            <div id="pagingArea">
                <ul class="pagination">
                    <c:choose>
                    	<c:when test="${ pi.currentPage eq 1 }">
                    		<li class="page-item disabled"><a class="page-link" href="#">＜</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="cafe.bo?cPage=${pi.currentPage-1}">＜</a></li>
                    	</c:otherwise>
                    </c:choose>
					
					<c:forEach begin="${ pi.startPage }" end="${pi.endPage }" var="p">
						<li class="page-item"><a class="page-link" href="cafe.bo?cPage=${p}">${ p }</a></li>
					</c:forEach>

                    <c:choose>
                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
                    		<li class="page-item disabled"><a class="page-link" href="#">＞</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="cafe.bo?cPage=${pi.currentPage+1}">＞</a></li>
                    	</c:otherwise>
                    </c:choose>
                </ul>
            </div>	
	
	<script>
		
	
	
	
	
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
		<!--<jsp:include page=""/>-->

</body>
</html>