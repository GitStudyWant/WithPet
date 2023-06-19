<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		height : 750px;
		position : relative;
	}

	#mainTable p{
		margin-top: 10px;
	}

	#naviTable{
		width : 100%;
		height : 100px;
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
        margin-top :30px;
        border-top : 1px soild #dee2e6;
	
        
	}

    #foogg>thead>tr{
        width: 25%;
    }

	.inCheck{
		width :20px;
		height: 20px;
		margin-right: 40px;
	}
	
	.thWidth{
		width: 50%;
	}
	
	
	.marginLeft40px{
		margin-left : 40px;
	}
	
	.marginTop30px{
		margin-top : 30px;
	}
	
	.memberProfile{
		width : 25%;
		height : 40%;
		background-color : #dee2e6;

		border-radius: 100px;
		display : inline-block;
		margin-left : 40px;
		margin-top : 20px;
	}
	
	.marginTop0px{
		margin-top : 0px;
	}
	
	.marginBotton20px{
		margin-bottom : 20px;
	}
	
	 #friendImg{
        width: 30%;
        height : 30%;
        border-radius: 100px;
        margin-top: 30px;
    }

	#buttonTable tbody{
		border-bottom: 0px;
	}
	
	#resultSearch{
		width : 400px;
		height : 500px;
		border-radius : 10px;
		background-color : #dee2e6;
		z-index: 100;
		top : -100px;
		left : 0px;
		right : 0px;
		bottom : 0px;
		margin : auto;
		position: absolute;		
		
	}
	
	.btn-Size{
		width: 90px;
		height: 40px;
		padding-left : 0px !important;
		padding-right : 0px !important;
	}
	
	.statusBtn{
		width : 90px;
		height : 35px;
		margin-top : 10px;
	}
	
	.detail{
		width : 100%;
		height : 900px;
	}
	
	.detail>table{
		margin-left : 10px;
	}
	
	.detail>h2{
		margin-left : 10px;
	}
	
	.text-alignC{
		text-align: center;
	}
	.text-alignL{
		text-align: left;
	}
	.text-alignR{
		text-align: right;
	}
	
	.tr-td-70pxsize{
		width : 70px;
	}
	.inquiryTable{
		width : 100%;
		height : 40%;
		border-style : 1px soide #dee2e6 !important;
	}
	
	.tableContent{
		text-align: left;
	}

	.tableTitle{
		width : 300px;
	}

	#mainTable>tbody>tr>td>p{
		margin-top:  30px;
		margin-bottom: 0px;
	}

	#mainTable>tbody>tr>td>input{
		margin-top:  30px;
		border-radius: 20px;
	}

	#mainTable>tbody>tr>td>textarea{
		margin-top:  30px;
		border-radius: 20px;
	}
	
	#tableInupt{
		width : 800px;
	}


</style>
</head>
<body>

<jsp:include page="../../common/myPageSide.jsp" />
	<div id="body">
			<div id="mainmain">
				<table id="naviTable">
					<tr>
						<td class="thWidth"><h2 class="marginLeft40px marginTop30px" align="left">문의 작성</h2></td>
						<td class="thWidth" align="right"></td>
					</tr>
				</table>						
					<div id="detailView">
						<form action="inquiryInsert.me" method="post">
							<table class="table table-hover" id="mainTable">
	
								<thead>
									<tr align="center">
									<th colspan="2"><p>* 무분별한 문의나 욕설, 성희롱 등의 내용이 포함된 경우 관련 법령에 따라 조치될 수 있습니다.</p></th>
									</tr>
								  </thead>
								  <tbody align="center">
									<tr>
										<td class="tableTitle"><p>아이디 : </p></td>
										<td class="tableContent"><input type="text" readonly name="memberId" value="${loginMember.memId}"></td>
									</tr>
									<tr>
										<td class="tableTitle"><p>이메일 : </p></td>
										<td class="tableContent"><input type="text" placeholder="이메일을 입력해주세요." value="${loginMember.memEmail}"></td>
									</tr>
									<tr>
										<td class="tableTitle"><p>문의 제목 : </p></td>
										<td class="tableContent"><input type="text" placeholder="제목을 입력해주세요." id="tableInupt" required name="inquiryTitle" ></td>
									</tr>
									<tr>
										<td class="tableTitle"><p>문의 내용 : </p></td>
										<td class="tableContent"><textarea name="inquiryContent" id="" cols="100" rows="15" placeholder="내용을 입력해주세요" maxlength="1000" ></textarea></td>
									</tr>
								  </tbody>
							</table>
						
							<table id="foogg">
								<thead>
									<tr align="center">
										<th style="width : 30%;"></th>
										<th style="width : 50%;">
												
										</th>
										<th style="width : 10%;"></th>
										<th style="width : 10%;" ><button class="btn btn-success">작성하기</button></th>
									</tr>
								</thead>
							</table>
						</form>	
			    <script>
			    	
					
				</script>
				</div>
			</div>
	</div>		
	<div id="mypageFooter"><jsp:include page="../../common/footer.jsp" /></div>
</body>
</html>