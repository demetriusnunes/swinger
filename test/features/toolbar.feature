Feature: Toolbar button locators and events

  Scenario Outline: Toolbar button click
    Given the frame "SwingSet" is the container
    When I click the toolbar button "#<button>"
    Then the toolbar button "#<button>" should be selected
  Examples:
    | button |
    | 0 |
    | 1 |
    | 2 |
    | 3 |
    | 4 |
    | 5 |
    | 6 |
    | 7 |
    | 8 |
    | 9 |
    | 10 |
    | 11 |
    | 12 |
    | 13 |
    | 14 |
    | 15 |    
    
  Scenario: Toolbar button click by tooltip
    Given the frame "SwingSet" is the container
    When I click the toolbar button "JList demo"
    Then the toolbar button "JList demo" should be selected