Given t(/^the text field "([^\"]*)" is filled with "([^\"]*)"$/) do |name, value|
  text_field(name).text.should == value
end

Given t(/^the text field "([^\"]*)" is (not )*enabled$/) do |name, negation|
  text_field(name).enabled?.send(negation ? :should_not : :should) == true
end

Then t(/^the text field "([^\"]*)" should (not )*be enabled$/) do |name, negation|
  text_field(name).enabled?.send(negation ? :should_not : :should) == true
end

Then t(/^the text field "([^\"]*)" should (not )*be empty$/) do |name, negation|
  text_field(name).text.empty?.should == !negation
end

Given t(/^the text field "([^\"]*)" is (not )*empty$/) do |name, negation|
  text_field(name).text.empty?.send(negation ? :should_not : :should) == true
end

When t(/^I fill the text field "([^\"]*)" with "([^\"]*)"$/) do |name, text|
  text_field(name).text = text
end

When t(/^I fill the password field "([^\"]*)" with "([^\"]*)"$/) do |name, text|
  password_field(name).text = text
end

Then t(/^the text field "([^\"]*)" should (be|contain) "([^\"]*)"$/) do |name, be, text|
  text_field(name).text.should include(text)
end