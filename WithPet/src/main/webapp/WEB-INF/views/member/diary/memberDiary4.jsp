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
    <link rel="stylesheet" href='resources/css/fullCalendar/vendor/bootstrap-datetimepicker.min.css' />

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
		font-size:30px;
		text-align:center;
	}
	
	#schedulemain a{
		text-decoration:none;
	}
	
	.containerInput{
		width : 15%;
		float:left;
	}

</style>
</head>
<body>
	<div id="diarySide"><jsp:include page="../../common/myPageSide.jsp" /></div>
	
	<div id="body">	
		    <p>다이어리</p>
		    <div id="schedulemain">
		    <div class="container" style="width:75%;">

		        <div id="wrapper">
		            <div id="loading"></div>
		            <div id="calendar"></div>
		        </div>
		
				<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

				
		        <div class="modal fade" id="schInsert" aria-hidden="true" aria-labelledby="exampleModalLabel" data-bs-backdrop="static" tabindex="-1">
			 	   <div class="modal-dialog modal-dialog-centered">
				      <div class="modal-content">
				      
				        <div class="modal-header" style="height:15px; background-color:lightgray">
				          <h5 class="modal-title"></h5>
				          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				        </div>
				        
				        <div class="modal-body">
				        
				          <p class="modal-title" style="font-size:15px; text-align:center; margin-top:15px; margin-bottom:30px">일정 등록</p>
				          <form action="insertSchedule.me" method="GET">
				          	<table width="100%" style="text-align:center">
					          	<tr>
					          		<td width="80"><p style="font-size:10px; color:gray; margin-top:12px">카테고리</p></td>
					          		<td width="100">
					          		<option name="schCate" style="width:100%; border:solid 1px lightgray">
					          			<select value="병원">병원</select>
					          			<select value="미용">미용</select>
					          			<select value="여행">여행</select>
					          			<select value="산책">산책</select>
					          		</option>					          		
					          		</td>
					          	<tr>
					          	<tr>
						          	<td><p style="font-size:10px; color:gray; margin-top:12px">시작일</p></td>
						          	<td><input type="text" name="schStart" style="width:100%; border:solid 1px lightgray"></td>
					          	</tr>
					          	<tr>
					          		<td><p style="font-size:10px; color:gray; margin-top:12px">종료일</p></td>
					          		<td><input type="text" name="schEnd" style="width:100%; border:solid 1px lightgray"></td>
					          	</tr>
					          	<tr>
					          		<td><p style="font-size:10px; color:gray; margin-top:12px">일정내용</p></td>
					          		<td><input type="text" name="schContent" style="width:100%; border:solid 1px lightgray"></td>
					          	</tr>
					          	<tr>
					          	</tr>
				          	</table>
				          	<button type="submit" class="btn btn-primary" style="width:80%; margin:35px 50px">등록</button>
				       		</form>
				       		
				          	<img src="https://i.postimg.cc/B6cfdvKx/kakao-Login-Button.png" id="kakaoLoginButton" onclick="kakaoLogin()" style="display:block; margin:auto; height:40%; width:50%;">
				          	<div style="height:10px"></div>
							<img src="https://i.postimg.cc/VLNPVmLC/naver-Login-Button.png" id="naverLoginButton" onclick="naverLogin()" style="display:block; margin:auto; height:40%; width:50%;">
							
				        </div>
				        
				        <div class="modal-footer">
				        <div style="margin:auto">
				          <button type="button" class="btn btn-secondary" data-bs-target="#joinModal" data-bs-toggle="modal" id="insertMember">회원가입</button>
				          <button type="button" class="btn btn-secondary" data-bs-target="#idFind" data-bs-toggle="modal">아이디 찾기</button>
				          <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#pwdFind">비밀번호 찾기</button>
				        </div>
				        </div>
				      
				      </div>
				    </div>
				  </div>
		          
		    </div>
		    <!-- /.container -->
		    <script src="resources/js/fullCalendar/vendor/jquery.min.js"></script>
		    <script src="resources/js/fullCalendar/vendor/bootstrap.min.js"></script>
		    <script src="resources/js/fullCalendar/vendor/moment.min.js"></script>
		    <script src="resources/js/fullCalendar/vendor/fullcalendar.min.js"></script>
		    <script src="resources/js/fullCalendar/vendor/ko.js"></script>
		    <script src="resources/js/fullCalendar/vendor/select2.min.js"></script>
		    <script src="resources/js/fullCalendar/vendor/bootstrap-datetimepicker.min.js"></script>
		    <!-- <script src="resources/js/fullCalendar/mainjs.js"></script>  -->
		    <script src="resources/js/fullCalendar/addEvent.js"></script>
		    <script src="resources/js/fullCalendar/editEvent.js"></script>
		    <script src="resources/js/fullCalendar/etcSetting.js"></script>
				    
		  </div>
		  
		  <div class="containerInput "><button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#schInsert">일정추가</button></div>
	</div>	
	
	<div id="diaryFooter"><jsp:include page="../../common/footer.jsp" /></div>
	
	<!-- mainjs 내용 -->
	<script>
	var draggedEventIsAllDay;
	var activeInactiveWeekends = true;
	var calendar = $('#calendar').fullCalendar({

	 /** ******************
	   *  OPTIONS
	   * *******************/
	  locale                    : 'ko', 
	  height					: 800,
	  timezone                  : "local", 
	  nextDayThreshold          : "09:00:00",
	  allDaySlot                : true,
	  displayEventTime          : true,
	  displayEventEnd           : true,
	  firstDay                  : 0, //월요일이 먼저 오게 하려면 1
	  weekNumbers               : false,
	  selectable                : true,
	  weekNumberCalculation     : "ISO",
	  eventLimit                : true,
	  views                     : { 
	                                month : { eventLimit : 4 } // 한 날짜에 최대 이벤트 12개, 나머지는 + 처리됨
	                              },
	  eventLimitClick           : 'week', //popover
	  navLinks                  : true,
	  defaultDate               : moment(), //실제 사용시 현재 날짜로 수정
	  timeFormat                : 'HH:mm',
	  defaultTimedEventDuration : '01:00:00',
	  editable                  : true,
	  minTime                   : '00:00:00',
	  maxTime                   : '24:00:00',
	  slotLabelFormat           : 'HH:mm',
	  weekends                  : true,
	  nowIndicator              : true,
	  dayPopoverFormat          : 'MM/DD dddd',
	  longPressDelay            : 0,
	  eventLongPressDelay       : 0,
	  selectLongPressDelay      : 0,  
	  header                    : {
	                                left   : 'today, prevYear, nextYear, viewWeekends',
	                                center : 'month, listWeek',
	                                right  : 'prev, title, next'
	                                
	                              },
	  views                     : {
	                                month : {
	                                  columnFormat : 'dddd'
	                                },
	                                agendaWeek : {
	                                  columnFormat : 'M/D ddd',
	                                  titleFormat  : 'YYYY년 M월 D일',
	                                  eventLimit   : false
	                                },
	                                agendaDay : {
	                                  columnFormat : 'dddd',
	                                  eventLimit   : false
	                                },
	                                listWeek : {
	                                  columnFormat : ''
	                                }
	                              },
	  customButtons             : { //주말 숨기기 & 보이기 버튼
	                                viewWeekends : {
	                                  text  : '주말',
	                                  click : function () {
	                                    activeInactiveWeekends ? activeInactiveWeekends = false : activeInactiveWeekends = true;
	                                    $('#calendar').fullCalendar('option', { 
	                                      weekends: activeInactiveWeekends
	                                    });
	                                  }
	                                }
	                               },


	  eventRender: function (event, element, view) {

	    //일정에 hover시 요약
	    element.popover({
	      title: $('<div />', {
	        class: 'popoverTitleCalendar',
	        text: event.title
	      }).css({
	        'background': event.backgroundColor,
	        'color': event.textColor
	      }),
	      content: $('<div />', {
	          class: 'popoverInfoCalendar'
	        }).append('<p><strong>등록자:</strong> ' + event.username + '</p>')
	        .append('<p><strong>구분:</strong> ' + event.type + '</p>')
	        .append('<p><strong>시간:</strong> ' + getDisplayEventDate(event) + '</p>')
	        .append('<div class="popoverDescCalendar"><strong>설명:</strong> ' + event.description + '</div>'),
	      delay: {
	        show: "800",
	        hide: "50"
	      },
	      trigger: 'hover',
	      placement: 'top',
	      html: true,
	      container: 'body'
	    });

	    return filtering(event);
		
	  },

	 /* ****************
	   *  일정 받아옴 
	   * ************** */
	  events: function (start, end, timezone, callback) {
	    $.ajax({
	      type: "get",
	      url: "data.json",
	      data: {
	        // 화면이 바뀌면 Date 객체인 start, end 가 들어옴
	        //startDate : moment(start).format('YYYY-MM-DD'),
	        //endDate   : moment(end).format('YYYY-MM-DD')
	      },
	      success: function (response) {
	    	  console.log(response);
	        var fixedDate = response.map(function (array) {
	          if (array.allDay && array.start !== array.end) {
	            array.end = moment(array.end).add(1, 'days'); // 이틀 이상 AllDay 일정인 경우 달력에 표기시 하루를 더해야 정상출력
	          }
	          return array;
	        });
	        callback(fixedDate);
	      }
	    });
	  },

	  eventAfterAllRender: function (view) {
	    if (view.name == "month") $(".fc-content").css('height', 'auto');
	  },

	  //일정 리사이즈
	  eventResize: function (event, delta, revertFunc, jsEvent, ui, view) {
	    $('.popover.fade.top').remove();

	    /** 리사이즈시 수정된 날짜반영
	     * 하루를 빼야 정상적으로 반영됨. */
	    var newDates = calDateWhenResize(event);

	    //리사이즈한 일정 업데이트
	    $.ajax({
	      type: "get",
	      url: "",
	      data: {
	        //id: event._id,
	        //....
	      },
	      success: function (response) {
	        alert('수정: ' + newDates.startDate + ' ~ ' + newDates.endDate);
	      }
	    });

	  },

	  eventDragStart: function (event, jsEvent, ui, view) {
	    draggedEventIsAllDay = event.allDay;
	  },

	  //일정 드래그앤드롭
	  eventDrop: function (event, delta, revertFunc, jsEvent, ui, view) {
	    $('.popover.fade.top').remove();

	    //주,일 view일때 종일 <-> 시간 변경불가
	    if (view.type === 'agendaWeek' || view.type === 'agendaDay') {
	      if (draggedEventIsAllDay !== event.allDay) {
	        alert('드래그앤드롭으로 종일<->시간 변경은 불가합니다.');
	        location.reload();
	        return false;
	      }
	    }

	    // 드랍시 수정된 날짜반영
	    var newDates = calDateWhenDragnDrop(event);

	    //드롭한 일정 업데이트
	    $.ajax({
	      type: "get",
	      url: "",
	      data: {
	        //...
	      },
	      success: function (response) {
	        alert('수정: ' + newDates.startDate + ' ~ ' + newDates.endDate);
	      }
	    });

	  },

	  select: function (startDate, endDate, jsEvent, view) {

	    $(".fc-body").unbind('click');
	    $(".fc-body").on('click', 'td', function (e) {

	      $("#contextMenu")
	        .addClass("contextOpened")
	        .css({
	          display: "block",
	          left: e.pageX,
	          top: e.pageY
	        });
	      return false;
	    });

	    var today = moment();

	    if (view.name == "month") {
	      startDate.set({
	        hours: today.hours(),
	        minute: today.minutes()
	      });
	      startDate = moment(startDate).format('YYYY-MM-DD HH:mm');
	      endDate = moment(endDate).subtract(1, 'days');

	      endDate.set({
	        hours: today.hours() + 1,
	        minute: today.minutes()
	      });
	      endDate = moment(endDate).format('YYYY-MM-DD HH:mm');
	    } else {
	      startDate = moment(startDate).format('YYYY-MM-DD HH:mm');
	      endDate = moment(endDate).format('YYYY-MM-DD HH:mm');
	    }

	    //날짜 클릭시 카테고리 선택메뉴
	    var $contextMenu = $("#contextMenu");
	    $contextMenu.on("click", "a", function (e) {
	      e.preventDefault();

	      //닫기 버튼이 아닐때
	      if ($(this).data().role !== 'close') {
	        newEvent(startDate, endDate, $(this).html());
	      }

	      $contextMenu.removeClass("contextOpened");
	      $contextMenu.hide();
	    });

	    $('body').on('click', function () {
	      $contextMenu.removeClass("contextOpened");
	      $contextMenu.hide();
	    });

	  },

	  //이벤트 클릭시 수정이벤트
	  eventClick: function (event, jsEvent, view) {
	    editEvent(event);
	  }

	});

	function getDisplayEventDate(event) {

	  var displayEventDate;

	  if (event.allDay == false) {
	    var startTimeEventInfo = moment(event.start).format('HH:mm');
	    var endTimeEventInfo = moment(event.end).format('HH:mm');
	    displayEventDate = startTimeEventInfo + " - " + endTimeEventInfo;
	  } else {
	    displayEventDate = "하루종일";
	  }

	  return displayEventDate;
	}

	function filtering(event) {
	  var show_username = true;
	  var show_type = true;

	  var username = $('input:checkbox.filter:checked').map(function () {
	    return $(this).val();
	  }).get();
	  var types = $('#type_filter').val();

	  show_username = username.indexOf(event.username) >= 0;

	  if (types && types.length > 0) {
	    if (types[0] == "all") {
	      show_type = true;
	    } else {
	      show_type = types.indexOf(event.type) >= 0;
	    }
	  }

	  return show_username && show_type;
	}

	function calDateWhenResize(event) {

	  var newDates = {
	    startDate: '',
	    endDate: ''
	  };

	  if (event.allDay) {
	    newDates.startDate = moment(event.start._d).format('YYYY-MM-DD');
	    newDates.endDate = moment(event.end._d).subtract(1, 'days').format('YYYY-MM-DD');
	  } else {
	    newDates.startDate = moment(event.start._d).format('YYYY-MM-DD HH:mm');
	    newDates.endDate = moment(event.end._d).format('YYYY-MM-DD HH:mm');
	  }

	  return newDates;
	}

	function calDateWhenDragnDrop(event) {
	  // 드랍시 수정된 날짜반영
	  var newDates = {
	    startDate: '',
	    endDate: ''
	  }

	  // 날짜 & 시간이 모두 같은 경우
	  if(!event.end) {
	    event.end = event.start;
	  }

	  //하루짜리 all day
	  if (event.allDay && event.end === event.start) {
	    console.log('1111')
	    newDates.startDate = moment(event.start._d).format('YYYY-MM-DD');
	    newDates.endDate = newDates.startDate;
	  }

	  //2일이상 all day
	  else if (event.allDay && event.end !== null) {
	    newDates.startDate = moment(event.start._d).format('YYYY-MM-DD');
	    newDates.endDate = moment(event.end._d).subtract(1, 'days').format('YYYY-MM-DD');
	  }

	  //all day가 아님
	  else if (!event.allDay) {
	    newDates.startDate = moment(event.start._d).format('YYYY-MM-DD HH:mm');
	    newDates.endDate = moment(event.end._d).format('YYYY-MM-DD HH:mm');
	  }

	  return newDates;
	}
	</script>
	<!-- mainjs 내용 -->
</body>
</html>