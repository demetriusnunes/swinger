module Swinger
  module Label
    java_import org.netbeans.jemmy.operators.JLabelOperator
    java_import org.netbeans.jemmy.operators.JComponentOperator

    def label(id, container = container.current)
      container_check! container, "Label"
      JLabelOperator.new(container, string_or_numeric_id(id))
    end

    # tries to find component referenced by a label thru JLabel#label_for
    def find_by_label(id, container, operator_klass = JComponentOperator)
      selector = id[0,1]
      return nil if %w(# % @).include?(selector) # sync with #string_or_numeric_id selectors

      label = JLabelOperator.new(container, id) rescue nil
      component = label ? label.label_for : nil
      component ? operator_klass.new(component) : nil
    end
  end
end

World(Swinger::Label)