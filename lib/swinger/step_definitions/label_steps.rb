module Swinger
  module Label
    java_import org.netbeans.jemmy.operators.JLabelOperator

    def label(id, container = @container, named = false)
      JLabelOperator.new(container, named ? NameComponentChooser.new(id) : 
                                            string_or_numeric_id(id))
    end
  end
end

World(Swinger::Label)

Given t(/^I have the label (named )*"([^\"]*)"$/) do |named, name|
  label(name, @container, named)
end

When t(/^I set the label (named )*"([^\"]*)" to "([^\"]*)"$/) do |named, name, text|
  label(name, @container, named).text = text
end

Then t(/^the label (named )*"([^\"]*)" should be "([^\"]*)"$/) do |named, name, text|
  label(name, @container, named).text.should == text
end