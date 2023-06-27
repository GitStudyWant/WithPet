<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<jsp:include page="../common/header.jsp" />
	
	<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js-->
<script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">

	
<style>
    #board-head{
        font-weight: bolder ;
        font-size: 30px;
        padding-left: 10px;
    }
    #board-subtext{
        font-weight: bolder ;
        font-size: 20px;
        height: 45px;
        color: white;
        background-color: rgb(73, 166, 112);
        margin-left: 10px;
    }
    #wrap{
        padding-top: 100px;
        background-color:white;
        height: 100%;
        width: 80%;
        margin: auto;
    }

	#body{
	height: 1500px;
	background-color:lightyellow;
	}
	

    #boardTitle{
        font-weight: bolder ;
        font-size: 20px;
        margin-top: 15px;
        display:inline-block;
        width: 60%;
        margin-left: 10px;
    }    

    #userImg{
        margin-top: 15px;
        display:inline-block;
        width: 10%; height: 40px;
    }      

    #userId{
        margin-top: 15px;
        display:inline-block;
        width: 10%; height: 40px;
    }    
    
    #thumbnail{
        margin-top: 10px;
        margin-right: 10px;
        display:inline-block;
        width: 18%; height: 200px;
    }
    
    #boardContent{
        display:inline-block;
        margin-left: 10px;
        width: 80%; height: 150px;
    }    

     .tag {
            display: inline-block;
            margin-top: 5px;
            margin-top: 5px;
            margin-left: 10px;
            padding:5px;
            width: auto;
			height: auto;
            line-height: 40px;
            text-align: center;
            color: white;
            font-weight: bolder;
            background-color: rgb(73, 166, 112);
        }
     .tag-item{
      		float: left;
      		text-align:center;
      		margin-top: 5px;
      		margin-bottom: 10px; 			
       		margin-right: 10px;
       		margin-left: 10px;
   			background-color: rgb(73, 166, 112);
   			color: white;
            font-weight: bolder;
            padding:5px;
            width: auto;
			height: auto;
			vertical-align:middle;
      }
      #tag, #tag2, #tag3, #tag4, #tag5{
       display: inline-block;
            margin-top: 5px;
            margin-left: 10px;
            padding:5px;
            width: auto;
			height: auto;
            line-height: 40px;
            text-align: center;
            color: white;
            font-weight: bolder;
            background-color: rgb(73, 166, 112);
    }
    

