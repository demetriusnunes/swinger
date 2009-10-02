Before('@console') do
  IRB.start_session(binding)
end

When /^console!$/ do
  IRB.start_session(binding)
end
