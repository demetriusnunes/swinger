module Swinger
  module Frame
    java_import org.netbeans.jemmy.operators.JFrameOperator
    java_import org.netbeans.jemmy.operators.JInternalFrameOperator

    def frame(name, internal = nil, container = container.current)
      if internal
        container_check! container, "Internal frame"
        JInternalFrameOperator.new(container, string_or_numeric_id(name))
      else
        JFrameOperator.new(name)
      end
    end
  end
end
World(Swinger::Frame)