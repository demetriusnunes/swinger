java_import org.netbeans.jemmy.util.NameComponentChooser
java_import org.netbeans.jemmy.operators.ComponentOperator
java_import org.netbeans.jemmy.operators.ContainerOperator
java_import org.netbeans.jemmy.operators.WindowOperator
java_import org.netbeans.jemmy.operators.JLabelOperator
java_import org.netbeans.jemmy.operators.JComponentOperator

module Swinger
  module Utils

    def check_container(msg)
      raise "#{msg} container not set" unless @container
    end

    def string_or_numeric_id(id)
      return id unless id.is_a?(String)
      
      selector, value = id[0,1], id[1..-1]
      
      case selector
        when "#":
          value.to_i - 1
        when "%"
          NameComponentChooser.new(value, @container)
        when "@":
          ComponentFinderByVariableName.new(value, @container)
        else
          id
      end
    end

    # tries to find component referenced by a label thru JLabel#label_for
    def find_by_label(id, container, operator_klass = JComponentOperator)
      selector, value = id[0,1], id[1..-1]
      return nil if %w(# % @).include?(selector) # sync with #string_or_numeric_id selectors
      
      label = JLabelOperator.new(container, id) rescue nil
      component = label ? label.label_for : nil
      component ? operator_klass.new(component) : nil
    end
  end
end