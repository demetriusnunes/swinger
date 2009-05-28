path = File.expand_path(File.dirname(__FILE__))
require File.expand_path(path + '/../../../lib/swinger')

require File.expand_path(path + '/../../SwingSet2.jar')

puts "It takes a while for the scenarios to begin executing, so please be patient..."

Java::SwingSet2.main([].to_java(:string))
sleep(1)

at_exit do 
  java.lang.System.exit(0)
end