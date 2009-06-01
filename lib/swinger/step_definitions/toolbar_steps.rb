module Swinger
  module Toolbar
    java_import org.netbeans.jemmy.operators.JToggleButtonOperator

    def togglebutton(button, container = @container)
      check_container "Toolbar button" unless container
      id = string_or_numeric_id(button)
      operator = nil
      timeout { operator = JToggleButtonOperator.new(container, id) }
      operator
    rescue TimeoutExpiredException
      JToggleButtonOperator.new(@container, Swinger::Button::ButtonByTooltipFinder.new(id))
    end
  end
end
World(Swinger::Toolbar)

Given t(/^the toolbar button "([^\"]*)" is selected$/) do |button|
  togglebutton(button).do_click
end

When t(/^I click the toolbar button "([^\"]*)"$/) do |button|
  togglebutton(button).do_click
end

Then t(/^the toolbar button "([^\"]*)" should be selected$/) do |button|
  togglebutton(button).selected?.should be_true
end