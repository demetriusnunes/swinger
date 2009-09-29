module Swinger
  module List
    java_import org.netbeans.jemmy.operators.JListOperator

    def list(id, container = container.current)
      container_check! container, "List"
      find_by_label(id, container, JListOperator) ||
        JListOperator.new(container, string_or_numeric_id(id))
    end
  end
end
World(Swinger::List)