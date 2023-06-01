<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>헤더</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<style>
        div {box-sizing:border-box;} 

        #header {
            width:100%;
            height:130px;
            background-color: rgb(73, 166, 112);
            color:white;
        }
        #header a {text-decoration:none; color:white;}

        #header_1 {width: 10%; height:100%; float:left;}
        #header_2 {width: 15%; height:100%; float:left;}
        #header_3 {width: 15%; height:100%; float:left;}
        #header_4 {width: 21%; height:100%; float:left;}
        #header_5 {width: 12%; height:100%; float:left;}
        #header_6 {width: 12%; height:100%; float:left;}
        #header_7 {width: 10%; height:100%; float:left;}

        #header_1>img {height:100%; position:absolute; margin:auto; top:0px; bottom:0px; right:0px; left:0px;}

        #header_2{text-align:center; line-height:60px; font-size:17px; margin-top:10px; padding-top:40px;}
        @media (max-width: 470px) { #header_2 { font-size: 8px; } }
        #header_2_a{padding-bottom: 50px; transform : scale(1);}
        #header_2_detail{width:80%; line-height:35px; font-size:13px; background-color:white; color:black; margin-left:10%; display:none; border-radius:10%; border:black solid 1px;}
        @media (max-width: 470px) { #header_2_detail { font-size: 13px; } }
        #header_2>a:hover{cursor:pointer;}
        #header_2>a:hover + div{display:block;}
        #header_2>a~div:hover{cursor:pointer; display:block;}

        #header_3{text-align:center; line-height:60px; font-size:17px; margin-top:10px; padding-top:40px; position:relative;}
        @media (max-width: 470px) { #header_3 { font-size: 8px; } }
        #header_3_a{padding-bottom: 50px; transform : scale(1);}
        #header_3_detail{width:80%; line-height:35px; font-size:13px; background-color:white; color:black; position:absolute; display:none; margin-left:10%; border-radius:10%; border:black solid 1px;}
        @media (max-width: 470px) { #header_3_detail { font-size: 13px; } }
        #header_3>a:hover{cursor:pointer;}
        #header_3>a:hover + div{display:block;}
        #header_3>a~div:hover{cursor:pointer; display:block;}

        #header_4{text-align:center; line-height:60px; font-size:17px; margin-top:10px; padding-top:40px; position:relative;}
        @media (max-width: 470px) { #header_4 { font-size: 8px; } }
        #header_4_a{padding-bottom: 50px; transform : scale(1);}
        #header_4_detail{width:100%; line-height:35px; font-size:13px; background-color:white; color:black; position:absolute; display:none; border-radius:10%; border:black solid 1px;}
        @media (max-width: 470px) { #header_4_detail { font-size: 13px; } }
        #header_4>a:hover{cursor:pointer;}
        #header_4>a:hover + div{display:block;}
        #header_4>a~div:hover{cursor:pointer; display:block;}

        #header_5{text-align:center; line-height:60px; font-size:17px; margin-top:10px; padding-top:40px; position:relative;}
        @media (max-width: 470px) { #header_5 { font-size: 8px; } }
        #header_5_a{padding-bottom: 50px; transform : scale(1);}
        #header_5_detail{width:100%; line-height:35px; font-size:13px; background-color:white; color:black; position:absolute; display:none; border-radius:10%; border:black solid 1px;}
        @media (max-width: 470px) { #header_5_detail { font-size: 13px; } }
        #header_5>a:hover{cursor:pointer;}
        #header_5>a:hover + div{display:block;}
        #header_5>a~div:hover{cursor:pointer; display:block;}

        #header_6{text-align:center; line-height:60px; font-size:17px; margin-top:10px; padding-top:40px; position:relative;}
        @media (max-width: 470px) { #header_6 { font-size: 8px; } }
        #header_6_a{padding-bottom: 50px; transform : scale(1);}
        #header_6_detail{width:100%; line-height:50px; font-size:17px; background-color:white; color:black; position:absolute; display:none; border-radius:10%; border:black solid 1px;}
        @media (max-width: 470px) { #header_6_detail { font-size: 13px; } }
        #header_6>a:hover{cursor:pointer;}
        #header_6>a:hover + div{display:block;}
        #header_6>a~div:hover{cursor:pointer; display:block;}

        #header_7 {text-align:right; line-height:60px; font-size:17px; padding-right:2%;}
        @media (max-width: 470px) { #header_7 { font-size: 13px; } }
        #header_7>a:hover {cursor:pointer;}
        #header_2_detail_4>a{text-decoration:none; color:black;}
        
    </style>

</head>
<body>	
	    <div id="header">
        <div id="header_1"></div>
        <div id="header_2"><a id="header_2_a">Trip</a>
            <div id="header_2_detail">
                <div id="header_2_detail_1">내 주변 조회</div>
                <div id="header_2_detail_2">교통 예약하기</div>
                <div id="header_2_detail_3">숙소 예약하기</div>
                <div id="header_2_detail_4"><a href="placeList">여행코스 추천</a></div>
            </div>
        </div>
        <div id="header_3"><a id="header_3_a">Community</a>
            <div id="header_3_detail">
                <div id="header_3_detail_1" onclick="location.href='list.review'">리뷰</div>
                <div id="header_3_detail_2" onclick="location.href='list.free'">자유</div>
                <div id="header_3_detail_3" onclick="location.href='list.qna'">질문</div>
            </div>
        </div>
        <div id="header_4"  onclick="location.href='list.creator'"><a>Creator</a></div>
        <div id="header_5"  onclick="location.href='list.share'"><a>Share</a></div>
        <div id="header_6"  onclick="location.href='list.notice'"><a>Notice</a></div>
        <div id="header_7"><a data-bs-toggle="modal" data-bs-target="#loginModal">Login</a>
        <p id="token-result"></p>
        </div>
               
    </div>
    
    <jsp:include page="../member/modal/memberModal.jsp" />

    <script>
        $('#header a').on({'mouseenter' : function(){
            var tag = $(this).text();
            var tagcompare = {'Trip' : '여행', 'Community' : '커뮤니티', 'Creator' : '크리에이터', 'Share' : '공유', 'Notice' : '공지'};

            for(var key in tagcompare){
                if(tag == key){
                    $(this).text(tagcompare[key]);
                }
            }
            }
        })

        $('#header a').on({'mouseout' : function(){
            var tag = $(this).text();
            var tagcompare = {'여행' : 'Trip', '커뮤니티' : 'Community' , '크리에이터' : 'Creator', '공유' : 'Share', '공지' : 'Notice'};

            for(var key in tagcompare){
                if(tag == key){
                    $(this).text(tagcompare[key]);
                }
            }
            }
        })

        $('#header a+div div').on({'mouseenter' : function(){
            var tag = $(this).parent().parent().children().eq(0).text();
            var tagcompare = {'Trip' : '여행', 'Community' : '커뮤니티', 'Creator' : '크리에이터', 'Share' : '공유', 'Notice' : '공지'};

            for(var key in tagcompare){
                if(tag == key){
                    $(this).parent().parent().children().eq(0).text(tagcompare[key]);
                }
            }
            }
        })

        $('#header a+div div').on({'mouseout' : function(){
            var tag = $(this).parent().parent().children().eq(0).text();
            var tagcompare = {'여행' : 'Trip', '커뮤니티' : 'Community' , '크리에이터' : 'Creator', '공유' : 'Share', '공지' : 'Notice'};

            for(var key in tagcompare){
                if(tag == key){
                    $(this).parent().parent().children().eq(0).text(tagcompare[key]);
                }
            }
            }
        })
    </script>

</body>
<meta name="viewport" content="width=device-width,initial-scale=1">
</html>

