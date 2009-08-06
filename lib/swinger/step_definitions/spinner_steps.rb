module Swinger
  module Spinner
    java_import org.netbeans.jemmy.operators.JSpinnerOperator

    def spinner(id, container = @container, named = false)
      check_container("Spinner") unless container
      JSpinnerOperator.new(container, named ? NameComponentChooser.new(id) :
                                      string_or_numeric_id(id))
    end

  end
end

World(Swinger::Spinner)

When t(/^I change the spinner (named )*"([^\"]*)" to (\d+)$/) do |named, name, value|
  spinner_named(name, @container, named).value = value.to_i
end

Then t(/^the spinner (named )*"([^\"]*)" should (not )*be (\d+)$/) do |named, name, negation, value|
  spinner_named(name, @container, named).value.send( negation ? :should_not : :should ) == value.to_i 
end