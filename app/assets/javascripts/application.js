// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

//<![CDATA[
$(document).ready(function() {
  // fades error message
  timer = setTimeout(fadeOutError, 2500);
  $("#error_explanation").hide();
  $("#error_explanation").fadeIn(500);
  
  // fades flash message
  timer = setTimeout(fadeOut, 2500);
  $("#flashMessage").hide();
  $("#flashMessage p").removeClass('hide');
  $("#flashMessage").fadeIn(500);

  $(".clear").click(function() {
    $(this).closest('form').find("input[type=text]").val("");
	});
});

// funcion to fadeout error message
function fadeOutError() {
  $("#error_explanation").fadeOut(500);
}

// funcion to fadeout flash message
function fadeOut() {
  $("#flashMessage").fadeOut(500);
}
//]]>