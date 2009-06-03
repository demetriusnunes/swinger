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

desc 'List all step definitions'
task :steps do
  $steps = {}
  module Cucumber
    class StepDefinition
      alias_method :old_initialize, :initialize
      def initialize(regexp, &proc)
        caller[1] =~/.+\/(.+)\./
        $steps[$1] ||= []
        $steps[$1] << regexp.to_s[8..-3]
        old_initialize(regexp, &proc)
      end
    end
  end
  
  require File.dirname(__FILE__) + '/lib/swinger'
  $steps.keys.sort.each do |file|
    puts file + ":"
    $steps[file].sort.each { |s| puts "  " + s }
    puts
  end
end

task :default => :features