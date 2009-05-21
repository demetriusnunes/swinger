SWINGER_ROOT = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH << SWINGER_ROOT

require 'java'
require 'cucumber'
require 'spec'
require 'spec/matchers'

require 'swinger/jemmy.jar'
require 'swinger/i18n'
require 'swinger/utils'
require 'swinger/timeout'

World(Swinger::Utils)
World(Swinger::Timeout)

Dir["#{SWINGER_ROOT}/swinger/step_definitions/*.rb"].each { |sd| require sd }