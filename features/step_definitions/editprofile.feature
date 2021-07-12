Feature: Edit profile

        As a user
        I want to see 
        I want to do....


    Scenario: Home
        Given I am authenicated
        Given I am on the home page
        #Then I should see the tours list
        Then I should see "logged in as:"


    Scenario: Navbar
        Given I am authenicated
        Given I am on home page
        Then I want to have the Sign out button   
        Then I want to go to the "edit profile page"

    Scenario: Create new tour
        Given I am authenticated
        Given I am on My Tours page
        Then I should see "my tours"
        Then I should have "add tour" button

    Scenario: Show Tour
        Given I am authenticated
        Given I am on Show Tour page
        Then I should see partenza      
        Then I should see destinazione

    Scenario: Join Tour
        Given I am authenticated
        Given I am on Show tour page
        Then I want to have join tour button


    Scenario: Leave tour
        Given I am authenticated
        Given I am on Show tour page
        Given I have joined a tour
        Then I want to have leave tour button

    Scenario: Sign out
        Given I am authenticated
        Then I want to sign out



