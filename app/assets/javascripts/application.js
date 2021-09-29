// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper

//= require rails-ujs
//= require activestorage
//= require jquery.min
//= require jquery-ui.min
//= require moment.min
//= require fullcalendar.min
//= require ja
//= require turbolinks
//= require rails-ujs
//= require activestorage

//= require_tree .





//https://the-oreno-michi.com/103/参考に作成

$(function () {


  $('#calendar_test').fullCalendar({
    selectable: true,
    //＃editable: true,
    header: {
      left: 'prev,next today',
      center: 'title',
      right: 'month,agendaWeek,agendaDay'
    },
    events: '/patient/calenders.json',
    color: 'yellow',
    textColor: 'black',
    background_color: 'green',

    select: function(startDate, endDate) {
      $('#new_calender').modal('show');
      $(".input-start").val(moment(startDate).format("YYYY-MM-DD HH:mm"));
      $(".input-end").val(moment(endDate).format("YYYY-MM-DD HH:mm"));
    },

    dayClick : function ( date , jsEvent , view ) {
      $('#new_calender').modal('show');
    },

    eventClick: function(event, jsEvent, view) {
      jsEvent.preventDefault();
      $(`#edit_calender${event.id}`).modal('show');
      //イベント（予定）の削除  idを指定して削除。
      $(`#edit_calendar`).fullCalendar("removeEvents");
      },


     eventMouseover : function(event, jsEvent , view) {
      jsEvent.preventDefault();
    }
 });
});

// ハンバーガメーメニュ

$(function() {
　$('.Toggle').click(function() {
   $(this).toggleClass('active');
  $('.menu').toggleClass('open');
 });
});



    // eventClick: function(event) {
    //     $('#edit_calender').modal('show');
    //     $(".input-start").val(moment(startDate).format("YYYY-MM-DD HH:mm"));
    //     $(".input-end").val(moment(endDate).format("YYYY-MM-DD HH:mm"));
    // },

    // eventClick:function(event){
      //9/12朝とりあえず消した
    //var title = prompt('予定を入力してください、削除する場合は未入力で更新してください:', event.title);
			//if(title && title!=""){
				//event.title = title;
				//$('#calendar_test').fullCalendar('updateEvent', event);//イベント（予定）の修正
			//}else{
				//$('#calendar_test').fullCalendar("removeEvents", event.id); //イベント（予定）の削除
			//}
			 //$('#dialogEditEvent').dialog({
      //modal: true,
      //title: title
    //});
    // クリックされたイベント情報をフォームに設定
    // $('#edit_calender').modal('show');
    // $('#name').val(event.title);
    // $('#start').val(event.start.format('YYYY-MM-DD HH:mm'));
    // $('#end').val(event.end.format('YYYY-MM-DD HH:mm'));

    // FORMのイベント処理
    //$('#editEvent').unbind().submit(function() {
      //var el = $(this),
      //title = el.find('#name').val(),
      //start = el.find('#start').val(),
      //end = el.find('#end').val();

      //if(end == '') {
        //end = start;
    // }

      //if(title != '' ) {
        //event.title = title;
        //event.start = moment(start);
        //event.end = moment(end);

        //operateEvent(state, event);

        //$('#dialogEditEvent').dialog('close');
      //} else {
        //alert('Empty Fields Or Bad Date Format');
      //}

      //return false;
        //});
    $('#notice').click(function(){
      $('#cover, #modal').fadeTo(200,1);
    });
    
    $('#close, #cover').click(function(){
      $('#cover, #modal').fadeTo(200,0).hide();
    });