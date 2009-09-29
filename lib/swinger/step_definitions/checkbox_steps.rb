When t(/^I click the checkbox "([^\"]*)"$/) do |name|
  checkbox(name).do_click
end

Then t(/^the checkbox "([^\"]*)" should (not )*be selected$/) do |name, negation|
  checkbox(name).selected?.should((negation ? be_false : be_true))
end