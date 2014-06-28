$(document).ready(function() {
  $('.nextlink').click(function(event) {
    event.preventDefault();
      
    $('.text').text("Let me harass them and collect the money for you. From polite weekly reminders to full blown angry hourly harassment… the longer they take, the angrier I get and the harder I chase!");


    $('.nextlink').click(function(event) {
      $('.text').text("Your friends will find it super easy to pay you back through my simple and secure payment system and you can easily keep track of who has paid and who hasn't (you can even name and shame them on social media if you like).");

       $('.nextlink').click(function(event) {
         $('.text').text("To set up a kitty, specify how much money you need to collect, the date you need it by, and the contact details of your friends. Leave the nagging to me.");

        $('.nextlink').click(function(event) {
          $('.nextlink').remove();
          $('.yeslink').css('visibility', 'visible');
          $('.nolink').css('visibility', 'visible');
          $('.text').text("Liking this so far?");

          $('.yeslink').click(function(event) {
            $('.text').text('Awesome! Register your interest.');
            $('.yeslink').remove();
            $('.nolink').remove();
          });

          $('.nolink').click(function(event) {
            $('.text').text('Ok fine.');
            $('.yeslink').remove();
            $('.nolink').remove();
          });

        });

      });
    });

   });

});