import org.netbeans.jemmy.operators.JButtonOperator

def button(id, container = @container)
  JButtonOperator.new(container, string_or_numeric_id(id))
end

When t(/^I click the button "([^\"]*)"$/) do |name|
  button(name).do_click
end