</style>
</head>
<body>

	        <c:if test="${ empty sessionScope.loginMember }">
            <script>
            	window.alert('비정상적인 접근입니다. 로그인을 해주세요');
                history.back();
            </script>
            </c:if>
	
	<div id="body">
        <div id="wrap">

            <br><br><br>
            
            <label for="" id="board-head">Q&A게시판</label>
            <br>
            <label for="" id="board-subtext">각자 고민을 나눠봐요&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
        

            <br><br><br>
            
            
            <div style="width: 60%; margin: auto;">
				<form method="post" action="insert.qna" enctype="multipart/form-data" id="boardInsert">
					<input type="hidden" id="boardWriter" name="boardWriter" value="${ loginMember.memId }">
					<input type="text" name="boardTitle" style="width: 40%;" placeholder="제목" required/>
					<br><br> 
					<input type="file" id="upfile" class="form-control-file border" name="upfile" style="border:solid 1px lightgray;display: inline-block;">
					<textarea id="summernote" name="boardContent">
					</textarea>

					<div align="center">
						<br>
						<div class="tag-list-board" id="tagBridge" style=" margin: auto; width: 100%; height : 50px;border: 1px solid lightgray;" align="center">
                		</div>
						<br>
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#tagModal">태그추가</button>
                	
						<br><br>
	                    <button type="submit" class="btn btn-primary" form="boardInsert" onclick="setTagNames()">등록하기</button>
	                    <button type="reset" class="btn btn-danger" >취소하기</button>
                	</div>
				</form>
			</div>
			<br>
            

        </div>
    </div>
    
    <!-- Modal -->
    <div class="modal fade" id="tagModal" tabindex="-1" role="dialog" aria-labelledby="tagModalLabel" data-backdrop="static">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="tagModalLabel">태그 추가</h4>
                </div>
                <div class="modal-body">
                    <input type="text" id="newTag" class="form-control" placeholder="태그를 입력하세요" onkeyup="updateTagLength()" maxlength="15">
                    <span style="float: right;" id="tagLength"></span>
                </div>
                <div class="tag-list" style="margin: auto;" align="center">
                	
                </div>
                <div class="modal-footer">
					<button type="button" class="btn btn-success" style="background-color: rgb(73, 166, 112); border: rgb(73, 166, 112); color: white;" data-dismiss="modal" onclick="setTagNames()" >완료</button>                
                    <button type="button" class="btn btn-default" data-dismiss="modal" data-backdrop="false">닫기</button>
                    <button type="button" class="btn btn-primary" onclick="addTag();">추가</button>
                </div>
            </div>
        </div>
    </div>
    
    <script>	
    $(document).ready(function() {
  	  var toolbar = [
  	    ['fontname', ['fontname']],
  	    ['fontsize', ['fontsize']],
  	    ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
  	    ['color', ['forecolor', 'color']],
  	    ['table', ['table']],
  	    ['para', ['ul', 'ol', 'paragraph']],
  	    ['height', ['height']],
  	    ['insert', ['picture', 'link', 'video']],
  	    ['view', ['codeview', 'fullscreen', 'help']]
  	  ];

  	  var setting = {
  	    height: 300,
  	    minHeight: 370,
  	    maxHeight: 500,
  	    focus: true,
  	    lang: 'ko-KR',
  	    toolbar: toolbar,
  	    callbacks: {
  	      onInit: function() {
  	        countCharacters();
  	      },
  	      onKeyup: function(e) {
  	        countCharacters();
  	      },
  	      onPaste: function(e) {
  	        setTimeout(function() {
  	          countCharacters();
  	        }, 0);
  	      },
  	      onImageUpload: function(files, editor, welEditable) {
  	        for (var i = files.length - 1; i >= 0; i--) {
  	          uploadSummernoteImageFile(files[i], this);
  	        }
  	      }
  	    }
  	  };

  	  $('#summernote').summernote(setting);

  	  function countCharacters() {
  	    var content = $('#summernote').summernote('code');
  	    var maxLength = 1300; // 최대 글자 수

  	    var currentLength = stripHTMLTags(content).length;

  	    if (currentLength > maxLength) {
  	      var truncatedContent = stripHTMLTags(content).substring(0, maxLength);
  	      $('#summernote').summernote('code', truncatedContent);
  	      currentLength = maxLength; // 글자 수 제한 후 현재 글자 수를 최대 글자 수로 설정
  	    }

  	    $('#BoardLength').text(currentLength + '/' + maxLength);
  	  }

  	  function stripHTMLTags(content) {
  	    var div = document.createElement("div");
  	    div.innerHTML = content;
  	    return div.textContent || div.innerText || "";
  	  }
  	});
 function uploadSummernoteImageFile(file, el) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "uploadSummernoteImageFile",
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(data) {
				$(el).summernote('editor.insertImage', data.url);
			}
		});
	}
			    
			    function setTagNames() {
			        var tagItems = $('.tag-list-board').children('.tag-item');
			        var tagNames = tagItems.map(function() {
			            var tagName = $(this).text().trim();
			            return tagName.substring(0, tagName.length - 1); // "×" 문자를 제거하고 태그 이름만 반환
			        }).get();
			        
			        $('input[name="tagNames"]').remove(); // 기존의 tagNames hidden input 요소 제거
			        
			        tagNames.forEach(function(tagName) {
			            var inputElement = $('<input>')
			                .attr('type', 'hidden')
			                .attr('name', 'tagNames')
			                .val(tagName);
			            
			            $('#tagBridge').append(inputElement);
			        });
			    }
			    
			    
    		
			    function updateTagLength() {
			    	var tagName = $('#newTag').val();
			    	var currentLength = tagName.length;
			    	var maxLength = 15;
			
			        $('#tagLength').text(currentLength + '/' + maxLength);
			        
			        if (currentLength > maxLength) {
			            $('#newTag').val(tagName.substring(0, maxLength));
			        }
			    }
    
			    function addTag() {
			        var tagName = $('#newTag').val().trim();
			        if (tagName !== '') {
			            var tagCount = $('.tag-list .tag-item').length;
			            var maxTags = 5;

			            if (tagCount >= maxTags) {
			                alert('태그는 최대 5개까지만 추가할 수 있습니다.');
			                return;
			            }
			            
			            var isDuplicate = $('.tag-list').find('.tag-item:contains(' + tagName + ')').length > 0;
                        if (isDuplicate) {
                            alert('중복된 태그입니다. 다른 태그를 입력해주세요.');
                            return;
                        }

			            $.ajax({
			                url: 'addtag.bo',
			                type: 'POST',
			                dataType: 'text',
			                contentType: 'application/json',
			                data: JSON.stringify({
			                    tagName: $('#newTag').val()
			                }),
			                success: function(result) {
			                    console.log(result);

			                    if (result === 'success') {
			                        
			                        var tagItem = $('<span class="tag-item">' + tagName + '<span class="close-btn">&times;</span></span>');
			                        tagItem.find('.close-btn').on('click', function() {
			                            var $tagItem = $(this).closest('.tag-item');
			                            var tagName = $tagItem.text().trim();
			                            $('.tag-list-board').find('.tag-item:contains(' + tagName + ')').remove();
			                            $tagItem.remove();
			                        });
			                        $('.tag-list').append(tagItem);
			                        $('#newTag').val('');
			                        
			                        var maxLength = 15;
			                        $('#tagLength').text(0 + '/' + maxLength);
			                    }
			                },
			                error: function() {
			                    console.log('실패');
			                    alert('태그 추가가 실패하였습니다.');
			                }
			            });
			        }
			    }
			    
			   
			    $(document).on('click', '.close-btn', function() {
			        var $tagItem = $(this).closest('.tag-item');
			        var tagName = $tagItem.text().trim();
			        $('.tag-list').find('.tag-item:contains(' + tagName + ')').remove();
			        $tagItem.remove();
			      });

			    $(document).on('click', '.btn-success', function() {
			        var tagItems = $('.tag-list').children('.tag-item').clone();
			        $('.tag-list-board').empty().append(tagItems);
			        $('#tagModal').modal('hide');
			      });
			</script>
    
</body>
</html>