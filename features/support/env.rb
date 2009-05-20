require 'java'
$LOAD_PATH << File.expand_path(File.dirname(__FILE__)) + '/../../lib'

require 'jemmy.jar'
require 'SwingSet2.jar'
require 'rubygems'
require 'cucumber'
require 'spec'
require 'spec/matchers'
require 'yaml'

def load_i18n_for_step_definitions
  path = File.expand_path(File.dirname(__FILE__)) + '/step_definitions_i18n.yml'
  if File.exist?(path)
    $steps_i18n = YAML.load_file(path)
    $steps_i18n = $steps_i18n[Cucumber.lang]
  end
end

def run_target_app
  Java::SwingSet2.main([].to_java(:string))
end

def check_container(msg)
  raise "#{msg} container not set" unless @container
end

def string_or_numeric_id(id)
  id[0,1] == "#" ? id[1..-1].to_i : id
end

import org.netbeans.jemmy.Timeouts
import org.netbeans.jemmy.TimeoutExpiredException
def timeout(name, value, &block)
  value ||= @timeout || 100
  if block
    old_timeout = Timeouts.get_default(name)
    Timeouts.set_default(name, value)
    block.call
    Timeouts.set_default(name, old_timeout)
  else
    Timeouts.set_default(name, value)
  end
end

def expect_timeout(options = {}, &block)
  timeout(options[:id], options[:time]) do
    block.should raise_error(TimeoutExpiredException) 
  end
end

# step definition translation function
def t(regex)
  if $steps_i18n && match = $steps_i18n[regex.source]
    Regexp.new(match)
  else
    regex
  end
end

load_i18n_for_step_definitions
run_target_app
at_exit do 
  java.lang.System.exit(0)
end