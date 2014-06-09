Feature: Participant
	In order to oversee events
	As a participant
	I want to be able to see my events 

	Scenario: See participants
		Given I am signed in
		And I click on the event
		Then I want to be able to see a list of all participants
		And I want to see every payment status

	Scenario: Confirm participation if user registered
		Given I have received an invite
		And I have clicked on the confirmation link in my email	
		And I am signed in
		Then I want to be forwarded to my dashboard

	Scenario: Confirm participation if user NOT registered
		Given I have received an invite 
		And I have clicked on the confirmation link in my email
		Then I want to be able to fill in my password
		And have a user account
		And be forwarded to my dashboard
		
	Scenario: Decline participation
		Given I have received an invite
		And I have clicked on the DECLINE link in my email
		Then the user should be deleted from the event
