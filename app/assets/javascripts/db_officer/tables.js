// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('click', 'form .remove_fields', function(event) {
  $(this).prev('input[type=hidden]').val('1');
  $(this).closest('fieldset').hide();
  return event.preventDefault();
});

$(document).on('click', 'form .add_fields', function(event) {
  var regexp, time;
  time = new Date().getTime();
  //regexp = new RegExp('\\]\\[', 'g');
  //$(this).before($(this).data('fields').replace(regexp,'][' + time + ']['));
  regexp = new RegExp($(this).data('id'), 'g');
  $(this).before($(this).data('fields').replace(regexp, time));
  return event.preventDefault();
});

$(document).ready(function () {

  var adjustLeftHeight= function(){
    var windowHeight = $(window).height();
    var headerHeight = $(".header").outerHeight();
    var colLeft = windowHeight - headerHeight;
    $(".col-left").css("min-height", colLeft);
    $(".main").css("min-height", colLeft);
  }

  adjustLeftHeight();
  $(window).resize(function(){
    adjustLeftHeight();
  });

});


