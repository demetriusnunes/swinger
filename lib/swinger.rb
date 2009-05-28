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

import org.netbeans.jemmy.JemmyProperties
import org.netbeans.jemmy.TestOut

JemmyProperties::set_current_output(TestOut.null_output) unless ENV['DEBUG']

World(Swinger::Utils)
World(Swinger::Timeout)

Dir["#{SWINGER_ROOT}/swinger/step_definitions/*.rb"].each { |sd| require sd }