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
	
	#schedulemain p{
		font-size:25px;
		margin-left:4%;
	}
	
	#schedulemain a{
		text-decoration:none;
	}
	
	.containerInput{
		width : 30%;
		float : left;
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
		    <div class="container" style="width:90%;">
				<br><br><br>
		        <div id="calendar"></div>
		        
		        <div class="modal fade" id="schInsert" aria-hidden="true" aria-labelledby="exampleModalLabel" data-bs-backdrop="static" tabindex="-1">
			 	   <div class="modal-dialog modal-dialog-centered">
				      <div class="modal-content">
				      
				        <div class="modal-header" style="height:15px; background-color:lightgray">
				          <h5 class="modal-title"></h5>
				          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				        </div>
				        
				        <div class="modal-body">
				        
				          <p class="modal-title" style="font-size:15px; text-align:center; margin-top:15px; margin-bottom:30px">일정 등록</p>
				          <form action="insertSchedule" method="POST">
				          <input type="hidden" value="${ loginMember.memId }" name="memId">
				          	<table id="schSubmitTable" width="80%" style="text-align:center; margin:auto">
					          	<tr>
					          		<td width="30"><p style="font-size:10px; color:gray; margin-top:12px">카테고리</p></td>
					          		<td width="80">
					          		<select name="scheduleCate" style="width:100%; height:23px;">
					          			<option value="산책">산책</option>
					          			<option value="미용">미용</option>
					          			<option value="여행">여행</option>
					          			<option value="병원">병원</option>
					          		</select>					          		
					          		</td>
					          	<tr>
					          	<tr>
						          	<td><p style="font-size:10px; color:gray; margin-top:12px">시작일</p></td>
						          	<td><input autocomplete="off" type="text" class="dateChoice" name="scheduleStart" id="scheduleStart" style="width:100%;" placeholder="필수입력입니다" required></td>
					          	</tr>
					          	<tr>
					          		<td><p style="font-size:10px; color:gray; margin-top:12px">종료일</p></td>
					          		<td><input autocomplete="off" type="text" class="dateChoice" name="scheduleEnd" id="scheduleEnd" style="width:100%;"></td>
					          	</tr>
					          	<tr>
					          		<td><p style="font-size:10px; color:gray; margin-top:12px">일정내용</p></td>
					          		<td><input type="text" name="scheduleContent" style="width:100%;"></td>
					          	</tr>
					          	<tr>
					          		<td><p style="font-size:10px; color:gray; margin-top:12px">색상</p></td>
					          		<td>
						          		<select name="scheduleColor" id="scheduleColor" style="width:100%; height:23px; color:#D25565">
		                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
		                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
		                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
		                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
		                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
		                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
		                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
		                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
		                                    <option value="#495057" style="color:#495057;">검정색</option>
	                                    </select>
                                    </td>
					          	</tr>
				          	</table>
				          	<button type="submit" id="schSubmit" class="btn btn-primary" style="width:80%; margin:35px 50px" disabled>등록</button>
				       		</form>
				        </div>
				      
				      </div>
				    </div>
				  </div>
				  
				  <div class="modal fade" id="schUpdate" aria-hidden="true" aria-labelledby="exampleModalLabel" data-bs-backdrop="static" tabindex="-1">
			 	   <div class="modal-dialog modal-dialog-centered">
				      <div class="modal-content">
				      
				        <div class="modal-header" style="height:15px; background-color:lightgray">
				          <h5 class="modal-title"></h5>
				          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				        </div>
				        
				        <div class="modal-body">
				        
				          <p class="modal-title" style="font-size:15px; text-align:center; margin-top:15px; margin-bottom:30px">일정 확인</p>
				          <form action="updateSchedule" method="post">
				          <input id="hidden" type="hidden" value="${ loginMember.memId }" name="updateId">
				          	<table width="80%" style="text-align:center; margin:auto">
					          	<tr>
					          		<td width="30"><p style="font-size:10px; color:gray; margin-top:12px">카테고리</p></td>
					          		<td width="80">
					          		<select name="editCate" id="editCate" style="width:100%; height:23px;">
					          			<option value="산책">산책</option>
					          			<option value="미용">미용</option>
					          			<option value="여행">여행</option>
					          			<option value="병원">병원</option>
					          		</select>
					          		</td>
					          	<tr>
					          	<tr>
						          	<td><p style="font-size:10px; color:gray; margin-top:12px">시작일</p></td>
						          	<td>
						          	<input autocomplete="off" type="text" class="dateChoice" name="editStart" id="editStart" style="width:100%" required>
						          	</td>
					          	</tr>
					          	<tr>
					          		<td><p style="font-size:10px; color:gray; margin-top:12px">종료일</p></td>
					          		<td>
					          		<input autocomplete="off" type="text" class="dateChoice" name="editEnd" id="editEnd" style="width:100%;">
					          		</td>
					          	</tr>
					          	<tr>
					          		<td><p style="font-size:10px; color:gray; margin-top:12px">일정내용</p></td>
					          		<td>
					          		<input class="inputModal" type="text" name="editContent" id="editContent" style="width:100%;">
					          		</td>
					          	</tr>
					          	<tr>
					          		<td><p style="font-size:10px; color:gray; margin-top:12px">색상</p></td>
					          		<td>
						          		<select name="editColor" id="editColor" style="width:100%; height:23px;">
		                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
		                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
		                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
		                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
		                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
		                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
		                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
		                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
		                                    <option value="#495057" style="color:#495057;">검정색</option>
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
		    
		    <script src="resources/js/fullCalendar/vendor/bootstrap.min.js"></script>
		    <script src="resources/js/fullCalendar/vendor/moment.min.js"></script>
		    <script src="resources/js/fullCalendar/vendor/fullcalendar.min.js"></script>
		    <script src="resources/js/fullCalendar/vendor/ko.js"></script>
		    <script src="resources/js/fullCalendar/vendor/select2.min.js"></script>
		    <script src="resources/js/fullCalendar/editEvent.js"></script>
		    <script src="resources/js/fullCalendar/etcSetting.js"></script>
		    
		   
		  </div>
		  <div class="containerInput" style="margin-top:60px">
		  		<button class="btn btn-primary" id="buttonToggle1" data-bs-toggle="modal" data-bs-target="#schInsert" style="display:none; width:50%; height:20%; font-size:15px;  margin-left:25%; margin-top:20px">일정추가</button>
		  		<button class="btn btn-primary" id="buttonToggle2" style="display:none; width:50%; height:20%; font-size:15px; margin-left:25%; margin-top:20px;" onclick="myCalendar('${loginMember.memId}', '${loginMember.memNick}');">내 달력 보기</button>
		  		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

					<c:if test="${ not empty friendList }">
		  				<p style="font-size:18px; text-align:center">친구 달력 보기</p>
			  			<div style="width:80%; height:400px; margin:auto; overflow-y: scroll;">
			  			<table id="scheduleFriendList" style="height:0px;">
			  				<tbody>
			  				<c:forEach items="${ friendList }" var="i">
			  				<tr class="friendListOne">
			  					<td>
			  						<table>
			  							<tr>
			  								<td rowspan="2" style="width:20%; height:100%; text-align:center">
			  									<input type="hidden" value="${i.memId}">
			  									<input type="hidden" value="${i.memNick}">
			  									<c:choose>
				  									<c:when test="${i.memPath != null}">
				  										<img id="memberimg" style="width:100%; height:100%; margin:0px" src="${i.memPath}" alt="메인사진">
								    				</c:when>
									    			<c:otherwise>
								    					<img id="memberimg" style="width:100%; height:100%; margin:0px;" src="https://moyeoyou.kr/assets/common/img/user/default_photo.jpg" alt="메인사진">
									    			</c:otherwise>
								    			</c:choose>
			    							</td>
			  								<td><p style="width:100%; margin:0px; font-size:13px; padding-left:10%; padding-bottom:5px">${ i.memNick }</p></td>
			  							</tr>
			  							<tr>
			  								<td>
			  									<c:choose>
				  									<c:when test="${i.memIntro != null}">
				  										<p style="width:100%; margin:0px; font-size:10px; padding-left:10%; color:gray;">${ i.memIntro }</p>
								    				</c:when>
									    			<c:otherwise>
								    					<p style="width:100%; margin:0px; font-size:10px; padding-left:10%; color:gray">&nbsp;</p>
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
		} else {
		    $('#buttonToggle1').hide();
		    $('#buttonToggle2').show();
		}
		
		$('#diaryOwner').text('[' + nick + '] 님의 다이어리')
		
		$('#calendar').fullCalendar('destroy');
		
		$('#calendar').fullCalendar({
		    locale: 'ko',
		    height: 800,
		    timezone: "local", 
		    nextDayThreshold: "09:00:00",
		    displayEventTime: false,
		    displayEventEnd: false,
		    firstDay: 0,
		    selectable: false,
		    editable: false,
		    eventLimit: true,
		    views: {
		        month: { eventLimit: 4 }
		    },
		    eventLimitClick: 'week',
		    navLinks: true,
		    defaultDate: moment(),
		    timeFormat: 'HH:mm',
		    weekends: true,
		    nowIndicator: true,
		    dayPopoverFormat: 'MM/DD dddd',
		    longPressDelay: 0,
		    eventLongPressDelay: 0,
		    selectLongPressDelay: 0,
		    
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