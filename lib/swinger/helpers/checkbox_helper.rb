module Swinger
  module Checkbox
    java_import org.netbeans.jemmy.operators.JCheckBoxOperator

    def checkbox(id, container = container.current)
      container_check! container, "Checkbox"
      JCheckBoxOperator.new(container, string_or_numeric_id(id))
    end
  end
end
World(Swinger::Checkbox)
