module Swinger
  module RadioButton
    java_import org.netbeans.jemmy.operators.JRadioButtonOperator

    def radio_button(id, container = @container)
      check_container("Radio Button") unless container
      JRadioButtonOperator.new(container, string_or_numeric_id(id))
    end
  end
end
World(Swinger::RadioButton)

When t(/^I click the radio button "([^\"]*)"$/) do |name|
  radio_button(name).do_click
end

Then t(/^the radio button "([^\"]*)" should (not )*be selected$/) do |name, negation|
  radio_button(name).selected?.should((negation ? be_false : be_true))
end
