import org.netbeans.jemmy.operators.JFrameOperator
import org.netbeans.jemmy.operators.JInternalFrameOperator

def frame(name, internal)
  if internal 
    check_container "Internal frame"
    JInternalFrameOperator.new(@container, name)
  else
    JFrameOperator.new(name)
  end
end

Given /^the (internal )*frame "([^\"]*)" is visible$/ do |internal, name|
  frame(name, internal)
end

Given /^the frame "([^\"]*)" is a container$/ do |name|
  @container = JFrameOperator.new(name)
end

When /^I activate the (internal )*frame "([^\"]*)"$/ do |internal, name|
  frame(name, internal).click_mouse
end

Then /^the (internal )*frame "([^\"]*)" should be active$/ do |internal, name|
  frame_operator = frame(name, internal)
  method = internal ? :selected : :active
  frame_operator.send("#{method}?").should be_true
end 