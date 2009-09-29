Feature: Textfield locators and events

  Scenario: Textfield filling
    Given the frame "SwingSet" is visible
    And the toolbar button "JInternalFrame demo" is selected
    And the tab "Internal Frames Demo" is visible
    When I fill the text field "Frame" with "My Frame Title"
    Then the text field "My Frame Title" should be "My Frame Title"

  Scenario: Textfield ordinal
    Given the frame "SwingSet" is visible
    And the toolbar button "JInternalFrame demo" is selected
    And the tab "Internal Frames Demo" is visible
    When I fill the text field "#1" with "My Frame Title 2"
    Then the text field "#1" should be "My Frame Title 2"
 
# Not passing because we need to modify SwingSet2 source  
#  Scenario: Textfield by label
#    Given the frame "SwingSet" is visible
#    And the toolbar button "JInternalFrame demo" is selected
#    And the tab "Internal Frames Demo" is visible
#    When I fill the text field "Frame title:" with "My Frame Title 2"
#    Then the text field "Frame title:" should be "My Frame Title 2"