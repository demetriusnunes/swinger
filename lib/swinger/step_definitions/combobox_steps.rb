import org.netbeans.jemmy.operators.JComboBoxOperator

def combobox(id, container = @container)
  check_container("ComboBox") unless container
  JComboBoxOperator.new(container, string_or_numeric_id(id))
end

When t(/^I change the combobox "([^\"]*)" to "([^\"]*)"$/) do |id, value|
  combobox(id).select_item(value)
end

Then t(/^I should have the combobox "([^\"]*)" with "([^\"]*)"$/) do |id, value|
  combobox(id).selected_item.should == value
end