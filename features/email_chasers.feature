Feature: Emailing participants who havent paid
  In order chase a participant for payment
  As an organiser
  I want angry kitty to send emails

    Background: there is an upcoming event
      Given there is an event with a due date and participants
      
      Scenario: A participant has not paid
        Then the participant will receive all emails as per schedule

      Scenario: All participants have paid
        Then a celebratory email is sent to the organiser