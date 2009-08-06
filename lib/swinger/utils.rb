java_import org.netbeans.jemmy.util.NameComponentChooser
java_import org.netbeans.jemmy.operators.ComponentOperator
java_import org.netbeans.jemmy.operators.ContainerOperator
java_import org.netbeans.jemmy.operators.WindowOperator

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
    
  end
end