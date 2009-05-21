Then t(/^I wait for "([^\"]*)" seconds$/) do |seconds|
  sleep(seconds.to_i)
end