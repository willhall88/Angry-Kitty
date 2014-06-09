Feature: Invitation email
  In order to add friends to an event
  As a organiser
  I want to send an invitation email

  Background: participants are added by the organiser
    Given There is an event
    And the event has a title and a description
    And there is a participant with an email address

  Scenario: sending the initial invitations
    When I press the invite button
    Then an email will be sent to all the participants
    And it will contain links to accept or decline the invitation

  Scenario: resending the initial invitation
    When I press the invite button for a participant
    Then an email will be sent to the participant
    And it will contain links to accept or decline the invitation