Feature: Invitation email
  In order to add friends to an event
  As a organiser
  I want to send an invitation email

  Background: participants are added by the organiser
    Given There is an event
    And the event has a title and a description
    And there is a participant with an email address

  Scenario: sending the initial invitations
    Then an email containing a link will be sent to the participant

  Scenario: an existing user clicks the link and they are not signed in
    Given there is no current user 
    And the invitee is already a user
    When they click the link in the invitation email
    And they will be added to the event
    Then they will be re-directed to the sign in page
    
  Scenario: an existing user clicks the link and they are signed in
    Given the invitee is the current user
    When they click the link in the invitation email
    And they will be added to the event
    Then they will be re-directed to the event

  Scenario: an new user clicks the link
    Given the invitee not a current user
    When they click the link in the invitation email
    Then they will be re-directed to the sign up page

     # Scenario: resending the initial invitation
  #   When I press the invite button for a participant
  #   Then an email will be sent to the participant
  #   And it will contain links to accept or decline the invitation 