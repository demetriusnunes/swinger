module Swinger
  module Toolbar
    java_import org.netbeans.jemmy.operators.JToggleButtonOperator
    java_import org.netbeans.jemmy.ComponentChooser
    java_import javax.swing.JToggleButton

    class ButtonByTooltipFinder
      include ComponentChooser

      def initialize(tooltip)
        @tooltip = tooltip
        self
      end

      def getDescription
        "button with tooltip '#{@tooltip}'"
      end

      def checkComponent(comp)
        comp.tool_tip_text == @tooltip
      end
    end

    def togglebutton(button, container = @container)
      check_container "Toolbar button" unless container
      id = string_or_numeric_id(button)
      operator = nil
      timeout { operator = JToggleButtonOperator.new(container, id) }
      operator
    rescue TimeoutExpiredException
      JToggleButtonOperator.new(@container, ButtonByTooltipFinder.new(id))
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