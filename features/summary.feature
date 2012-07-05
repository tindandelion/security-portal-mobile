Feature: Protection summary
  In order to monitor the health state of my environment
  As a company user
  I want to see the summary of my environment
  
  Background: 
  Given there's a company
    | company  | Acme, Inc.  |
    | login    | portal-user |
    | password | password    |
  
  Scenario: Showing the summary
    Given the environment summary for company "Acme, Inc." is
      | critical  | 10 |
      | warning   | 5  |
      | protected | 7  |
    When a user "portal-user" logs in
    Then the summary page should display
      | critical  | 10 |
      | warning   | 5  |
      | protected | 7  |
    
