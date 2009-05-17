require 'java'
$LOAD_PATH << File.expand_path(File.dirname(__FILE__)) + '/../../lib'

require 'jemmy.jar'
require 'SwingSet2.jar'
require 'rubygems'
require 'spec'
require 'spec/matchers'

Java::SwingSet2.main([].to_java(:string))