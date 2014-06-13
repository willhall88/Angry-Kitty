Feature: Creating an event
	In order to create and customize an event
	As a user
	I want to have many options

	Background: 
		Given I am signed in and on the dashboard

		@javascript
	Scenario: Event creation with 1 invitee only
		When I click New Event
		And I fill in the event details 
		And I fill in the first invitees name, mobile and email details
		And I click Create Event
		Then I expect to see the dashboard contain the new event with its title and description
		And I expect an invitee with a name, number, email to be created


		@javascript
	Scenario: Event creation with two invitees
		When I click New Event
		And I fill in the event details 
		And I fill in the first invitees name, mobile and email details
		And I click on Add Friend
		And I fill in the second invitees name, mobile and email details
		And I click Create Event
		Then I expect to see the dashboard contain the new event with its title and description
		And I expect an invitee with a name, number, email to be created

		@javascript
	Scenario: Event creation with one invitee and an empty line
		When I click New Event
		And I fill in the event details 
		And I fill in the first invitees name, mobile and email details
		And I click on Add Friend
		And I do not fill in the second invitees name, mobile and email details
		And I click Create Event
		Then I expect to see the dashboard contain the new event with its title and description
		And I expect an invitee with a name, number, email to be created