Feature: Creating an event
	In order to create and customize an event
	As a user
	I want to have many options

	Background: 
		Given I am signed in
		When I create an event

	Scenario: Event creation
		When I want to set an event title
		And I want to be able to add a brief description
		And I want to be able to set a payment deadline
		And I want to be able to set the anger level
		And I fill in their name
		And I fill in their mobile number
		And I fill in their email
		And I click on submit
		And I want to be able to set a total payment amount
		And I want it to be divided automatically by the participants count
		Then I expect an invitee with a name, number, email to be created
		And I expect an event with a title, description, payment amount per person and an anger level


	

	# Scenario: Viewing the anger level as a chart
	# 	Given I am logged in
	# 	When I have created an event
	# 	Then I want to see the anger level as a chart

# NICE TO HAVE
# Feature: A participant can add more details to the app
# Feature: Setting the individual payment amount


    
