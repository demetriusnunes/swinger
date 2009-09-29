When t(/^I click the button "([^\"]*)"$/) do |name|
  button(name).do_click
end

When t(/^I click the button "([^\"]*)" no block$/) do |name|
  button(name).push_no_block
end

Given t(/^the button "([^\"]*)" is enabled$/) do |name|
  button(name).enabled?.should == true
end

Then t(/^the button "([^\"]*)" should (not )*be enabled$/) do |name, negation|
  button(name).enabled?.should == !negation
end