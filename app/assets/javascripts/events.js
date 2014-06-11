

$(document).ready(function(){
	$('.add_userinvitee').on('click',function() {

		var template_id = $('#userinvitee_fields').html();
		console.log(template_id);
		$('.userinvitees_list').append('<li>' + template_id + '</li>');

	});
});