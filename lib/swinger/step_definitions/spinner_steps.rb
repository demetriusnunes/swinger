module Swinger
  module Spinner
    java_import org.netbeans.jemmy.operators.JSpinnerOperator
    java_import org.netbeans.jemmy.util.NameComponentChooser

    def spinner_named(name, container = @container)
      check_container("Spinner") unless container
      JSpinnerOperator.new container, NameComponentChooser.new(name)
    end

  end
end

World(Swinger::Spinner)

When t(/^I change the spinner named "([^\"]*)" to (\d+)$/) do |name, value|
  spinner_named(name).value = value.to_i
end

Then t(/^the spinner named "([^\"]*)" should (not )*be (\d+)$/) do |name, negation, value|
  spinner_named(name).value.send( negation ? :should_not : :should ) == value.to_i 
end

