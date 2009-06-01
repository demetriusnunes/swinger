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