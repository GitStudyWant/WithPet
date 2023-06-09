<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<style>

	body{
		padding: 0px! important;
	}
	
	#body{
		height: 1000px;
		width: 100%;
		background-color:white;
		box-sizing: border-box;
		position:absolute;
		margin-left:15%;
	}
	
	#mypageFooter{
		margin-top:1000px;
	}

	#mainSi{
		width : 20%;
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
        height : 65px;
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

	<jsp:include page="../common/adminMyPageSide.jsp" />

	<div id="body">
			<div id="mainmain">
				<h1>회원 관리</h1>	
    <hr>
    <br><br>
    <form action="adminMemberList" method="post">
        <table id="memberlist" align="center">
           <thead>
            <tr>
                <td colspan="7">
                    <select id="search" name="search">
                        <option name="search" value="memberId">아이디</option>
                        <option name="search" value="nickname">닉네임</option>
                        <option name="search" value="report">누적신고수 높은순</option>
                    </select> : <input type="text" name="Skeyword" id="searchGo" onclick="noSearch();">
                    <button class="actBtn" type="submit">검색</button>
                </td>
            </tr>
            <tr>
                <th colspan="5" style="color:#052159;"><b></b></th>
                <th><button class="actBtn" onclick="updateMemType();">상태 변경</button></th>
            </tr>
            <tr></tr>
            <tr height="20"></tr>
            <tr>
                <th>회원번호</th>
                <th width="100px;">아이디</th>
                <th>닉네임</th>
                <th width="250px;">활동정보<br>(가입일자/작성글 수/댓글 수/대댓글 수)</th>
                <th width="90px;">보유 포인트</th>
                <th width="90px;">누적신고 수</th>
                <th width="90px;">회원상태</th>
                <th>선택</th>
            </tr>
           </thead>
           </tbody>
                <c:choose>
                    <c:when test="${ empty memberList }">
                        <tr><td colspan="3">회원이 없습니다.</td></tr>
                    </c:when>
                    <c:otherwise>
                             <c:forEach var="m" items="${memberList}">
                             <tr>
                            <td>${m.memberNo}</td>
                            <td>${m.memberId}</td>
                            <td>${m.nickname}</td>
				   			<td>(${m.enrollDate} / ${m.boardCount}/ ${m.replyCount}/  ${m.reReplyCount})</td>
				    		<td>${m.pointSum}</td>
				    		<td>${m.reportNo}</td>
				    		<td class="member${m.memberNo}">
                       			 <select name="memType">
	                                <option value="A">일반 회원</option>
	                                <option value="B">사업자 회원</option>
	                                <option value="C">정지 회원</option>
	                                <option value="D">관리자 회원</option>
                            	</select> 
                            </td>
                    <td><input type="checkbox" name="memberType" value="${m.memberNo}"></td>
                	</tr>
                             </c:forEach>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>				
			   
				
			</div>
	</div>		
	
	<div id="mypageFooter"><jsp:include page="../common/footer.jsp" /></div>
	
</body>
</html>