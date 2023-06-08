<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${ empty loginMember }">
		<script>
			$.ajax({
				url : "sendBack.me",
				type : "get",
				data : {},
				success : function(result){
					location.href = result;
				}
			})
		</script>
	</c:if>

</body>
</html>