module Swinger
  module Toolbar
    java_import org.netbeans.jemmy.operators.JToggleButtonOperator

    def togglebutton(button, container = container.current)
      container_check! container, "Toolbar button"
      id = string_or_numeric_id(button)
      operator = nil
      timeout { operator = JToggleButtonOperator.new(container, id) }
      operator
    rescue TimeoutExpiredException
      JToggleButtonOperator.new(container, Swinger::Button::ButtonByTooltipFinder.new(id))
    end
  end
end
World(Swinger::Toolbar)