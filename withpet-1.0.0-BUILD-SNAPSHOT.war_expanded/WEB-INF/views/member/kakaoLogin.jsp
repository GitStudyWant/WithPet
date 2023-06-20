<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<script>
	
	$(document).ready(function () {
		let codeURL = new URL(window.location.href);
        let code= codeURL.searchParams.get('code');
        
        if(code != null){
        	
        	function kakaoGetTokenUser(){
        		
        		$.ajax({
         	    	url : "kakaoGetTokenUser",
         	    	type : 'get',
         	    	data : {
         	    	code : code,
         	    	},
         	    	success : function(result){
         	    		location.href = result;
         	    	},
                    error: function(xhr, type){
                        console.log(xhr);
                        console.log(type);
                    }
         	    })
        	};
        	
        	kakaoGetTokenUser();
        	
        }
        
	})
	</script>
</body>
</html>