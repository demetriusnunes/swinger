Feature: List

  Scenario: Combobox Manipulation
    Given the frame "SwingSet" is visible
      And the toolbar button "JList demo" is selected
      And the tab "List Demo" is visible
    When I select "TeraSystems" in the list "#1"
      Then I should have the list "#1" with "TeraSystems" selected
    When I select "YoYoTech" in the list "#1"
      Then I should have the list "#1" with "YoYoTech" selected
    When I select "#2" in the list "#1"
      Then I should have the list "#1" with "MetaDynamics" selected
