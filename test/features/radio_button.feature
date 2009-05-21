Feature: Radio Buttons locators and events

  Background:
    Given the frame "SwingSet" is the container
      And the toolbar button "#1" is selected
      And the tab "Button Demo" is the container
    When I select the tab "Radio Buttons"
    Given the tab "Radio Buttons" is the container
  
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
      | 0 |
      | 1 |
      | 2 |
      | 3 |
      | 4 |
      | 5 |