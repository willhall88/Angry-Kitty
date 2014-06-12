Feature: Payments
  In order to manage payments
  As a user

  Background:
    Given I am signed in

  Scenario: Viewing who has paid
    Given I have one paid user
    And I have one unpaid user
    And I am on the event page
    Then I should see a list of paid and a list of unpaid participants

  # Scenario: Setting the payment status as an organiser
  #   And I am an organiser
  #   And I see a user who has a status 'Unpaid'
  #   When I click on 'Paid' button next to that unpaid participant
  #   And I click on 'Confirm user has paid'
  #   Then I should see the user has a status 'Paid'

  # Scenario: An unpaid participant paying for the event
  #   And I am a participant
  #   And I havent paid
  #   Then I should see the button 'Pay Now'

  # Scenario: A paid participant viewing the event
  #   And I am a participant
  #   And I have paid
  #   Then I should not see the button 'Pay Now'