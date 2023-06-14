<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    #adminMyPageSide{
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
        margin-top: 30px;
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

    <div id="adminMyPageSide">
        <div id="pro">
            <div align="center">
            <img id="memberimg" src="resources/myPage/user.png" alt="">
            </div>
            <br>
            <div align="center">
            	<img id="memberoption" src="resources/myPage/option.png" alt="">
                <b>닉네임</b>
            </div>
        </div>
        <div id="mune">
            <table id="sideMenu">
                <thead align="center">
                    <tr>
                        <th><a href="adminMemberList">회원 관리</a></th>
                    </tr>
                    <tr>
                        <th><a href="inquiryManagement">문의사항 관리</a></th>
                    </tr>
                    <tr>
                        <th><a href="adminReportList">신고 관리</a></th>
                    </tr>
                    <tr>
                        <th><a href="#">금칙어 관리</a></th>
                    </tr>
                    <tr>
                        <th><a href="adminTransportation">교통수단 관리</a></th>
                    </tr>
                    <tr>
                        <th><a href="transReservationList">교통예약 관리</a></th>
                    </tr>
                    <tr>
                        <th><a href="cafeResManagement">카페예약 관리</a></th>
                    </tr>
                    <tr>
                        <th><a href="cafeManagement">카페 관리</a></th>
                    </tr>
                    <tr>
                        <th><a href="adminPlaceList">코스 장소 관리</a></th>
                    </tr>
                    
                </thead>
            </table>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        </div>
    </div>

</body>
</html>