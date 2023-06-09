<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>

    
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
		width : 85%;
		height : 1000px;
		padding-top : 15px;
		float:left;
	}
	
	#schedulemain p{
		font-size:25px;
		margin-left:60px;
	}
	
	#schedulemain a{
		text-decoration:none;
	}
	
	.containerInput{
		width : 15%;
		float : left;
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
		    <p>[${ loginMember.memNick }] 님의 다이어리</p>
		    <div class="container" style="width:75%;">
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
				          <form action="insertSchedule.me" method="POST">
				          <input type="hidden" value="${ loginMember.memId }" name="memId">
				          	<table width="80%" style="text-align:center; margin:auto">
					          	<tr>
					          		<td width="30"><p style="font-size:10px; color:gray; margin-top:12px">카테고리</p></td>
					          		<td width="80">
					          		<select name="scheduleCate" style="width:100%; height:23px; border:solid 1px lightgray">
					          			<option value="산책">산책</option>
					          			<option value="미용">미용</option>
					          			<option value="여행">여행</option>
					          			<option value="병원">병원</option>
					          		</select>					          		
					          		</td>
					          	<tr>
					          	<tr>
						          	<td><p style="font-size:10px; color:gray; margin-top:12px">시작일</p></td>
						          	<td><input autocomplete="off" type="text" class="dateChoice" name="scheduleStart" style="width:100%; border:solid 1px lightgray"></td>
					          	</tr>
					          	<tr>
					          		<td><p style="font-size:10px; color:gray; margin-top:12px">종료일</p></td>
					          		<td><input autocomplete="off" type="text" class="dateChoice" name="scheduleEnd" style="width:100%; border:solid 1px lightgray"></td>
					          	</tr>
					          	<tr>
					          		<td><p style="font-size:10px; color:gray; margin-top:12px">일정내용</p></td>
					          		<td><input type="text" name="scheduleContent" style="width:100%; border:solid 1px lightgray"></td>
					          	</tr>
					          	<tr>
					          		<td><p style="font-size:10px; color:gray; margin-top:12px">색상</p></td>
					          		<td>
						          		<select name="scheduleColor" style="width:100%; height:23px; border:solid 1px lightgray">
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
				          	<button type="submit" class="btn btn-primary" style="width:80%; margin:35px 50px">등록</button>
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
				          <form action="updateSchedule.me" method="POST">
				          <input id="hidden" type="hidden" value="${ loginMember.memId }" name="updateId">
				          	<table width="80%" style="text-align:center; margin:auto">
					          	<tr>
					          		<td width="30"><p style="font-size:10px; color:gray; margin-top:12px">카테고리</p></td>
					          		<td width="80">
					          		<select name="editCate" id="editCate" style="width:100%; height:23px; border:solid 1px lightgray">
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
						          	<input autocomplete="off" type="text" class="dateChoice" name="editStart" id="editStart" style="width:100%; border:solid 1px lightgray">
						          	</td>
					          	</tr>
					          	<tr>
					          		<td><p style="font-size:10px; color:gray; margin-top:12px">종료일</p></td>
					          		<td>
					          		<input autocomplete="off" type="text" class="dateChoice" name="editEnd" id="editEnd" style="width:100%; border:solid 1px lightgray">
					          		</td>
					          	</tr>
					          	<tr>
					          		<td><p style="font-size:10px; color:gray; margin-top:12px">일정내용</p></td>
					          		<td>
					          		<input class="inputModal" type="text" name="editContent" id="editContent" style="width:100%; border:solid 1px lightgray">
					          		</td>
					          	</tr>
					          	<tr>
					          		<td><p style="font-size:10px; color:gray; margin-top:12px">색상</p></td>
					          		<td>
						          		<select name="editColor" id="editColor" style="width:100%; height:23px; border:solid 1px lightgray">
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
		    
		   
		    
		    <!-- /.container -->
		    <script src="resources/js/fullCalendar/vendor/bootstrap.min.js"></script>
		    <script src="resources/js/fullCalendar/vendor/moment.min.js"></script>
		    <script src="resources/js/fullCalendar/vendor/fullcalendar.min.js"></script>
		    <script src="resources/js/fullCalendar/vendor/ko.js"></script>
		    <script src="resources/js/fullCalendar/vendor/select2.min.js"></script>
		    <!-- <script src="resources/js/fullCalendar/main.js"></script>  -->
		    <script src="resources/js/fullCalendar/editEvent.js"></script>
		    <script src="resources/js/fullCalendar/etcSetting.js"></script>
		    
		   
		  </div>
		  <div class="containerInput" style="margin-top:60px"><button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#schInsert" style="width:70%; height:20%; font-size:15px; margin-top:90px">일정추가</button></div>
	</div>
	
	<div id="diaryFooter"><jsp:include page="../../common/footer.jsp" /></div>
	
	<script>
	
	var draggedEventIsAllDay;
	var activeInactiveWeekends = true;
		
	$('#calendar').fullCalendar({
	    locale: 'ko',
	    height: 800,
	    nextDayThreshold: "09:00:00",
	    displayEventTime: false,
	    displayEventEnd: false,
	    firstDay: 0,
	    selectable: true,
	    eventLimit: true,
	    views: {
	        month: { eventLimit: 4 }
	    },
	    eventLimitClick: 'week',
	    navLinks: true,
	    defaultDate: moment(),
	    timeFormat: 'HH:mm',
	    editable: true,
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
	    
	    events: function (start, end, callback) {
	        $.ajax({
	            type: "get",
	            url: "selectSchedules.me",
	            data: {
	                memId: '${loginMember.memId}',
	                scheduleStart: moment(start).format('YYYY-MM-DD'),
	                scheduleEnd: moment(end).format('YYYY-MM-DD')
	            },
	            success: function (response) {
	                var events = [];
	                var scheduleEndReal;

	                for (var i = 0; i < response.length; i++) {
	                    if (response[i].scheduleStart !== response[i].scheduleEnd) {
	                        scheduleEndReal = moment(response[i].scheduleEnd).add(1, 'days');
	                    } else {
	                        scheduleEndReal = response[i].scheduleEnd
	                    }

	                    var event = {
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
	            },
	            error: function (error) {
	            }
	        });
	    },
	    
	    eventClick: function (event, jsEvent, view) {
	        editEvent(event);
	    }
	})
	
	</script>
	
	
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
</body>
</html>