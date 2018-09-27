@checkboxes
Feature: Checkbox Page

  Scenario: Checkboxes
    Given I visit the checkbox page
    When I tick the first checkbox
    Then the first checkbox is ticked
