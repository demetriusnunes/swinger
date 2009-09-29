Given t(/^the dialog "([^\"]*)" is visible$/) do |name|
  container.set dialog(name)
end

Given t(/^the dialog "([^\"]*)" is the container$/) do |name|
  container.set dialog(name)
end

Then t(/^I should (not )*see the dialog "([^\"]*)"$/) do |negation, name|
  if negation
    expect_timeout(:id => "DialogWaiter.WaitDialogTimeout") do
      dialog(name)
    end
  else
    dialog(name).visible?.should be_true
  end
end

When t(/^I close the dialog "([^\"]*)"$/) do |name|
  dialog(name).close
end