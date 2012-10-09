Feature: Signup
	As a tapas lover
	I want to to sign up
	So that I can share my tapas reviews with my friends
	
	Scenario: Signup using facebook
		Given I am on the home page
		And I sign in with facebook
		Then I should be signed up and logged in