module Swinger
  module Combobox
    java_import org.netbeans.jemmy.operators.JComboBoxOperator
    java_import org.netbeans.jemmy.operators.Operator

    def combobox(id, container = container.current)
      container_check! container, "ComboBox"
      find_by_label(id, container, JComboBoxOperator) ||
        JComboBoxOperator.new(container, string_or_numeric_id(id))
    end

    def combobox_select(id, value, container = container.current)
      value_id = string_or_numeric_id(value)
      operator = combobox(id)

      idx = value_id.is_a?(String) ?
              operator.find_item_index(value_id,
                      Operator::DefaultStringComparator.new(false, false)) :
              value_id
      operator.source.set_selected_index(idx)
    end
  end
end
World(Swinger::Combobox)
