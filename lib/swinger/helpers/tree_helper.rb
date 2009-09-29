module Swinger
  module Tree
    java_import org.netbeans.jemmy.operators.JTreeOperator

    def tree(container = container.current)
      container_check! container, "Tree"
      JTreeOperator.new(container)
    end
  end
end
World(Swinger::Tree)