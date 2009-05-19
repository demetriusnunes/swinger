import org.netbeans.jemmy.operators.JToggleButtonOperator
import org.netbeans.jemmy.ComponentChooser
import javax.swing.JToggleButton

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
  check_container "Toolbar button"
  id = string_or_numeric_id(button)

  if id.is_a?(String)
    btn = JToggleButtonOperator.findJToggleButton(@container.source, id, false, false, 0)
  else
    btn = @container.class.findComponent(@container.source, JToggleButtonOperator::JToggleButtonFinder.new, id)
  end
  tooltip_finder = ButtonByTooltipFinder.new(id)
  btn ||= JToggleButtonOperator.findJToggleButton(@container.source, tooltip_finder)
  btn ? JToggleButtonOperator.new(btn) : nil
end

Given t(/^the toolbar button "([^\"]*)" is selected$/) do |button|
  togglebutton(button).do_click
end

When t(/^I click the toolbar button "([^\"]*)"$/) do |button|
  togglebutton(button).do_click
end

Then t(/^the toolbar button "([^\"]*)" should be selected$/) do |button|
  togglebutton(button).selected?.should be_true
end