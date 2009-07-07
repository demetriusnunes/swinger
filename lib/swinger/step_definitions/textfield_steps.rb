module Swinger
  module TextField
    java_import org.netbeans.jemmy.operators.JTextFieldOperator
    java_import org.netbeans.jemmy.operators.JPasswordFieldOperator
    java_import org.netbeans.jemmy.util.NameComponentChooser

    def text_field(id, container = @container)
      JTextFieldOperator.new(container, string_or_numeric_id(id))
    end

    def text_field_named name, container = @container
      JTextFieldOperator.new container, NameComponentChooser.new( name )
    end

    def password_field(id, container = @container)
      JPasswordFieldOperator.new(container, string_or_numeric_id(id))
    end
  end
end

World(Swinger::TextField)

When t(/^I fill the field "([^\"]*)" with "([^\"]*)"$/) do |name, text|
  text_field(name).text = text
end

When t(/^I fill the text field named "([^\"]*)" with "([^\"]*)"$/) do |name, text|
  text_field_named(name).text = text
end

When t(/^I fill the password field "([^\"]*)" with "([^\"]*)"$/) do |name, text|
  password_field(name).text = text
end

Then /^the field "([^\"]*)" should be "([^\"]*)"$/ do |name, text|
  text_field(name).text.should == text
end

Then /^the text field named "([^\"]*)" should be "([^\"]*)"$/ do |name, text|
  text_field_named(name).text.should == text
end