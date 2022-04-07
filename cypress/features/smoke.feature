Feature: Application Test

  Scenario: Main page, Add form and View table verification
    When I open the Dog Shop application
    Then I should see main page
    And  Add form should have correct layout
    And  View table should have correct layout


  Scenario: Adding a new unique Dog into the Shop
    Given Dog was not previously added into the Shop
    When  I add a new Dog
    Then  Dog is successfully added


  Scenario: Adding a duplicate Dog into the Shop
    Given Dog was previously added into the Shop
    When  I add a duplicate Dog
    Then  Duplicate Error Message is shown


  Scenario: Adding an empty record into the Shop
    Given Fields are empty
    When  I click on Add button
    Then  Error Messages for Breed, Nick, Price, Image fields are shown


  Scenario: Editing a Dog in the Shop
    Given Dog exists in the Shop
    When  I click on Edit button
    And   I edit the fields
    And   I click on the Update button
    Then  Edited Dog is successfully saved


  Scenario: Cancelling process of editing a Dog in the Shop
    Given Dog exists in the Shop
    When  I click on Edit button
    And   I edit the fields
    And   I click on the Cancel button
    Then  Edited Dog is not saved


  Scenario: Deleting Dog from the Shop
    Given Dog exists in the Shop
    When  I click on Delete button
    Then  Warning Message appears
    And   I click on OK button
    Then  Dog is successfully deleted


  Scenario: Empty Dog shop
    When There are no Dogs available
    Then No Data text is shown


  Scenario: Verifying fields for invalid data
    When  I populate fields with invalid data
    And   Click on Add button
    Then  I get error messages
    And   New Dog is not added to the Shop


  Scenario: Verifying fields for high/low boundary values
    When  I populate fields with boundary values
      | Breed      | Nick       | Price     | Image     |
      | a          | b          | 0         | w         |
      | aaaaa      | bbbb       | 9999      | wwwww     |
    And  I click on Add button
    Then New Dog is added to the Shop


  Scenario: Trying to add SQL/JavaScript injection
    When  I try to add SQL/JavaScript insert
      | Breed      | Nick       | Price                       | Image     |
      | abc        | def        | 123 ; DROP TABLE dogs       | w         |
      | aaaaa      | bbbb       | <script>alert(123)</script> | wwwww     |
    And   I click on Add button
    Then  The Injection is saved as text


  Scenario: Trying to add too big/small image
    When  I try to add too big/small image
    And   Click on Add button
    Then  I get error message
    And   New Dog is not added to the Shop


  Scenario: Cross browser testing
    When I open the Dog Shop application in Chrome/Safari/Firefox/Edge
    Then I should see main page
    And  Add form should have correct layout
    And  View table should have correct layout




