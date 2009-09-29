Feature: Tabs locators and events

  Scenario: Tab selection
    Given the frame "SwingSet" is visible
      And the toolbar button "#1" is selected
    When I select the tab "Source Code"
    Then the tab "Source Code" should be selected
  
  Scenario: Tab selection 2
    Given the frame "SwingSet" is visible
      And the toolbar button "#2" is selected
      And the tab "Button Demo" is visible
    When I select the tab "Radio Buttons"
      And I select the tab "Buttons"
      And I select the tab "Check Boxes"