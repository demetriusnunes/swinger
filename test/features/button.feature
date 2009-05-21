Feature: Buttons locators and events

  Scenario: Button clicking
    Given the frame "SwingSet" is the container
    And the toolbar button "#2" is selected
    And the tab "Button Demo" is the container
    When I click the button "One"
    When I click the button "Two"
    When I click the button "Three!"
  
  Scenario Outline: Button clicking with index
    Given the frame "SwingSet" is the container
    And the toolbar button "#2" is selected
    And the tab "Button Demo" is the container
    When I click the button "#<button>"
    Examples:
      | button |
      | 1 |
      | 2 |
      | 3 |
      | 4 |
      | 5 |
      | 6 |
