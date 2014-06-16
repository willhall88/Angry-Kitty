$(document).ready(function() {
    $('.modal').on('click', '.add_userinvitee', function() {

        var template = $('#userinvitee_fields');
        var list_length = $('.userinvitees_list li').length;
        console.log(list_length);
        var new_invitee_template = Mustache.render(template.html(), {
            index: list_length
        });

        $('.userinvitees_list').append('<li>' + new_invitee_template + '</li>');

    });

    $('.modal').on('click', '.delete_userinvitee', function() {
        $(this).parent().remove();
    });

});