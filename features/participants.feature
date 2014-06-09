Feature: Participant
	In order to oversee events
	As a participant
	I want to be able to see my events 

	Scenario: See participants
		Given I am signed in
		And I click on the event
		Then I want to be able to see a list of all participants
		And I want to see every payment status

	Scenario: Confirm participation
		Given I have received an invite 
		And I have clicked on the confirmation link in my email
		Then I want to be able to fill in my password
		And have a user account
		And be forwarded to my dashboard

