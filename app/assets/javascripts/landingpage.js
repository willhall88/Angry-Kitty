$(document).ready(function() {
  $('.nextlink').click(function(event) {
    event.preventDefault();
    $('.first-text').css('visibility', 'hidden');
    $('.second-text').css('visibility', 'visible');


    $('.nextlink').click(function(event) {
      $('.second-text').css('visibility', 'hidden');
      $('.third-text').css('visibility', 'visible');

      $('.nextlink').click(function(event) {
        $('.third-text').css('visibility', 'hidden');
        $('.fourth-text').css('visibility', 'visible');
      });

    });

   });

});