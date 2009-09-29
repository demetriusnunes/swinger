Feature: Radio Buttons locators and events

  Background:
    Given the frame "SwingSet" is visible
      And the toolbar button "#2" is selected
      And the tab "Button Demo" is visible
    When I select the tab "Radio Buttons"
    Given the tab "Radio Buttons" is visible
  
  Scenario Outline: Radio Button clicking with names
    When I click the radio button "<button1>"
    Then the radio button "<button1>" should be selected
      And the radio button "<button2>" should not be selected
      And the radio button "<button3>" should not be selected
    Examples:
      | button1     | button2   | button3     |
      | Radio One   | Radio Two | Radio Three |
      | Radio Two   | Radio One | Radio Three | 
      | Radio Three | Radio One | Radio Two   |

  Scenario Outline: Radio Button clicking with index
    When I click the radio button "#<button>"
    Then the radio button "#<button>" should be selected
    Examples:
      | button |
      | 1 |
      | 2 |
      | 3 |
      | 4 |
      | 5 |
      | 6 |