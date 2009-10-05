Before('@debug') do
  Debugger.start_session binding
end

When /^debug!$/ do
  Debugger.start_session binding
end

