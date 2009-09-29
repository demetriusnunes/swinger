module Swinger
  module Dialog
    java_import org.netbeans.jemmy.operators.JDialogOperator

    def dialog(name, container = container.current)
      container ? JDialogOperator.new(container, name) : JDialogOperator.new(name)
    end
  end
end
World(Swinger::Dialog)