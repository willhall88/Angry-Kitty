Feature: Confirmation email once payment has been made
  In order to know that my payment has been successful
  As a participant
  I want to receive an email with an receipt

       Scenario: A participant has paid
        Given I have completed payment
        Then they should receive a receipt by email
        And they will be removed from the mailing list
        And the organiser should receive an email notification