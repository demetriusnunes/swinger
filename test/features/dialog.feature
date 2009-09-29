Feature: Dialog locators and events

  Scenario: Dialog manipulation
    Given the frame "SwingSet" is visible
    When I click the menu "File/About"
    Then I should see the dialog "About Swing!"
    Given the dialog "About Swing!" is visible
    When I click the button "OK"
    Then I should not see the dialog "About Swing!"
    Given the frame "SwingSet" is visible
    When I click the menu "File/About"
    Then I should see the dialog "About Swing!"
    When I close the dialog "About Swing!"
    Then I should not see the dialog "About Swing!"