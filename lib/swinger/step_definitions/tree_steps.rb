module Swinger
  module Tree
    java_import org.netbeans.jemmy.operators.JTreeOperator

    def tree(container = @container)
      JTreeOperator.new(container)
    end
  end
end
World(Swinger::Tree)

When t(/^I click the node "([^\"]*)" in the tree$/) do |node|
  tree = tree()
  path = tree.find_path(node)
  tree.click_on_path(path)
end