module Swinger
  module Label
    java_import org.netbeans.jemmy.operators.JLabelOperator
    java_import org.netbeans.jemmy.util.NameComponentChooser

    def label(id, container = @container)
      JLabelOperator.new(container, string_or_numeric_id(id))
    end

    def label_named(name, container = @container)
      JLabelOperator.new(container, NameComponentChooser.new( name ))
    end
    
  end
end

World( Swinger::Label)

When t(/^I have the label named "([^\"]*)"$/) do |name|
  label_named(name)
end

When t(/^I set the label named "([^\"]*)" to "([^\"]*)"$/) do |name, text|
  label_named(name).text = text
end

Then t(/^the label named "([^\"]*)" should be "([^\"]*)"$/) do |name, text|
  label_named(name).text.should == text
end
