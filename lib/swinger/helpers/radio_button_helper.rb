module Swinger
  module RadioButton
    java_import org.netbeans.jemmy.operators.JRadioButtonOperator

    def radio_button(id, container = container.current)
      container_check! container, "Radio Button"
      JRadioButtonOperator.new(container, string_or_numeric_id(id))
    end
  end
end
World(Swinger::RadioButton)