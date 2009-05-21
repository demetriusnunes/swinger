Funcionalidade: Textfield locators and events

  Scenario: Textfield filling
    Given the frame "SwingSet" is the container
    And the toolbar button "JInternalFrame demo" is selected
    And the tab "Internal Frames Demo" is the container
    When I fill the field "Frame" with "My Frame Title"
    Then the field "My Frame Title" should be "My Frame Title"

  Scenario: Textfield ordinal
    Given the frame "SwingSet" is the container
    And the toolbar button "JInternalFrame demo" is selected
    And the tab "Internal Frames Demo" is the container
    When I fill the field "#0" with "My Frame Title 2"
    Then the field "#0" should be "My Frame Title 2"