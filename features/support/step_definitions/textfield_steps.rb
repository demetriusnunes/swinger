import org.netbeans.jemmy.operators.JTextFieldOperator

def text_field(id, container = @container)
  JTextFieldOperator.new(container, string_or_numeric_id(id))
end

When t(/^I fill the field "([^\"]*)" with "([^\"]*)"$/) do |name, text|
  text_field(name).enter_text(text)
end

Then /^the field "([^\"]*)" should be "([^\"]*)"$/ do |name, text|
  text_field(name).text.should == text
end