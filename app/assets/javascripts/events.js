

$(document).ready(function(){

	$('.add_userinvitee').on('click',function() {

		var template = $('#userinvitee_fields');
		var list_length = $('.userinvitees_list li').length;
		console.log(list_length);
		var new_invitee_template = Mustache.render(template.html(), {index: list_length});
	
		$('.userinvitees_list').append('<li>' + new_invitee_template + '</li>');
	
	});

	$('.userinvitees_list').on('click', '.delete_userinvitee', function() {
		$(this).parent().remove();
	});


});