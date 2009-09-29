Given t(/^the toolbar button "([^\"]*)" is selected$/) do |button|
  togglebutton(button).do_click
end

When t(/^I click the toolbar button "([^\"]*)"$/) do |button|
  togglebutton(button).do_click
end

Then t(/^the toolbar button "([^\"]*)" should be selected$/) do |button|
  togglebutton(button).selected?.should be_true
end