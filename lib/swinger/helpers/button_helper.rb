module Swinger
  module Button
    java_import org.netbeans.jemmy.operators.JButtonOperator
    java_import org.netbeans.jemmy.ComponentChooser

    class ButtonByTooltipFinder
      include ComponentChooser

      def initialize(tooltip)
        @tooltip = tooltip
        self
      end

      def getDescription
        "button with tooltip '#{@tooltip}'"
      end

      def checkComponent(comp)
        comp.tool_tip_text == @tooltip
      end
    end

    def button(id, container = container.current)
      container_check! container, "Button"
      id = string_or_numeric_id(id)
      operator = nil
      timeout { operator = JButtonOperator.new(container, id) }
      operator
    rescue TimeoutExpiredException
      JButtonOperator.new(container, ButtonByTooltipFinder.new(id))
    end

  end
end
World(Swinger::Button)
