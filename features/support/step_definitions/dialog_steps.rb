import org.netbeans.jemmy.operators.JDialogOperator

def dialog(name)
  dialog = JDialogOperator.findJDialog(name, false, false)
  JDialogOperator.new(dialog) if dialog
end

Given t(/^the dialog "([^\"]*)" is visible$/) do |name|
  dialog(name)  
end

Given t(/^the dialog "([^\"]*)" is a container$/) do |name|
  @container = dialog(name)  
end

Then t(/^I should (not )*see the dialog "([^\"]*)"$/) do |negation, name|
  if negation
    dialog(name).should be_nil
  else
    dialog(name).visible?.should be_true
  end
end

When t(/^I close the dialog "([^\"]*)"$/) do |name|
  dialog(name).close
end