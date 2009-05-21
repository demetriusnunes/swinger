Feature: List

  Scenario: Combobox Manipulation
    Given the frame "SwingSet" is the container
      And the toolbar button "JList demo" is selected
      And the tab "List Demo" is the container
    When I change the list "#1" to "TeraSystems"
      Then I should have the list "#1" with "TeraSystems"
    When I change the list "#1" to "YoYoTech"
      Then I should have the list "#1" with "YoYoTech"
    When I change the list "#1" to "#2"
      Then I should have the list "#1" with "MetaDynamics"
