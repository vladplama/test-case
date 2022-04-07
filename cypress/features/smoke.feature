Feature: Application Smoke Test

  Scenario: Main page, Add form and View table verification
    When I open the Dog Shop application
    Then I should see main page
    And  Add form should have correct layout
    And  View table should have correct layout


  Scenario: Adding a new unique Dog into the Shop
    Given Dog was not previously added into the Shop
    When  I add a new Dog
      | Fields       | Values      |
      | Breed        |  aaa        |
      | Nick         |  bbb        |
      | Price        |  123        |
      | Image        |  image URL  |
    Then  Dog is successfully added


  Scenario: Adding a duplicate Dog into the Shop
    Given Dog was previously added into the Shop
    When  I add a duplicate Dog
      | Fields       | Values      |
      | Breed        |  aaa        |
      | Nick         |  bbb        |
      | Price        |  123        |
      | Image        |  image URL  |
    Then  Duplicate Error Message is shown


  Scenario: Adding an empty record into the Shop
    Given Fields are empty
    When  I click on Add button
    Then  Error Messages for Breed, Nick, Price, Image are shown


  Scenario: Editing a Dog in the Shop
    Given Dog exists in the Shop
    When  I click on Edit button
    And   I edit the fields
      | Fields       | Values       |
      | Breed        |  ab          |
      | Nick         |  cd          |
      | Price        |  56          |
      | Image        |  image URL 1 |
    And   I click on the Update button
    Then  Edited Dog is successfully saved


  Scenario: Cancelling process of editing a Dog in the Shop
    Given Dog exists in the Shop
    When  I click on Edit button
    And   I edit the fields
      | Fields       | Values       |
      | Breed        |  abc         |
      | Nick         |  cde         |
      | Price        |  567         |
      | Image        |  image URL 2 |
    And   I click on the Cancel button
    Then  Edited Dog is not saved


  Scenario: Deleting Dog from the Shop
    Given Dog exists in the Shop
    When  I click on Delete button
    Then  Warning Message appears
    And   I click on OK button
    Then  Dog is successfully deleted


  Scenario: Verifying fields for invalid data
    When  I populate fields with invalid data
      | Fields       | Values     |
      | Breed        |  123       |
      | Nick         |  @#$       |
      | Price        |  -123      |
      | Image        |  www       |
    And   Click on Add button
    Then  I get error messages
    And   New Dog is not added to the Shop


  Scenario: Verifying fields for high/low boundary values
    When  I populate fields with boundary values
      | Fields       | Values            |
      | Breed        |  long/short Breed |
      | Nick         |  long/short Nick  |
      | Price        |  low/high Price   |
      | Image        |  long/short URl   |
    And  I click on Add button
    Then New Dog is added to the Shop


  Scenario: Verifying fields for high/low negative values
    When  I populate fields with negative boundary values
      | Fields       | Values            |
      | Breed        | negative long/short Breed |
      | Nick         | negative long/short Nick  |
      | Price        | negative low/high Price   |
      | Image        | negative long/short URl   |
    And  I click on Add button
    Then New Dog is not added to the Shop


  Scenario: Trying to add SQL injection
    When  I try to add SQL insert
      | Fields       | Values                 |
      | Breed        |  aaa                   |
      | Nick         |  bbb                   |
      | Price        |  123 ; DROP TABLE dogs |
      | Image        |  image URL             |
    And   I click on Add button
    Then  Error message is shown


  Scenario: Trying to add too big/small image
    When  I try to add too big/small image
      | Fields       | Values      |
      | Breed        |  aaa        |
      | Nick         |  bbb        |
      | Price        |  123        |
      | Image        |  image URL  |
    And   Click on Add button
    Then  I get error message
    And   New Dog is not added to the Shop


  Scenario: Cross browser testing
    When I open the Dog Shop application in Chrome/Safari/Firefox/Edge
    Then I should see main page
    And  Add form should have correct layout
    And  View table should have correct layout


    Scenario: Trying to add JavaScript injection

      When deleting every dog respective message appears

