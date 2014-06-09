Feature: Creating an event
	In order to create and customize an event
	As a user
	I want to have many options

	Background: 
		Given I am signed in
		When I create an event

	Scenario: Event title 
		Then I want to set an event title

	Scenario: Setting a brief description
		Then I want to be able to add a brief description

	Scenario: Setting the payment deadline
		Then I want to be able to set a payment deadline

	Scenario: Setting the anger level 
		Then I want to be able to set the anger level

	Scenario: Setting the total payment amount
		Then I want to be able to set a total payment amount
		And I want it to be divided automatically by the participants count

	Scenario: Adding participants to event at creation
		Then I want to be able to add users to the event right away
		And fill in their mobile number
		And fill in their email	

	

	# Scenario: Viewing the anger level as a chart
	# 	Given I am logged in
	# 	When I have created an event
	# 	Then I want to see the anger level as a chart

# NICE TO HAVE
# Feature: A participant can add more details to the app
# Feature: Setting the individual payment amount


    
