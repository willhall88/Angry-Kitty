Feature: Payments
  In order to manage payments
  As a user

  Background:
    Given I am on the event page

  Scenario: Viewing who has paid
    And I have five paid users
    And I have three unpaid users
    Then I should see a list of five paid participants
    And I should see a list of three unpaid participants

  Scenario: Setting the payment status as an organiser
    And I am an organiser
    And I see a user who has a status 'Unpaid'
    When I click on 'Paid' button next to that unpaid participant
    And I click on 'Confirm user has paid'
    Then I should see the user has a status 'Paid'

  Scenario: An unpaid participant paying for the event
    And I am a participant
    And I havent paid
    Then I should see the button 'Pay Now'

  Scenario: A paid participant viewing the event
    And I am a participant
    And I have paid
    Then I should not see the button 'Pay Now'

  Scenario: Payment status is automatically confirmed if paid through the app

