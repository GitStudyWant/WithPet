<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 다이어리</title>

    
	<link rel="stylesheet" href="resources/css/fullCalendar/main.css">
	
    <link rel="stylesheet" href="resources/css/fullCalendar/vendor/fullcalendar.min.css" />
    <link rel="stylesheet" href='resources/css/fullCalendar/vendor/bootstrap2.min.css' />
    <link rel="stylesheet" href='resources/css/fullCalendar/vendor/select2.min.css' />

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
	
	#diaryFooter{
		margin-top:1000px;
	}
	
	#body>p{
		margin-top:15px;
		text-align:center;
		font-size:35px;
	}

	#schedulemain{
		width : 70%;
		height : 1000px;
		padding-top : 15px;
		float:left;
	}
	
	#diaryOwner{
		font-size:25px;
		margin-left:4%;
	}
	
	#schedulemain a{
		text-decoration:none;
	}
	
	.containerInput{
		width : 30%;
		float : left;
		margin-top:60px;
	}
	
	#schInsert input, #schInsert select, #schUpdate input, #schUpdate select{
		border  :solid 1px lightgray;
	}
	
	#scheduleFriendList{
		width:100%;
		height:150px;
		overflow-y: scroll;
	}
	
	.friendListOne{
		border:solid 1px black;
	}
	
	.friendListOne:hover{
		background-color:green;
		cursor:pointer;
	}
	
	#modal-header1, #modal-header2{
		height:15px;
		background-color:lightgray;
	}
	
	#container{
		width:90%;
	}
	
	#modalTitle1, #modalTitle2{
		font-size:15px;
		text-align:center;
		margin-top:15px;
		margin-bottom:30px
	}
	
	#schSubmitTable, #schModifyTable{
		width:80%;
		text-align:center;
		margin:auto;
	}
	
	#schSubmitTableCate{
		font-size:10px;
		color:gray;
		margin-top:12px;
	}
	
	#scheduleCate, #editCate{
		width:100%;
		height:23px;
	}
	
	#schSubmit{
		width:80%;
		margin:35px 50px;
	}
	
	.schForm1, .schForm2{
	 	font-size:10px;
	 	color:gray;
	 	margin-top:12px;
	 }
	 
	 .schForm1In, .schForm2In{
	 	width:100%;
	 }
	 
	 #scheduleColor{
	 	width:100%;;
	 	height:23px;
	 	color:#D25565
	 }
	 
	 #editColor{
	 	width:100%;
	 	height:23px;
	 }
	 
	 #buttonToggle1{
	 	display:none;
	 	width:50%;
	 	height:20%;
	 	font-size:15px; 
	 	margin-left:25%;
	 	margin-top:20px
	 }
	 
	 #buttonToggle2{
	 	display:none;
	 	width:50%;
	 	height:20%;
	 	font-size:15px;
	 	margin-left:25%;
	 	margin-top:20px;
	 }
	 
	 #viewFriendButton{
	 	font-size:18px;
	 	text-align:center
	 }
	 
	 #viewFriendDiv{
	 	width:80%;
	 	height:400px;
	 	margin:auto;
	 	overflow-y: scroll;
	 }
	
	#scheduleFriendList{
		height:0px;
	}
	
	#viewFriendTd{
		width:20%;
		height:100%;
		text-align:center;
	}
	
	#viewFriendImg{
		width:40px;
		height:40px;
		margin:0px;
		padding:5px;
		border-radius:100%;
	}
	
	#viewFriendNick{
		width:100%;
		margin:0px;
		font-size:13px;
		padding-left:10%;
		padding-bottom:5px;
	}
	
	#viewFriendIntro{
		width:100%;
		margin:0px;
		font-size:10px;
		padding-left:10%;
		color:gray;
	}
	
	#deleteEvent, #updateEvent{
		display:none;
	}
	
	.color1{color:#D25565;}
	.color2{color:#9775fa;}
	.color3{color:#ffa94d;}
	.color4{color:#74c0fc;}
	.color5{color:#f06595;}
	.color6{color:#63e6be;}
	.color7{color:#a9e34b;}
	.color8{color:#4d638c;}
	.color9{color:#495057;}
	
</style>
</head>
<body>
	<div id="diarySide"><jsp:include page="../../common/myPageSide.jsp" /></div>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<div id="diarySendback"><jsp:include page="../../common/sendBack.jsp" /></div>
	
	<div id="body">	
		    <div id="schedulemain">
		    <br>
		    <p id="diaryOwner">[${ loginMember.memNick }] 님의 다이어리</p>
		    <div class="container" id="container">
				<br><br><br>
		        <div id="calendar"></div>
		        
		        <div class="modal fade" id="schInsert" aria-hidden="true" aria-labelledby="exampleModalLabel" data-bs-backdrop="static" tabindex="-1">
			 	   <div class="modal-dialog modal-dialog-centered">
				      <div class="modal-content">
				      
				        <div class="modal-header" id="modal-header1">
				          <h5 class="modal-title"></h5>
				          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				        </div>
				        
				        <div class="modal-body">
				        
				          <p class="modal-title" id="modalTitle1">일정 등록</p>
				          <form action="insertSchedule" method="POST">
				          <input type="hidden" name="memId" value="${ loginMember.memId }">
				          	<table id="schSubmitTable">
					          	<tr>
					          		<td width="30"><p id="schSubmitTableCate">카테고리</p></td>
					          		<td width="80">
					          		<select name="scheduleCate" id="scheduleCate">
					          			<option value="산책">산책</option>
					          			<option value="미용">미용</option>
					          			<option value="여행">여행</option>
					          			<option value="병원">병원</option>
					          		</select>					          		
					          		</td>
					          	<tr>
					          	<tr>
						          	<td><p class="schForm1">시작일</p></td>
						          	<td><input autocomplete="off" type="text" class="dateChoice schForm1In" name="scheduleStart" id="scheduleStart" placeholder="필수입력입니다" required></td>
					          	</tr>
					          	<tr>
					          		<td><p class="schForm1">종료일</p></td>
					          		<td><input autocomplete="off" type="text" class="dateChoice schForm1In" name="scheduleEnd" id="scheduleEnd"></td>
					          	</tr>
					          	<tr>
					          		<td><p class="schForm1">일정내용</p></td>
					          		<td>
					          		<input class="schForm1In" type="text" name="scheduleContent">
					          		</td>
					          	</tr>
					          	<tr>
					          		<td><p class="schForm1">색상</p></td>
					          		<td>
						          		<select name="scheduleColor" id="scheduleColor">
		                                    <option value="#D25565" class="color1">빨간색</option>
		                                    <option value="#9775fa" class="color2">보라색</option>
		                                    <option value="#ffa94d" class="color3">주황색</option>
		                                    <option value="#74c0fc" class="color4">파란색</option>
		                                    <option value="#f06595" class="color5">핑크색</option>
		                                    <option value="#63e6be" class="color6">연두색</option>
		                                    <option value="#a9e34b" class="color7">초록색</option>
		                                    <option value="#4d638c" class="color8">남색</option>
		                                    <option value="#495057" class="color9">검정색</option>
	                                    </select>
                                    </td>
					          	</tr>
				          	</table>
				          	<button type="submit" class="btn btn-primary" id="schSubmit" disabled>등록</button>
				       		</form>
				        </div>
				      
				      </div>
				    </div>
				  </div>
				  
				  <div class="modal fade" id="schUpdate" aria-hidden="true" aria-labelledby="exampleModalLabel" data-bs-backdrop="static" tabindex="-1">
			 	   <div class="modal-dialog modal-dialog-centered">
				      <div class="modal-content">
				      
				        <div class="modal-header" id="modal-header2">
				          <h5 class="modal-title"></h5>
				          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				        </div>
				        
				        <div class="modal-body">
				        
				          <p class="modal-title" id="modalTitle2">일정 확인</p>
				          <form action="updateSchedule" method="post">
				          <input id="hidden" type="hidden" value="${ loginMember.memId }" name="updateId">
				          	<table id="schModifyTable">
					          	<tr>
					          		<td width="30"><p class="schForm2">카테고리</p></td>
					          		<td width="80">
					          		<select name="editCate" id="editCate">
					          			<option value="산책">산책</option>
					          			<option value="미용">미용</option>
					          			<option value="여행">여행</option>
					          			<option value="병원">병원</option>
					          		</select>
					          		</td>
					          	<tr>
					          	<tr>
						          	<td><p class="schForm2">시작일</p></td>
						          	<td>
						          	<input autocomplete="off" type="text" class="dateChoice schForm2In" name="editStart" id="editStart" required>
						          	</td>
					          	</tr>
					          	<tr>
					          		<td><p class="schForm2">종료일</p></td>
					          		<td>
					          		<input autocomplete="off" type="text" class="dateChoice schForm2In" name="editEnd" id="editEnd">
					          		</td>
					          	</tr>
					          	<tr>
					          		<td><p class="schForm2">일정내용</p></td>
					          		<td>
					          		<input class="schForm2In" type="text" name="editContent">
					          		</td>
					          	</tr>
					          	<tr>
					          		<td><p class="schForm2">색상</p></td>
					          		<td>
						          		<select name="editColor" id="editColor">
		                                    <option value="#D25565" class="color1">빨간색</option>
		                                    <option value="#9775fa" class="color2">보라색</option>
		                                    <option value="#ffa94d" class="color3">주황색</option>
		                                    <option value="#74c0fc" class="color4">파란색</option>
		                                    <option value="#f06595" class="color5">핑크색</option>
		                                    <option value="#63e6be" class="color6">연두색</option>
		                                    <option value="#a9e34b" class="color7">초록색</option>
		                                    <option value="#4d638c" class="color8">남색</option>
		                                    <option value="#495057" class="color9">검정색</option>
	                                    </select>
                                    </td>
					          	</tr>
				          	</table>
				          	<br>
				          	<div class="modal-footer modalBtnContainer-modifyEvent">
				          	<button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
				          	<button type="button" class="btn btn-primary" id="updateEvent">저장</button>
				          	</div>
				       		</form>
				        </div>
				      
				      </div>
				    </div>
				  </div>
		          
		    </div>
		  </div>
		  <div class="containerInput">
		  		<button class="btn btn-primary" id="buttonToggle1" data-bs-toggle="modal" data-bs-target="#schInsert">일정추가</button>
		  		<button class="btn btn-primary" id="buttonToggle2" onclick="myCalendar('${loginMember.memId}', '${loginMember.memNick}');">내 달력 보기</button>
		  		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

					<c:if test="${ not empty friendList }">
		  				<p id="viewFriendButton">친구 달력 보기</p>
			  			<div id="viewFriendDiv">
			  			<table id="scheduleFriendList">
			  				<tbody>
			  				<c:forEach items="${ friendList }" var="i">
			  				<tr class="friendListOne">
			  					<td>
			  						<table>
			  							<tr>
			  								<td rowspan="2" id="viewFriendTd">
			  									<input type="hidden" value="${i.memId}">
			  									<input type="hidden" value="${i.memNick}">
			  									<c:choose>
				  									<c:when test="${i.memPath != null}">
				  										<img id="viewFriendImg" src="${i.memPath}" alt="메인사진">
								    				</c:when>
									    			<c:otherwise>
								    					<img id="viewFriendImg" src="https://moyeoyou.kr/assets/common/img/user/default_photo.jpg" alt="메인사진">
									    			</c:otherwise>
								    			</c:choose>
			    							</td>
			  								<td><p id="viewFriendNick">${ i.memNick }</p></td>
			  							</tr>
			  							<tr>
			  								<td>
			  									<c:choose>
				  									<c:when test="${i.memIntro != null}">
				  										<p id="viewFriendIntro">${ i.memIntro }</p>
								    				</c:when>
									    			<c:otherwise>
								    					<p id="viewFriendIntro">&nbsp;</p>
									    			</c:otherwise>
								    			</c:choose>
								    		</td>
			  							</tr>
			  						</table>
			  					</td>
			  				</tr>
			  				
			  				</c:forEach>
			  				</tbody>	  			
			  			</table>
			  			</div>
			  		</c:if>
		  </div>
	</div>
	
	<div id="diaryFooter"><jsp:include page="../../common/footer.jsp" /></div>
	
	<script src="resources/js/fullCalendar/vendor/bootstrap.min.js"></script>
    <script src="resources/js/fullCalendar/vendor/moment.min.js"></script>
    <script src="resources/js/fullCalendar/vendor/fullcalendar.min.js"></script>
    <script src="resources/js/fullCalendar/vendor/ko.js"></script>
    <script src="resources/js/fullCalendar/vendor/select2.min.js"></script>
    <script src="resources/js/fullCalendar/editEvent.js"></script>
    <script src="resources/js/fullCalendar/etcSetting.js"></script>
	
	<script>
	$(function() {
		$(".dateChoice").datepicker({
            dateFormat: 'yy-mm-dd'
        });
		$('.dateChoice').click(function(){
			$('.dateChoice').datepicker();
		});
    });
	</script>
	
	<script>
	let activeInactiveWeekends = true;
	
	function myCalendar(id, nick) {
		if ('${loginMember.memId}' == id) {
		    $('#buttonToggle1').show();
		    $('#buttonToggle2').hide();
		    $('#deleteEvent').show();
		    $('#updateEvent').show();
		} else {
		    $('#buttonToggle1').hide();
		    $('#buttonToggle2').show();
		    $('#deleteEvent').hide();
		    $('#updateEvent').hide();
		}
		
		$('#diaryOwner').text('[' + nick + '] 님의 다이어리')
		
		$('#calendar').fullCalendar('destroy');
		
		$('#calendar').fullCalendar({
		    locale: 'ko',
		    height: 800,
		    timezone: "local", 
		    displayEventTime: false,
		    firstDay: 0,
		    editable: false,
		    defaultDate: moment(),
		    
		    eventLimit: true,
		    eventLimitClick: 'day',
		    views: {
		        month: { eventLimit: 4 }
		    },
		    
		    header: {
		        left: 'today, prevYear, nextYear, viewWeekends',
		        center: 'month, listWeek',
		        right: 'prev, title, next'
	
		    },
		    
		    customButtons: {
		        viewWeekends: {
		            text: '주말',
		            click: function () {
		                activeInactiveWeekends ? activeInactiveWeekends = false : activeInactiveWeekends = true;
		                $('#calendar').fullCalendar('option', {
		                    weekends: activeInactiveWeekends
		                });
		            }
		        }
		    },
		    
		    events: function (start, end, timezone, callback) {
		        $.ajax({
		            type: "get",
		            url: "selectSchedules",
		            data: {
		                memId: id,
		                scheduleStart: moment(start).format('YYYY-MM-DD'),
		                scheduleEnd: moment(end).format('YYYY-MM-DD')
		            },
		            success: function (response) {
		                let events = [];
		                let scheduleEndReal;
	
		                for (var i = 0; i < response.length; i++) {
		                    if (response[i].scheduleStart !== response[i].scheduleEnd) {
		                        scheduleEndReal = moment(response[i].scheduleEnd).add(1, 'days');
		                    } else {
		                        scheduleEndReal = response[i].scheduleEnd
		                    }
	
		                    let event = {
		                    	title : response[i].scheduleCate,
		                    	id : response[i].scheduleNo,
		                        cate: response[i].scheduleCate,
		                        start: response[i].scheduleStart,
		                        end: scheduleEndReal,
		                        content: response[i].scheduleContent,
		                        backgroundColor: response[i].scheduleColor,
		                        textColor: "#ffffff"
		                    };
		                    
		                    events.push(event);
		                }
	
		                callback(events);
		            }
		        });
		    },
		    
		    eventClick: function (event, jsEvent, view) {
		        editEvent(event);
		    },
		    
		    select: function(startDate, endDate) {
		        var events = $('#calendar').fullCalendar('clientEvents');
		        if (events.length >= 5) {
		            alert("일정 등록갯수는 5개로 제한되어 있습니다.")
		            return false;
		        }
		        return true;
		    }
		})
		
	}
	
	$(function() {
		myCalendar('${loginMember.memId}', '${loginMember.memNick}');
	});
	
	$('.friendListOne').on("click", function(){
		myCalendar($(this).find("input").eq(0).val(), $(this).find("input").eq(1).val());
	});
	</script>
	
	<script>
	$('#scheduleStart').on('change', function(){
		const regex = /^(?:19|20)\d{2}-(?:0[1-9]|1[0-2])-(?:0[1-9]|[12]\d|3[01])$/;
		
		if($(this).val() == ''){
			$('#schSubmit').prop("disabled", true);
		} else if (regex.test($('#scheduleStart').val())){
			$('#schSubmit').prop("disabled", false);
		} else {
			alert("날짜형식이 맞지 않습니다.");
			$('#schSubmit').prop("disabled", true);
			$(this).val("");
		}
	})
	
	$('#scheduleEnd').on('change', function(){
		const regex = /^(?:19|20)\d{2}-(?:0[1-9]|1[0-2])-(?:0[1-9]|[12]\d|3[01])$/;
		
		if ($(this).val() != '' && !(regex.test($(this).val()))){
			alert("날짜형식이 맞지 않습니다.");
			$(this).val("");
		}
	})
	
	</script>
</body>
</html>