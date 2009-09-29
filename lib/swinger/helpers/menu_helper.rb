module Swinger
  module Menu
    java_import org.netbeans.jemmy.operators.JMenuBarOperator
    java_import org.netbeans.jemmy.operators.JMenuOperator
    java_import org.netbeans.jemmy.operators.JMenuItemOperator

    def menu(path, container = container.current)
      container_check! container, "Menu"
      parts = path.split("/")
      @menu_bar = JMenuBarOperator.new(container)
      @menu = JMenuOperator.new(@menu_bar, parts.first)
      if parts.size > 1
        @menu.push
        @menu.show_menu_item(path, "/")
      else
        @menu
      end
    end
  end
end
World(Swinger::Menu)