Feature: Buttons locators and events

  Scenario: Button clicking
    Given the frame "SwingSet2" is a container
    And the toolbar button "#1" is selected
    And the tab "Button Demo" is a container
    When I click the button "One"
    When I click the button "Two"
    When I click the button "Three!"
  
  Scenario Outline: Button clicking with index
    Given the frame "SwingSet2" is a container
    And the toolbar button "#1" is selected
    And the tab "Button Demo" is a container
    When I click the button "#<button>"
    Examples:
      | button |
      | 0 |
      | 1 |
      | 2 |
      | 3 |
      | 4 |
      | 5 |
