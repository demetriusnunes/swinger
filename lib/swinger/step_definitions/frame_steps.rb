Given t(/^the (internal )*frame "([^\"]*)" is visible$/) do |internal, name|
  container.set frame(name, internal)
end

Given t(/^the (internal )*frame "([^\"]*)" is the container$/) do |internal, name|
  container.set frame(name, internal)
end

When t(/^I activate the (internal )*frame "([^\"]*)"$/) do |internal, name|
  method = internal ? [ :set_selected, true ] : [ :activate ]
  frame = frame(name, internal)
  frame.send(*method)
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