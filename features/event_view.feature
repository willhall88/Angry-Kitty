Feature: viewing an event
  In order to see the payment statuses of event participants
  As a user
  I want to see the events page

  Scenario: an organiser viewing the event
    Given I am a user
    And I make an event
    When I am on the event view page 
    Then I see "Awaiting RSVP"
    
  Scenario: an organiser viewing an event with 1 unpaid user
    Given I am a user
    And I make an event
    And the event has 1 participant who has not paid
    When I am on the event page 
    Then I want to see that the participant has not paid

  Scenario: an organiser viewing an event with 1 paid user and 1 invitee
    Given I am a user
    And I make an event
    And the event has 1 participant who has paid
    When I am on the event page 
    Then I see that the participant has paid
    Then I see "Awaiting RSVP"
    
  @javascript  
  Scenario: an organiser can delete the event
    Given I am a user
    And I make an event
    When I am on the event page
    And I click on "Delete Event"
    Then the event will be deleted

  Scenario: a paid participant can tweet about unpaid people
    Given There is an event with an organiser
    Given I am a paid participant
    And the event has 1 participant who has not paid
    When I am on the event page
    Then I will see the link Not paid and a Twitter button

  Scenario: an organiser can tweet about unpaid people
    Given I am a user
    And I make an event
    And the event has 1 participant who has not paid
    And the event has 1 participant who has paid
    When I am on the event page 
    Then I will see the link Not paid and a Twitter button


