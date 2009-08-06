java_import org.netbeans.jemmy.util.NameComponentChooser
java_import org.netbeans.jemmy.operators.ComponentOperator
java_import org.netbeans.jemmy.operators.ContainerOperator

module Swinger
  module Utils

    def check_container(msg)
      raise "#{msg} container not set" unless @container
    end

    def string_or_numeric_id(id)
      id[0,1] == "#" ? id[1..-1].to_i - 1 : id
    end
    
  end
end