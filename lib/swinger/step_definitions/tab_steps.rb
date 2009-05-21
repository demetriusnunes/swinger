java_import org.netbeans.jemmy.operators.JTabbedPaneOperator

def tab(id, container = @container)
  check_container "TabbedPane" unless container
  operator = JTabbedPaneOperator.new(container)
  operator.wait_page(string_or_numeric_id(id))
  operator
end

Given t(/^the tab "([^\"]*)" is the container$/) do |name|
  @container = tab(name)
end

When t(/^I select the tab "([^\"]*)"$/) do |name|
  tab(name).select_page(string_or_numeric_id(name))
end

Then t(/^the tab "([^\"]*)" should be selected$/) do |name|
  tab(name).wait_selected(string_or_numeric_id(name))
end