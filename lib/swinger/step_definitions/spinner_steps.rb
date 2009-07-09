module Swinger
  module Spinner
    java_import org.netbeans.jemmy.operators.JSpinnerOperator
    #java_import org.netbeans.jemmy.operators.Operator
    java_import org.netbeans.jemmy.util.NameComponentChooser


    #def spinner(id, container = @container)
    #  check_container("Spinner") unless container
    #  JSpinnerOperator.new(container, string_or_numeric_id(id))
    #end

    def spinner_named(name, container = @container)
      check_container("Spinner") unless container
      JSpinnerOperator.new container, NameComponentChooser.new(name)
    end


    #def spinner_select(id, value, container = @container)
    #  value_id = string_or_numeric_id(value)
    #  operator = spinner(id)

    #  idx = value_id.is_a?(String) ?
    #    operator.find_item_index(value_id,
    #                             Operator::DefaultStringComparator.new(false, false)) :
    #                             value_id
    #  operator.source.set_selected_index(idx)
    #end
  end
end

World(Swinger::Spinner)


When t(/^I change the spinner named "([^\"]*)" to (\d+)$/) do |name, value|
   spinner_named(name).value = value.to_i
end


Then t(/^the spinner named "([^\"]*)" should be (\d+)$/) do |name, value|
  spinner_named(name).value.should == value.to_i
end