import org.netbeans.jemmy.operators.JToggleButtonOperator

def togglebutton(button)
  raise "Toolbar button container not set" unless @container
  id = button[0,1] == "#" ? button[1..-1].to_i : button
  JToggleButtonOperator.new(@container, id)
end

When /^I click the toolbar button "([^\"]*)"$/ do |button|
  togglebutton(button).do_click
end

Then /^the toolbar button "([^\"]*)" should be selected$/ do |button|
  togglebutton(button).selected?.should be_true
end
