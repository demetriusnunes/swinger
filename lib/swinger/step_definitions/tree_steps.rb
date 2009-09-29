When t(/^I click the node "([^\"]*)" in the tree$/) do |node|
  tree = tree()
  path = tree.find_path(node)
  tree.click_on_path(path)
end