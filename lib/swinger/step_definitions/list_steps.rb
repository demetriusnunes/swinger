import org.netbeans.jemmy.operators.JListOperator

def list(id, container = @container)
  check_container("List") unless container
  JListOperator.new(container, string_or_numeric_id(id))
end

When t(/^I select "([^\"]*)" in the list "([^\"]*)"$/) do |value, id|
  value_id = string_or_numeric_id(value)
  operator = list(id)
  idx = value_id.is_a?(String) ? operator.find_item_index(value_id) : value_id
  operator.source.set_selected_index(idx)
end

Then t(/^I should have the list "([^\"]*)" with "([^\"]*)" selected$/) do |id, value|
  list(id).selected_value.should == value
end