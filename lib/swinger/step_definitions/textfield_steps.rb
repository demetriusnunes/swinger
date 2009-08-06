module Swinger
  module TextField
    java_import org.netbeans.jemmy.operators.JTextFieldOperator
    java_import org.netbeans.jemmy.operators.JPasswordFieldOperator

    def text_field(id, container = @container, named = false)
      JTextFieldOperator.new(container, named ? NameComponentChooser.new(id) : string_or_numeric_id(id))
    end

    def password_field(id, container = @container, named = false)
      JPasswordFieldOperator.new(container, named ? NameComponentChooser.new(id) : string_or_numeric_id(id))
    end
  end
end

World(Swinger::TextField)

When t(/^I fill the text field (named )*"([^\"]*)" with "([^\"]*)"$/) do |named, name, text|
  text_field(name, @container, named).text = text
end

When t(/^I fill the password field (named )*"([^\"]*)" with "([^\"]*)"$/) do |named, name, text|
  password_field(name, @container, named).text = text
end

Then t(/^the text field (named )*"([^\"]*)" should (be|contain) "([^\"]*)"$/) do |named, name, be, text|
  text_field(name, @container, named).text.should include(text)
end