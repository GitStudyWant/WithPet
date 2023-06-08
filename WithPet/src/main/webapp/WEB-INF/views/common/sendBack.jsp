<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
	if('${loginMember}' == ''){
		$.ajax({
			url : "sendBack.me",
			type : "get",
			data : {},
			success : function(result){
				location.href = result;
			}
		})
	}
	</script>

</body>
</html>