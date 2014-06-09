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

Feature: Emailing participants who havent paid
  In order chase a participant for payment
  As an organiser
  I want angry kitty to send emails

    Background: there is an upcoming event
      Given there is an event with a due date and participants
      And there is a schedule
      
      Scenario: A participant has not paid
        Then the participant will receive all emails as per schedule

      Scenario: A participant has paid
        Then they will be removed from the mailing list

      Scenario: All participants have paid
        Then a celebratory email is sent to the organiser

Feature: Confirmation email once payment has been made
  In order to know that my payment has been successful
  As a participant
  I want to receive an email with an invoice

    Scenario: Successful payment
      Given I have completed payment
      Then I should receive an invoice by email
