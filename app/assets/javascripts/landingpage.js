$(document).ready(function() {


  $('.nextlink').click(function(event) {
    event.preventDefault();
      
    $('.text').text("Let me harass them and collect the money for you.");
    $(".progress-circles:nth-child(2)").addClass("purple");

    $('.nextlink').click(function(event) {
      $('.text').text("From polite weekly reminders to full blown angry hourly harassment… the longer they take, the angrier I get and the harder I chase!");
      $(".progress-circles:nth-child(3)").addClass("purple");

      $('.nextlink').click(function(event) {
        $('.text').text("Your friends will find it super easy to pay you back through a simple and secure payment system and you can easily keep track of who has paid and who hasn't.");
        $(".progress-circles:nth-child(4)").addClass("purple");

        $('.nextlink').click(function(event) {
          $('.text').text("(You can even name and shame them on social media if you like.)");
          $(".progress-circles:nth-child(5)").addClass("purple");

           $('.nextlink').click(function(event) {
             $('.text').text("To set up a kitty, specify how much money you need to collect, the date you need it by, and the contact details of your friends. Leave the nagging to me.");
             $(".progress-circles:nth-child(6)").addClass("purple");

            $('.nextlink').click(function(event) {
              $('.nextlink').remove();
              $('.yeslink').css('visibility', 'visible');
              $('.nolink').css('visibility', 'visible');
              $('.text').text("Liking this so far?");
              $(".progress-circles:nth-child(7)").addClass("purple");

                // added the below event listeners to send GA event info each time yes/no are clicked
                
                $('.yeslink').on('click', function() {
                  ga('send', 'event', 'button', 'click', 'yeslink');
                });

                $('.nolink').on('click', function() {
                  ga('send', 'event', 'button', 'click', 'nolink');
                });

                // end

              $('.yeslink').click(function(event) {
                $('.text').text('Awesome! Register your interest.');
                $('.yeslink').remove();
                $('.nolink').remove();
                $(".progress-circles:nth-child(8)").addClass("purple");
              });

              $('.nolink').click(function(event) {
                $('.text').text('Ok fine.');
                $('.yeslink').remove();
                $('.nolink').remove();
                $(".progress-circles:nth-child(8)").addClass("purple");
              });


            });

          });

        });
      });
    });

   });

});