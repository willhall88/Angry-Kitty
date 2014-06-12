Feature: Payments
  In order to manage payments
  As a user

  Scenario: Viewing who has paid
    Given I am signed in
    And I have an event
    And I have one paid user
    And I have one unpaid user
    And I am on the event page
    Then I should see a list of paid and a list of unpaid participants

  Scenario: Setting the payment status as an organiser
    Given I am an organiser
    And I have an event
    And I have one unpaid user
    And I am on the event page
    When I click on 'Paid' button next to that unpaid participant
    Then I should see the user has paid

  Scenario: Not being able to set the payment status as a participant
    Given I am a participant
    And I have an event
    And I am the unpaid user
    And I am on the event page
    Then I should not see the 'Paid' button

  # Scenario: An unpaid participant paying for the event
  #   And I am a participant
  #   And I havent paid
  #   Then I should see the button 'Pay Now'

  # Scenario: A paid participant viewing the event
  #   And I am a participant
  #   And I have paid
  #   Then I should not see the button 'Pay Now'