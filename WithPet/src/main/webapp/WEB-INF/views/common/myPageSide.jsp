<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    #myPageSide{
        width: 15%;
        height: 1000px;
        border-right : 2px solid rgb(229, 221, 221);
        display : inline-block;
        box-sizing: border-box;
        position:absolute;
        z-index:1;
    }

    #myPagePropile{
        width : 100%;
        height : 30%;
        border-bottom : 2px solid rgb(229, 221, 221);
    }

    #myPageMenu{
        width : 100%;
        height : 70%;
    }

    #userImg{
        width : 150px;
        height : 150px;
        margin-top : 45px;
        margin-bottom : 15px;
    }

    .userSetting{
        width : 30px;
        height : 30px;
        margin-left: 10px;
    }
    
    .padding_left_30px{
        padding-left : 67px;
    }

    .div_inline{
        display : inline-block;
    }

    #sideBar{
        text-align : center;
        padding-left : 0px;
    }

    #sideBar>li{
        font-size: 20px;
        text-decoration: none;
        list-style: none;
    }

    #pro{
	    width: 100%;
	    height: 30%;
	    border-bottom : 2px solid rgb(229, 221, 221);
    }
    
    #mune{
        width: 100%;
        height: 69%;
    }
    #main{
        width: 79%;
        height: 100%;
        display: inline-block;
    }
    img{
        display: inline;
    }

    #memberimg{
        width: 50%;
        height : 50%;
        border-radius: 100px;
        margin-top: 60px;
    }
    
    #pro b{ font-size:20px;}
    @media (max-width: 770px) { #pro b { font-size: 12px; } }

    #memberoption{
        width: 10%;
        height : 10%;
        border-radius: 100px;
        padding-bottom : 10px;
    }

    #sideMenu{
        width : 100%;
        margin-top: 50px;
    }

    #sideMenu tr{
        width: 100%;
        height : 70px;
    }

    #sideMenu th{
        width: 100%;
        height : 100%;

    }

    #sideMenu a{
        font-size : 20px;
        color : rgb(73, 166, 112);
        text-decoration: none;
    }
    @media (max-width: 770px) { #sideMenu a { font-size: 12px; } }

</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp" />

    <div id="myPageSide">
        <div id="pro">
            <div align="center">
            <img id="memberimg" src="resources/myPage/user.png" alt="">
            </div>
            <br>
            <div align="center">
            	<img id="memberoption" src="resources/myPage/option.png" alt="">
                <b>${ loginMember.memNick }</b>
            </div>
        </div>

        <form action="" method="post" id="postForm">
        	<input type="hidden" name="memberId" value="${ loginMember.memId }"/>
        </form>
        <div id="mune">
            <table id="sideMenu">
                <thead align="center">
                    <tr>
                        <th><a onclick="myPage();">내 활동</a></th>
                    </tr>
                    <tr>
                        <th><a onclick="myPage();">쪽지</a></th>
                    </tr>
                    <tr>
                        <th><a onclick="myPage();">채팅</a></th>
                    </tr>
                    <tr>
                        <th><a href="memberDiaryMain.me">다이어리</a></th>
                    </tr>
                    <tr>
                        <th><a href="myPageFriend.me">친구</a></th>
                    </tr>
                    <tr>
                        <th><a onclick="myPage();">포인트</a></th>
                    </tr>
                    <tr>
                        <th><a onclick="myPage();">문의사항</a></th>
                    </tr>
                    <tr>
                        <th><a onclick="myPage();">내 코스</a></th>
                    </tr>
                    <tr>
                        <th><a onclick="myPage();">내 예약</a></th>
                    </tr>
                </thead>
            </table>
            <script>
                function myPage(){
                    $('#postForm').attr("action", 'myPage').submit();
                };
            </script>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        </div>
    </div>

</body>
</html>