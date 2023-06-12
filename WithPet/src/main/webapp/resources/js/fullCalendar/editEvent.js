var schUpdate = $('#schUpdate');

var editStart = $('#editStart');
var editEnd = $('#editEnd');
var editCate = $('#editCate');
var editContent = $('#editContent');
var editColor = $('#editColor');

var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');



/* ****************
 *  일정 편집
 * ************** */
var editEvent = function (event, element, view) {
	
    $('#hidden').data('id', event.id);

    $('.popover.fade.top').remove();
    $(element).popover("hide");

    if (event.end === null) {
        event.end = event.start;
    }
	
    if (event.end !== event.start) {
        editEnd.val(moment(event.end).subtract(1, 'days').format('YYYY-MM-DD'))
    } else {
        editEnd.val(event.end.format('YYYY-MM-DD'));
    }
    
    editStart.val(event.start.format('YYYY-MM-DD'));
    editCate.val(event.cate);
    editContent.val(event.content);
    editColor.val(event.backgroundColor).css('color', event.backgroundColor);

    modifyBtnContainer.show();
    schUpdate.modal('show');

	$('#updateEvent').unbind();
  	$('#updateEvent').on('click', function () {
  	
        if (editStart.val() > editEnd.val()) {
            alert('종료일이 시작일보다 앞섭니다');
            return false;
        }
        
        var endDay = editEnd.val();
 
		event.title = editCate.val();
		event.cate = editCate.val();
        event.start = editStart.val();
        event.end = moment(endDay).add(1, 'days').format('YYYY-MM-DD');
        event.backgroundColor = editColor.val();
        event.content = editContent.val();

		$("#calendar").fullCalendar('updateEvent', event);
		
        $.ajax({
            type: "get",
            url: "updateSchedule",
            data: {
            	scheduleNo: $('#hidden').data('id'),
            	scheduleCate: event.title,
                scheduleStart: event.start,
                scheduleEnd: endDay,
                scheduleContent : event.content,
                scheduleColor : event.backgroundColor
            },
            success: function (response) {
                alert('수정되었습니다.')
            }
        });
        
        schUpdate.modal('hide');

	});
};

$('#deleteEvent').unbind();
$('#deleteEvent').on('click', function () {
    	
    $("#calendar").fullCalendar('removeEvents', $('#hidden').data('id'));
	
    $.ajax({
        type: "get",
        url: "deleteSchedule",
        data: {
            scheduleNo : $('#hidden').data('id')
        },
        success: function (response) {
            alert('삭제되었습니다.');
        }
    });
    
    schUpdate.modal('hide');

});