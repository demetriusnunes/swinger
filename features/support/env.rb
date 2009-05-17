require 'java'
$LOAD_PATH << File.expand_path(File.dirname(__FILE__)) + '/../../lib'

require 'jemmy.jar'
require 'SwingSet2.jar'
require 'rubygems'
require 'spec'
require 'spec/matchers'

Java::SwingSet2.main([].to_java(:string))

def check_container(msg)
  raise "#{msg} container not set" unless @container
end

def string_or_numeric_id(id)
  id[0,1] == "#" ? id[1..-1].to_i : id
end