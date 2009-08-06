module Swinger
  module Label
    java_import org.netbeans.jemmy.operators.JLabelOperator

    def label(id, container = @container)
      check_container("Label") unless container
      JLabelOperator.new(container, string_or_numeric_id(id))
    end
  end
end

World(Swinger::Label)

Given t(/^I have the label "([^\"]*)"$/) do |name|
  label(name)
end

When t(/^I set the label "([^\"]*)" to "([^\"]*)"$/) do |name, text|
  label(name).text = text
end

Then t(/^the label "([^\"]*)" should be "([^\"]*)"$/) do |name, text|
  label(name).text.should == text
end