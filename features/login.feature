Feature: Logging into portal
  In order to perform any tasks on a portal
  The user must log into the application
  
  Scenario: User logs in successfully
    When a user "portal-user" logs in with password "password"
    Then a summary page for user "portal-user" is displayed
    And the user "portal-user" with password "password" is verified on the server
    

