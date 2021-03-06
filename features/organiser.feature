Feature: Organiser
	In order to oversee events
	As an organiser
	I want to be able to edit events

	Background:
		Given I am signed in
		And I have created an event
		And I click on the event

	# Scenario: Can remove participants
	# 	Then I want to be able to remove participants manually
	@javascript
	Scenario: Can edit details of participants
		When I edit a participant
		Then I want to be able to see the changes

	# Scenario: Adding participants to event AFTER creation
	# 	Then I want to be able to add users