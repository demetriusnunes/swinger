import org.netbeans.jemmy.operators.JTextFieldOperator
import org.netbeans.jemmy.operators.JPasswordFieldOperator

def text_field(id, container = @container)
  JTextFieldOperator.new(container, string_or_numeric_id(id))
end

def password_field(id, container = @container)
  JPasswordFieldOperator.new(container, string_or_numeric_id(id))
end

When t(/^I fill the field "([^\"]*)" with "([^\"]*)"$/) do |name, text|
  text_field(name).text = text
end

When t(/^I fill the password field "([^\"]*)" with "([^\"]*)"$/) do |name, text|
  password_field(name).text = text
end

Then /^the field "([^\"]*)" should be "([^\"]*)"$/ do |name, text|
  text_field(name).text.should == text
end