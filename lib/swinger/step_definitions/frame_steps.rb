import org.netbeans.jemmy.operators.JFrameOperator
import org.netbeans.jemmy.operators.JInternalFrameOperator

def frame(name, internal = nil)
  if internal 
    check_container "Internal frame"
    JInternalFrameOperator.new(@container, name)
  else
    JFrameOperator.new(name)
  end
end

Given t(/^the (internal )*frame "([^\"]*)" is visible$/) do |internal, name|
  frame(name, internal)
end

Given t(/^the frame "([^\"]*)" is the container$/) do |name|
  @container = JFrameOperator.new(name)
end

When t(/^I activate the (internal )*frame "([^\"]*)"$/) do |internal, name|
  method = internal ? [ :set_selected, true ] : [ :activate ]
  frame(name, internal).send(*method)
end

Then t(/^the (internal )*frame "([^\"]*)" should be active$/) do |internal, name|
  frame_operator = frame(name, internal)
  method = internal ? :selected : :active
  frame_operator.send("#{method}?").should be_true
end 

Then t(/^I should (not )*see the (internal )*frame "([^\"]*)"$/) do |negation, internal, name|
  if negation
    timeout_id = internal ? nil : "FrameWaiter.WaitFrameTimeout"
    expect_timeout(:id => timeout_id) do
      frame(name, internal)
    end
  else
    frame(name, internal).visible?.should be_true
  end
end

When t(/^I close the (internal )*frame "([^\"]*)"$/) do |internal, name|
  frame(name, internal).set_closed(true)
end