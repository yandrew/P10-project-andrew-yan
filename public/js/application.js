$(document).ready(function() {
	$('form.search-form').on('submit', userfeed);



function userfeed (event) {
	event.preventDefault();
	var input = $('#search_username').val();
	$.ajax({
		url: '/',
		type: 'get',
		dataType: 'json',
		data: {username: input},
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


