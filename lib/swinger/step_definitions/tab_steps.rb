Given t(/^the tab "([^\"]*)" is visible$/) do |name|
  container.set tab(name)
end

Given t(/^the tab "([^\"]*)" is selected$/) do |name|
  container.set tab(name)
  container.get.select_page(string_or_numeric_id(name))
end

Given t(/^the tab "([^\"]*)" is the container$/) do |name|
  container.set tab(name)
end

When t(/^I select the tab "([^\"]*)"$/) do |name|
  tab(name).select_page(string_or_numeric_id(name))
end

Then t(/^the tab "([^\"]*)" should be selected$/) do |name|
  tab(name).wait_selected(string_or_numeric_id(name))
end
