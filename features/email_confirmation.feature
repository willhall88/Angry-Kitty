Feature: Confirmation email once payment has been made
  In order to know that my payment has been successful
  As a participant
  I want to receive an email with an receipt

    Scenario: Successful payment
      Given I have completed payment
      Then I should receive a receipt by email
      And the organiser should receive an email notification