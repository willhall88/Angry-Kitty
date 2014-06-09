Feature: Creating a user
	In order to use Angry Kitty
	As a user
	I want to have a user account	

	Background:
		Given I am on the homepage

	Scenario: A user can sign up 
		When I click sign up
		Then I want to see a sign up form
		And be able to submit the form

	Scenario: A user signs in with right credentials
		When I sign in with my credentials
		Then I want to be forwarded to my dashboard

	Scenario: A user signs in with wrong credentials
		When I sign in with wrong credentials
		Then I see 'Wrong credentials'
		And am still on the sign in page

	Scenario: A user can sign out
		And I am signed in
		When I click "Sign Out"
		Then I want to be signed out
		And not see the dashboard anymore
    
	Scenario: Dashboard with all events
		And I am signed in
		Then I want to see all my events on my dashboard
