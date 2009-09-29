module Swinger
  module TextField
    java_import org.netbeans.jemmy.operators.JTextFieldOperator
    java_import org.netbeans.jemmy.operators.JPasswordFieldOperator

    def text_field(id, container = container.current)
      container_check! container, "Text field"
      find_by_label(id, container, JTextFieldOperator) ||
        JTextFieldOperator.new(container, string_or_numeric_id(id))
    end

    def password_field(id, container = container.current)
      container_check! container, "Password field"
      find_by_label(id, container, JPasswordFieldOperator) ||
        JPasswordFieldOperator.new(container, string_or_numeric_id(id))
    end
  end
end

World(Swinger::TextField)