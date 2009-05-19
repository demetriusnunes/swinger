import org.netbeans.jemmy.operators.JTabbedPaneOperator

def tab(name, container = @container)
  operator = JTabbedPaneOperator.new(container)
  tab = operator.select_page(string_or_numeric_id(name))
  [ tab, operator ]
end

Given t(/^the tab "([^\"]*)" is a container$/) do |name|
  @container = tab(name).last
end

When t(/^I select the tab "([^\"]*)"$/) do |name|
  tab(name)
end

Then t(/^the tab "([^\"]*)" should be selected$/) do |name|
  tab(name).first.showing?.should be_true
end