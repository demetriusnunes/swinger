module Swinger
  module Table
    java_import org.netbeans.jemmy.operators.JTableOperator

    def table(container = @container)
      JTableOperator.new(container)
    end
  end
end
World(Swinger::Table)

When t(/^I select all in the table$/) do
  table().select_all
end

Then t(/^I should (not )*see "([^\"]*)" in the table$/) do |negation, text|
  idx = table().find_cell_row(text)
  negation ? idx.should(equal(-1)) : idx.should_not(equal(-1))
end