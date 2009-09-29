Given t(/^I have the label "([^\"]*)"$/) do |name|
  label(name)
end

When t(/^I set the label "([^\"]*)" to "([^\"]*)"$/) do |name, text|
  label(name).text = text
end

Then t(/^the label "([^\"]*)" should be "([^\"]*)"$/) do |name, text|
  label(name).text.should == text
end