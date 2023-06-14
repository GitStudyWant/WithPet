<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

        <div id="content" align="center" >
			<br>
			<h2><b>문의사항  세부조회</b></h2>
			<br>

            <table id="questionTable" border="2px">
                <tr>
					<th rowspan="2">${inquiryNo}</th>
					<th rowspan="2"></th>
					<td style="width: 250px;"><b>사용자 고유번호</b></td>
					<td style="width: 250px;"></td>
					
                </tr>
				<tr>
					<td style="width: 250px;"><b>사용자 닉네임</b></td>
					<td style="width: 250px;">${member.memId}</td>
				</tr>
				<tr>
					<th colspan="4">${inquiryTitle}</th>
				</tr>
                <tr style="border-bottom: 0px;">
                    <td colspan="4" style="text-align: right; padding-right: 20px;">${inquiryCreateDate}</td>
                </tr>
                <tr>
                    <td colspan="4" class="contentStyle">${inquiryContent}</td>
                </tr>
                <tr>
                    <td colspan="4" style="background-color: rgb(122, 162, 223); height: 30px;"></td>
                </tr>
                <c:when test="${inquiryStatus == 'Y'}">
	                <tr>
	                    <td colspan="4" class="contentStyle">${inquiryAnswer}</td>
	                </tr>
                </c:when>
	                <tr>
	                    <td colspan="4" id="texta">
							<form action="answerUpdate.ad" method="post">
								<input type="hidden" name="qno" value="${inquiryNo}">
								<textarea name="answer" cols="30" rows="10"></textarea><br>
								<button class="btn btn-outline-primary btn-light btn-sm">답변등록</button>
							</form>
						</td>
	                </tr>
            </table>
			<br><br>
        </div>
    </div>

</body>
</html>