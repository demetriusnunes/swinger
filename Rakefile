require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features, 'Run all features on the test application') do |t|
  if feature = ENV['ONLY']
    t.cucumber_opts = "test/features/#{feature}.feature"
  else
    t.cucumber_opts = "test/features --format pretty"
  end
end

desc 'Run test application'
task :test_app do
  `#{ENV['_STARTJAVA']} -jar test/SwingSet2.jar`
end

task :default => :features