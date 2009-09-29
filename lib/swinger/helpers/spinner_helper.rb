module Swinger
  module Spinner
    java_import org.netbeans.jemmy.operators.JSpinnerOperator

    def spinner(id, container = container.current)
      container_check! container, "Spinner"
      JSpinnerOperator.new(container, string_or_numeric_id(id))
    end

  end
end

World(Swinger::Spinner)