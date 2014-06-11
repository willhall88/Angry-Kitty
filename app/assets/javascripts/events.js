

$(document).ready(function(){

	$('.add_userinvitee').on('click',function() {
		var template_id = $('#userinvitee_fields').html();
		$('.userinvitees_list').append('<li>' + template_id + '</li>');
	});

	$('.userinvitees_list').on('click', '.delete_userinvitee', function() {
		$(this).parent().remove();
	});


});