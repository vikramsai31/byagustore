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

$(function(){
		$('#maincart').popover({trigger: 'manual' ,
		                       placement: 'bottom',                      
		                        html : true 
		                        }).mouseover(function (e) {
        // when hovering over an element which has a popover, hide
        // them all except the current one being hovered upon
        $('[rel=popover]').not('#' + $(this).attr('id')).popover('hide');
        var $popover = $(this);
        $popover.popover('show');

        // set a flag when you move from button to popover
        // dirty but only way I could think of to prevent
        // closing the popover when you are navigate across
        // the white space between the two
        $popover.data('popover').tip().mouseenter(function () {
            overPopup = true;
        }).mouseleave(function () {
            overPopup = false;
            $popover.popover('hide');
        })}).mouseout(function (e) {
        // on mouse out of button, close the related popover
        // in 200 milliseconds if you're not hovering over the popover
        var $popover = $(this);
        setTimeout(function () {
            if (!overPopup) {
                $popover.popover('hide');
            }
        }, 200);
    });;  
	});
	
	

