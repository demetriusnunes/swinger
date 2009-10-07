java_import org.netbeans.jemmy.ComponentChooser
java_import org.netbeans.jemmy.operators.ComponentOperator

# This class uses tries to use internal variable names to find components
# declared within a window class (even if it's private) thru reflection
class ComponentFinderByVariableName
  include ComponentChooser

  def initialize(name, container = nil)
    @name = name
    @container = container
  end

  def description
    "Component in '#{@container}' with variable name '#{@name}'"
  end
    
  def check_component(comp)
    op = ComponentOperator.new(comp)
    win = @container ? @container.source : op.window
    field = win.java_class.declared_field(@name)
    field.accessible = true
    field_obj = field.value(win)
    field_obj == comp
  end
end
