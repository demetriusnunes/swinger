module Swinger
  module Table
    java_import org.netbeans.jemmy.operators.JTableOperator

    def table(container = container.current)
      container_check! container, "Table"
      JTableOperator.new(container)
    end
  end
end
World(Swinger::Table)