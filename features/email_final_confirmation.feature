Feature: Send confirmation Email for when all debts are paid
	In order to celebrate a complete debt collection for an event
	As a user
	I want to be sent a celebratory email

	Scenario: Receiving the confirmation mail
		Given I am an organiser of an event
		When all the debts have been paid
		Then I want to receive an email with the content "Congratulations, all debts have been collected"