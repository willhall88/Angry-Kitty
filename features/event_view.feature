Feature: viewing an event
  In order to see the payment statuses of event participants
  As a user
  I want to see the events page

  Background:
    Given I am a user
    And I make an event

  Scenario: an organiser viewing the event
    When I am on the event view page 
    Then I see "not accepted"
    
  Scenario: an organiser viewing an event with 1 unpaid user
    And the event has 1 participant who has not paid
    When I am on the event page 
    Then I want to see that the participant has not paid

  Scenario: an organiser viewing an event with 1 paid user and 1 invitee
    And the event has 1 participant who has paid
    When I am on the event page 
    Then I see that the participant has paid
    Then I see "not accepted"
