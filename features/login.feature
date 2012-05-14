Feature: Logging into portal
  In order to perform any tasks on a portal
  The user must log into the application
  
  Scenario: User logs in successfully
    When a user "portal-user" logs in with password "password"
    Then the user "portal-user" with password "password" is verified on the server
    And a summary page for user "portal-user" is displayed
    
  Scenario: User fails to log in 
    When a user "missing-user" logs in with password "password"
    Then the user "missing-user" with password "password" is verified on the server
    And the login error is shown
