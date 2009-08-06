Feature: Textfield locators and events

  Scenario: Textfield filling
    Given the frame "SwingSet" is the container
    And the toolbar button "JInternalFrame demo" is selected
    And the tab "Internal Frames Demo" is the container
    When I fill the text field "Frame" with "My Frame Title"
    Then the text field "My Frame Title" should be "My Frame Title"

  Scenario: Textfield ordinal
    Given the frame "SwingSet" is the container
    And the toolbar button "JInternalFrame demo" is selected
    And the tab "Internal Frames Demo" is the container
    When I fill the text field "#1" with "My Frame Title 2"
    Then the text field "#1" should be "My Frame Title 2"