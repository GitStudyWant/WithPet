<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정</title>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<style>

	body{
		padding: 0px! important;
	}
	
	#body{
		width: 85%;
		height: 1000px;
		background-color:white;
		box-sizing: border-box;
		position:absolute;
		float:left;
		margin-left:15%;
		
	}
	
	#modifyFooter{
		margin-top:1000px;
	}
	
	#body>p{
		margin-top:15px;
		text-align:center;
		font-size:35px;
	}

	#modifyfrontmain{
		width : 100%;
		height : 1000px;
		padding-top : 15px;
		float:left;
	}
	
	#modifyfrontmain p{
		font-size:25px;
		margin-left:60px;
	}
	
	#modifyfrontdiv{
		height:500px;
		text-align:center;
	}
	
	#modifyfrontdiv table{
		width : 300px;
		margin:auto;
		margin-top:120px;
	}
	
	#modifyfrontdiv td{
		height: 40px;
		border : 1px solid black;
	}
	
	#modifyfrontdiv p{
		margin: 0px;
		width : 100%;
		font-size : 15px;
	}
	
	#modifyfrontdiv input{
		box-sizing: border-box;
		width : 100%;
		height: 100%;
	}

</style>
</head>
<body>
	<div id="memoSide"><jsp:include page="../../common/myPageSide.jsp" /></div>
	<div id="memoSendback"><jsp:include page="../../common/sendBack.jsp" /></div>
	
	<div id="body">	
		<div id="modifyfrontmain">
			<form action="memberPwdCompare" method="Post">
			  <div>
			  	<p style="font-size:25px; text-align:center; margin:0px">정보수정</p>
			  	<input type="hidden" name="memId" value="${loginMember.memId}">
			  </div>
			  <div id="modifyfrontdiv">
		    		<table>
		    			<tr>
		    				<td colspan="2" witdh="260" style="background-color:aliceblue"><p>비밀번호를 입력해주세요</p></td>
		    			</tr>
		    			<tr>
		    				<td width="160" style="padding:0px;"><input type="password" name="memPwd" style="width:100%"></td>
		    				<td width="60"><button class="btn btn-primary" style="height:35px">Submit</button></td>
		    			</tr>
		    		</table>
		    	</div>
		    </form>
		 </div>
	</div>
	
	<div id="modifyFooter"><jsp:include page="../../common/footer.jsp" /></div>
	
</body>
</html>