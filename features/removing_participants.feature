
Feature: removing participants
  In order to remove a participant
  As an organiser
  I want to delete the participant

  Scenario: Deleting a participant
    Given I am an organiser of an event
    And I am logged in
    And I am on the event page
    When I click 'x'
    Then I should not see the participant