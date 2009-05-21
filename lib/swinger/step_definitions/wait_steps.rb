Then t(/^I wait for "([^\"]*)" second[s]?$/) do |seconds|
  sleep(seconds.to_i)
end