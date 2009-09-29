Feature: Checkbox locators and events

  Background:
    Given the frame "SwingSet" is visible
      And the toolbar button "#2" is selected
      And the tab "Button Demo" is visible
    When I select the tab "Check Boxes"
    Given the tab "Check Boxes" is visible
  
  Scenario Outline: Checkbox clicking with names
    When I click the checkbox "<checkbox>"
    Then the checkbox "<checkbox>" should be selected
    When I click the checkbox "<checkbox>"
    Then the checkbox "<checkbox>" should not be selected
    Examples:
      | checkbox |
      | One |
      | Two |
      | Three |

  Scenario Outline: Checkbox clicking with names
    When I click the checkbox "#<checkbox>"
    Then the checkbox "#<checkbox>" should be selected
    When I click the checkbox "#<checkbox>"
    Then the checkbox "#<checkbox>" should not be selected
    Examples:
      | checkbox |
      | 1 |
      | 2 |
      | 3 |
      | 4 |
      | 5 |
      | 6 |