$(document).ready(function() {
  $('.nextlink').click(function(event) {
    event.preventDefault();
    $('.first-text').remove();
    $('.second-text').css('visibility', 'visible');


    $('.nextlink').click(function(event) {
      $('.second-text').remove();
      $('.third-text').css('visibility', 'visible');

      $('.nextlink').click(function(event) {
        $('.third-text').remove();
        $('.fourth-text').css('visibility', 'visible');

        $('.Yeslink').click(function(event) {
          $('.fourth-text').remove();
          $('.Yestext').css('visibility', 'visible');

        });

          $('.Nolink').click(function(event) {
          $('.fourth-text').remove();
          $('.Yestext').remove();
          $('.Notext').css('visibility', 'visible');

        });

      });

    });

   });

});