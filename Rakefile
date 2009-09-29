require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features, 'Run all features on the test application') do |t|
  if feature = ENV['ONLY']
    t.cucumber_opts = "test/features/#{feature}.feature"
  else
    t.cucumber_opts = "test/features --format progress"
  end
  if ENV['RCOV']
    t.rcov = true
    t.rcov_opts = "--include test/features"
  end
end

desc 'Run test application'
task :test_app do
  `java -jar test/SwingSet2.jar`
end

def capture_steps
  $steps = {}
  ::Cucumber::StepDefinition.class_eval do
    alias_method :old_initialize, :initialize
    def initialize(regexp, &proc)
      caller[2] =~/.+\/(.+)\./
      $steps[$1] ||= []
      $steps[$1] << regexp.to_s[7..-2]
      old_initialize(regexp, &proc)
    end
  end
end

desc 'List all step definitions'
task :steps do
  capture_steps
  require File.dirname(__FILE__) + '/lib/swinger'
  $steps.keys.sort.each do |file|
    puts file + ":"
    $steps[file].sort.each { |s| puts "  " + s }
    puts
  end
end

desc 'List all missing translations for LANG=xx'
task :missing_i18n do
  capture_steps
  lang = ENV['LANG']
  (puts ('Must specifiy LANG=xx'); return) if lang.nil? || lang == 'en'
  
  require File.dirname(__FILE__) + '/lib/swinger'
  I18N.load(lang)
  count = 0
  $steps.keys.sort.each do |file|
    puts "#{file}.#{lang}.i18n"
    $steps[file].sort.each do |step|
      (puts '  ' + step; count += 1) if I18N.missing_translation?(step)
    end
    puts
  end
  puts "#{count} #{lang} missing translation(s)."
end

task :default => :features