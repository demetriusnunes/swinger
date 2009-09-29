Feature: Frame locators and events

  Scenario: Frame activation
    Given the frame "SwingSet" is visible
    When I activate the frame "SwingSet"
    Then the frame "SwingSet" should be active

  Scenario Outline: Internal frame activation
    Given the frame "SwingSet" is visible
      And the toolbar button "JInternalFrame demo" is selected
    When I activate the internal frame "<frame>"
    Then the internal frame "<frame>" should be active
  Examples:
    | frame |
    | Frame 0 |
    | Frame 1 |
    | Frame 2 |
    | Frame 3 |
    | Frame 4 |
    
  Scenario Outline: Internal frame manipulation
    Given the frame "SwingSet" is visible
      And the toolbar button "JInternalFrame demo" is selected
    When I activate the internal frame "<frame>"
    Then I should see the internal frame "<frame>"
    When I close the internal frame "<frame>"
    Then I should not see the internal frame "<frame>"
  Examples:
    | frame |
    | Frame 0 |
    | Frame 1 |
    | Frame 2 |
    | Frame 3 |