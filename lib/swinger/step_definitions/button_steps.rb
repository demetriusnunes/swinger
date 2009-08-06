module Swinger
  module Button
    java_import org.netbeans.jemmy.operators.JButtonOperator
    java_import org.netbeans.jemmy.ComponentChooser

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

    def button(id, container = @container)
      check_container("Button") unless container
      id = string_or_numeric_id(id)
      operator = nil
      timeout { operator = JButtonOperator.new(container, id) }
      operator
    rescue TimeoutExpiredException
      JButtonOperator.new(@container, ButtonByTooltipFinder.new(id))
    end

  end
end
World(Swinger::Button)

When t(/^I click the button "([^\"]*)"$/) do |name|
  button(name).do_click
end

When t(/^I click the button "([^\"]*)" no block$/) do |name|
  button(name).push_no_block
end

Given t(/^the button "([^\"]*)" is enabled$/) do |name|
  button(name).enabled?.should == true
end