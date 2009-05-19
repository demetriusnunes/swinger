import org.netbeans.jemmy.operators.JMenuBarOperator
import org.netbeans.jemmy.operators.JMenuOperator
import org.netbeans.jemmy.operators.JMenuItemOperator

def menu(path)
  check_container "Menu"
  parts = path.split("/")
  @menu_bar = JMenuBarOperator.new(@container)
  @menu = JMenuOperator.new(@menu_bar, parts.first)
  if parts.size > 1
    @menu.push
    @menu.show_menu_item(path, "/")
  else
    @menu
  end
end

When t(/^I click the menu "([^\"]*)"$/) do |path|
  menu(path).push
end