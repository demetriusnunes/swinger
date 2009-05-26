module Swinger
  module Checkbox
    java_import org.netbeans.jemmy.operators.JCheckBoxOperator

    def checkbox(id, container = @container)
      check_container("Checkbox") unless container
      JCheckBoxOperator.new(container, string_or_numeric_id(id))
    end
  end
end
World(Swinger::Checkbox)

When t(/^I click the checkbox "([^\"]*)"$/) do |name|
  checkbox(name).do_click
end

Then t(/^the checkbox "([^\"]*)" should (not )*be selected$/) do |name, negation|
  checkbox(name).selected?.should((negation ? be_false : be_true))
end