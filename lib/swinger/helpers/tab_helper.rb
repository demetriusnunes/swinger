module Swinger
  module Tab
    java_import org.netbeans.jemmy.operators.JTabbedPaneOperator

    def tab(id, container = container.current)
      container_check! container, "TabbedPane"
      operator = JTabbedPaneOperator.new(container)
      operator.wait_page(string_or_numeric_id(id))
      operator
    end
  end
end
World(Swinger::Tab)