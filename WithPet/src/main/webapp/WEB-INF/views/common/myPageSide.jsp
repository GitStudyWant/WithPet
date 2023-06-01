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
        width: 296px;
        height: 1000px;
        border-right : 4px solid rgb(229, 221, 221);
        display : inline-block;
        box-sizing: border-box;
    }

    #myPagePropile{
        width : 100%;
        height : 30%;
        border-bottom : 4px solid rgb(229, 221, 221);
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
    border-bottom : 4px solid rgb(229, 221, 221);
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
        width: 150px;
        height : 150px;
        border-radius: 100px;
        margin-top: 30px;
    }

    #memberoption{
        width: 50px;
        height : 50px;
        border-radius: 100px;
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
        font-size : 30px;
        color : rgb(73, 166, 112);
        text-decoration: none;
    }


    


</style>
</head>
<body>
    <div id="myPageSide">
        <div id="pro">
            <div align="center">
            <img id="memberimg" src="resources/myPage/user.png" alt="">
            </div>
            <br>
            <div align="center">
                <b>닉네임</b>
            </div>
            <img id="memberoption" src="resources/myPage/option.png" alt="">
        </div>
        <div id="mune">
            <table id="sideMenu">
                <thead align="center">
                    <tr>
                        <th><a href="myPage">내 활동</a></th>
                    </tr>
                    <tr>
                        <th><a href="myPage">쪽지</a></th>
                    </tr>
                    <tr>
                        <th><a href="myPage">채팅</a></th>
                    </tr>
                    <tr>
                        <th><a href="myPage">다이어리</a></th>
                    </tr>
                    <tr>
                        <th><a href="myPage">친구</a></th>
                    </tr>
                    <tr>
                        <th><a href="myPage">포인트</a></th>
                    </tr>
                    <tr>
                        <th><a href="myPage">문의사항</a></th>
                    </tr>
                </thead>
            </table>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        </div>
    </div>

</body>
</html>