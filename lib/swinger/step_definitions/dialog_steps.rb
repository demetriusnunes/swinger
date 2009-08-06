module Swinger
  module Dialog
    java_import org.netbeans.jemmy.operators.JDialogOperator

    def dialog(name, container = @container)
      container ? JDialogOperator.new(container, name) : JDialogOperator.new(name)
    end
  end
end
World(Swinger::Dialog)

Given t(/^the dialog "([^\"]*)" is visible$/) do |name|
  dialog(name)  
end

Given t(/^the dialog "([^\"]*)" is the container$/) do |name|
  @container = dialog(name)  
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