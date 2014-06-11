Feature: Creating an event
	In order to create and customize an event
	As a user
	I want to have many options

	Background: 
		Given I am signed in
		When I create an event

		@javascript
	Scenario: Event creation with 1 invitee only
		When I want to set an event title
		And I want to be able to add a description
		And I want to be able to set a payment deadline
		And I want to be able to set the anger level
		And I want to be able to set a total payment amount
		And I fill in the invitees name
		And I fill in the invitees mobile number
		And I fill in the invitees email
		And I click on submit
		Then I expect to see the dashboard contain the new event with its title and description
		And I expect an invitee with a name, number, email to be created

		@javascript
	Scenario: Event creation with two invitees
		When I want to set an event title
		And I want to be able to add a description
		And I want to be able to set a payment deadline
		And I want to be able to set the anger level
		And I want to be able to set a total payment amount
		And I fill in the invitees name
		And I fill in the invitees mobile number
		And I fill in the invitees email
		And I click on Add Friend
		And I fill in the second the invitees name
		And I fill in the second invitees mobile number
		And I fill in the second invitees email
		And I click on submit
		Then I expect to see the dashboard contain the new event with its title and description
		And I expect two invitees with their names, numbers, and emails to be created


	

	# # Scenario: Viewing the anger level as a chart
	# 	Given I am logged in
	# 	When I have created an event
	# 	Then I want to see the anger level as a chart

# NICE TO HAVE
# Feature: A participant can add more details to the app
# Feature: Setting the individual payment amount


    
