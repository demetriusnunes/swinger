Feature: Label manipulation

  Scenario: Internal frame manipulation
    Given the frame "SwingSet" is visible
      And the toolbar button "JInternalFrame demo" is selected
    And the internal frame "#1" is visible
    Given I have the label "Frame title:"
    When I set the label "Frame title:" to "Window Title:"
    Then the label "Window Title:" should be "Window Title:"