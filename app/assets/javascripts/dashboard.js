$(document).ready(function() {

    $('.click-all').on('click', function() {
        $('.participating').show();
        $('.organising').show();
    });
    $('.click-organising').on('click', function() {
        $('.participating').hide();
        $('.organising').show();
    });
    $('.click-participating').on('click', function() {
        $('.organising').hide();
        $('.participating').show();
    });
});