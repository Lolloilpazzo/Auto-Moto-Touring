Feature: Login
    I want to login 
    so that i can use the app

Scenario: User Login successfully 
    Given I am registered User
    And I am on the home page
    When I press button "login" in the Navbar
    Then I should be on "sign_in" page
    And I fill my credentials to Login
    When I press button "log in"
    Then I should be on "profile" page
    And I should see "Signed in successfully"

Scenario: Failed login
    And I am on the home page
    When I press button "login" in the navbar 
    Then I should be on "sign_in" 
    When I press button "Log in"
    And I should see "Invalid Email or password"
