Feature: Application Smoke Test

  Scenario: Open Application and verify page elements
    When I open application
    Then I should see main page
    And  Breed, Nick, Price, Image fields are present
    And  Add, Edit, Delete buttons are present



    Scenario: Test
      When I open application

