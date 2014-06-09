Feature: Texting participants who havent paid
  In order chase a participant for payment
  As an organiser
  I want angry kitty to send text

    Background: there is an upcoming event
      Given there is an event with a due date and participants
      And there is a schedule
      
      Scenario: A participant has not paid
        Then the participant will receive all texts as per schedule

      Scenario: A participant has paid
        Then they will be removed from the messaging list