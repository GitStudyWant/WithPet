var draggedEventIsAllDay;
	var activeInactiveWeekends = true;
	
	$('#calendar').fullCalendar({
	    locale: 'ko',
	    height: 800,
	    timezone: "local",
	    nextDayThreshold: "09:00:00",
	    allDaySlot: true,
	    displayEventTime: true,
	    displayEventEnd: true,
	    firstDay: 0, //월요일이 먼저 오게 하려면 1
	    weekNumbers: false,
	    selectable: true,
	    weekNumberCalculation: "ISO",
	    eventLimit: true,
	    views: {
	        month: { eventLimit: 4 }
	    },
	    eventLimitClick: 'week',
	    navLinks: true,
	    defaultDate: moment(),
	    timeFormat: 'HH:mm',
	    defaultTimedEventDuration: '01:00:00',
	    editable: true,
	    minTime: '00:00:00',
	    maxTime: '24:00:00',
	    slotLabelFormat: 'HH:mm',
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
	    views: {
	        month: {
	            columnFormat: 'dddd'
	        },
	        agendaWeek: {
	            columnFormat: 'M/D ddd',
	            titleFormat: 'YYYY년 M월 D일',
	            eventLimit: false
	        },
	        agendaDay: {
	            columnFormat: 'dddd',
	            eventLimit: false
	        },
	        listWeek: {
	            columnFormat: ''
	        }
	    },
	    customButtons: { //주말 숨기기 & 보이기 버튼
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

	    navLinks: true, // can click day/week names to navigate views
	    editable: true,
	    eventLimit: true, // allow "more" link when too many events
	    events: function (start, end, timezone, callback) {
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
	                        title: response[i].scheduleCate,
	                        start: response[i].scheduleStart,
	                        end: scheduleEndReal,
	                        backgroundColor: response[i].scheduleColor,
	                        textColor: "#ffffff"
	                    };
	                    events.push(event);
	                }
	                console.log(events);

	                callback(events);
	            },
	            error: function (error) {
	            }
	        });
	    }
	})