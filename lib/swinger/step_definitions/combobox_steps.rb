import org.netbeans.jemmy.operators.JComboBoxOperator
import org.netbeans.jemmy.operators.Operator

def combobox(id, container = @container)
  check_container("ComboBox") unless container
  JComboBoxOperator.new(container, string_or_numeric_id(id))
end

When t(/^I change the combobox "([^\"]*)" to "([^\"]*)"$/) do |id, value|
  value_id = string_or_numeric_id(value)
  operator = combobox(id)

  idx = value_id.is_a?(String) ?
          operator.find_item_index(value_id,
                  Operator::DefaultStringComparator.new(false, false)) :
          value_id
  operator.source.set_selected_index(idx)
end

Then t(/^I should have the combobox "([^\"]*)" with "([^\"]*)"$/) do |id, value|
  combobox(id).selected_item.should == value
end