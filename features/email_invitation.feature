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
    When the registered user clicks the link in the invitation email
    And the existing user will be added to the event
    Then they will be re-directed to the sign in page
    
  Scenario: an existing user clicks the link and they are signed in
    Given the invitee is the current user
    When the registered user clicks the link in the invitation email
    And the existing user will be added to the event
    Then they will be re-directed to the event

  Scenario: an new user clicks the link
    Given the invitee is not a current user
    When the unregistered user clicks the link in the invitation email
    Then they will be re-directed to the sign in page
    And they press "Sign up"
    Then they can fill in their invitee details on the sign up page
    And they press "Sign up"
    Then the new user will be added to the event
    And they will be re-directed to the event

  Scenario: a new user clicks the link and signs up, then clicks the link again while signed in
    Given the invitee is not a current user
    When the unregistered user clicks the link in the invitation email
    Then they will be re-directed to the sign in page
    And they press "Sign up"
    Then they can fill in their invitee details on the sign up page
    And they press "Sign up"
    Then the new user will be added to the event
    And they will be re-directed to the event
    Given the participant clicks the link in the invitation email
    Then the participant will not be added to the event
    And they will be re-directed to the event


  # Scenario: an existing user receives an invite via a different email address
  #   Given the invitee is a user
  #   And they are not logged in
  #   When the existing 



     # Scenario: resending the initial invitation
  #   When I press the invite button for a participant
  #   Then an email will be sent to the participant
  #   And it will contain links to accept or decline the invitation 