Funcionalidade: Textfield locators and events

  Scenario: Textfield filling
    Given the frame "SwingSet" is a container
    And the toolbar button "JInternalFrame demo" is selected
    And the tab "Internal Frames Demo" is a container
    When I fill the field "Frame" with "My Frame Title"
    Then the field "My Frame Title" should be "My Frame Title"
