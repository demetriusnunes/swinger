Feature: Combobox

  Scenario: Combobox Manipulation
    Given the frame "SwingSet" is visible
      And the toolbar button "JComboBox demo" is selected
      And the tab "ComboBox Demo" is visible
    When I change the combobox "#2" to "Jon"
      Then I should have the combobox "#2" with "Jon"
    When I change the combobox "#3" to "Jon"
      Then I should have the combobox "#3" with "Jon"
    When I change the combobox "#4" to "Jon"
      Then I should have the combobox "#4" with "Jon"
    When I change the combobox "#4" to "#1"
      Then I should have the combobox "#4" with "Brent"