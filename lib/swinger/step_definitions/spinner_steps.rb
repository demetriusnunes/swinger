When t(/^I change the spinner "([^\"]*)" to (\d+)$/) do |name, value|
  spinner(name).value = value.to_i
end

Then t(/^the spinner "([^\"]*)" should (not )*be (\d+)$/) do |name, negation, value|
  spinner(name).value.send( negation ? :should_not : :should ) == value.to_i 
end