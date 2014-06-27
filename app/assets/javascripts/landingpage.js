$(document).ready(function() {
  $('.nextlink').click(function(event) {
    event.preventDefault();
      
    $('.text').text("Let me harass them and collect the money for you. The longer they take the angrier I get and the more I chase!");


    $('.nextlink').click(function(event) {
      $('.text').text("You can see who has paid and who hasn't and harass them with me.");


      $('.nextlink').click(function(event) {
        $('.nextlink').remove();
        $('.yeslink').css('visibility', 'visible');
        $('.nolink').css('visibility', 'visible');
        $('.text').text("Angry Kitty loves chasing people for money, would you consider letting Angry Kitty do this for you?");

        $('.yeslink').click(function(event) {
          $('.text').text('Register for the newsletter');
          $('.yeslink').remove();
          $('.nolink').remove();
        });

        $('.nolink').click(function(event) {
          $('.text').text('Thanks for your time');
          $('.yeslink').remove();
          $('.nolink').remove();
        });

      });

    });

   });

});