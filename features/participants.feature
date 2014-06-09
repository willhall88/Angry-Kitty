Feature: Participant
	In order to oversee events
	As a participant
	I want to be able to see my events 

	Background:
		Given I am signed in
		And I click on the event

	Scenario: See participants
		Then I want to be able to see a list of all participants
		And I want to see every payment status

	Background:

	Scenario: Confirm participation
		Given I have received an invite 
		And I click on the confirmation link
		Then I want to be able to fill in my password
		And have a user account
		And am forwarded to your dashboard

