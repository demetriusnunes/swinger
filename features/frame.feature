Feature: Frame locators and events

  Scenario: Frame activation
    Given the frame "SwingSet2" is visible
    When I activate the frame "SwingSet2"
    Then the frame "SwingSet2" should be active
    
  Scenario Outline: Internal frame activation
    Given the frame "SwingSet2" is a container
    And the toolbar button "#0" is selected
    And the internal frame "<frame>" is visible
    When I activate the internal frame "<frame>"
    Then the internal frame "<frame>" should be active
  Examples:
    | frame |
    | Frame 0 |
    | Frame 1 |
    | Frame 2 |
    | Frame 3 |
    | Frame 4 |