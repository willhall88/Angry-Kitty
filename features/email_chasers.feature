Feature: Emailing participants who havent paid
  In order chase a participant for payment
  As an organiser
  I want angry kitty to send emails

    Background: there is an upcoming event
      Given there is an event with a due date and participants
      And there is a schedule
      
      Scenario: A participant has not paid
        Then the participant will receive all emails as per schedule

      Scenario: A participant has paid
        Then they will be removed from the mailing list

      Scenario: All participants have paid
        Then a celebratory email is sent to the organiser