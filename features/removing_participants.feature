
Feature: removing participants
  In order to remove a participant
  As an organiser
  I want to delete the participant

  @javascript
  Scenario: Deleting a participant
    Given I am an organiser of an event
    And I am logged in
    And I am on the event page
    When I click the remove user button
    Then I should not see the participant

  @javascript
  Scenario: Deleting an invitee
    Given I am an organiser of an event
    And I am logged in
    And I am on the event page
    When I click the remove invitee button
    Then I should not see the invitee