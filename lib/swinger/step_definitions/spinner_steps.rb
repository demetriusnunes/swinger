module Swinger
  module Spinner
    java_import org.netbeans.jemmy.operators.JSpinnerOperator

    def spinner(id, container = @container)
      check_container("Spinner") unless container
      JSpinnerOperator.new(container, string_or_numeric_id(id))
    end

  end
end

World(Swinger::Spinner)

When t(/^I change the spinner "([^\"]*)" to (\d+)$/) do |name, value|
  spinner(name).value = value.to_i
end

Then t(/^the spinner "([^\"]*)" should (not )*be (\d+)$/) do |name, negation, value|
  spinner(name).value.send( negation ? :should_not : :should ) == value.to_i 
end