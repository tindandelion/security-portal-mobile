Feature: Logging into portal
  In order to perform any tasks on a portal
  The user must log into the application
  
  Background:
    Given there's a user
      | login    | portal-user |
      | password | password    |
      | company  | Acme, Inc.  |
  
  Scenario: User logs in successfully
    When a user "portal-user" logs in with password "password"
    Then the user "portal-user" with password "password" is verified on the server
    And a summary page for company "Acme, Inc." is displayed
    
  Scenario: User fails to log in 
    When a user "missing-user" logs in with password "password"
    Then the user "missing-user" with password "password" is verified on the server
    And the login error is shown

  @wip
  Scenario: User comes back to application
    Given the user "portal-user" logged in with password "password" before
    When the user reopens the application
    And a summary page for company "Acme, Inc." is displayed
