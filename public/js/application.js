$(document).ready(function() {
"use strict";
	$('#user_feed').on('click', userfeed);



function userfeed (event) {
	event.preventDefault();
	var input = $('#search_username').val();
	$.ajax({
		url: '/',
		type: 'get',
		dataType: 'json'
	})
	.done(function() {
		console.log("success");
	})
	.fail(function() {
		console.log("error");
	})
	.always(function() {
		console.log("complete");
	});
	
}




});


function buildMap(lat,longitude) {
    // gets todoTemplate stored in DOM.
    var mapTemplate = $.trim($('#map_template').html());
    // Creates an jQueryDOMElement from the todoTemplate.
    var $map = $(mapTemplate);
    // Modifies it's text to use the passed in todoName.
    var coord = "" + lat + ',' + longitude + "";
    var link = "https://www.google.com/maps/embed/v1/view?key=<%=ENV['API_KEY']%>&center="+coord+"&zoom=18";
    $map.attr('src', link);
  return $map;
}




