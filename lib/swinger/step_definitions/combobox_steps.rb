When t(/^I change the combobox "([^\"]*)" to "([^\"]*)"$/) do |id, value|
  combobox_select(id, value)
end

Then t(/^I should have the combobox "([^\"]*)" with "([^\"]*)"$/) do |id, value|
  combobox(id).selected_item.should == value
end