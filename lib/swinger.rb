SWINGER_ROOT = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH << SWINGER_ROOT

require 'java'
require 'cucumber'
require 'spec'
require 'spec/matchers'

require 'swinger/jemmy.jar'
require 'swinger/i18n'
require 'swinger/identifier'
require 'swinger/timeout'
require 'swinger/component_finder_by_variable_name'
require 'swinger/container'
require 'swinger/debug'

java_import org.netbeans.jemmy.JemmyProperties
java_import org.netbeans.jemmy.TestOut
JemmyProperties::set_current_output(TestOut.null_output) unless ENV['DEBUG']

lang = Cucumber::Cli::Main.step_mother.options[:lang] rescue Cucumber.lang
I18N.load(lang)

Dir["#{SWINGER_ROOT}/swinger/helpers/*.rb"].each { |helper| require helper }
Dir["#{SWINGER_ROOT}/swinger/step_definitions/*.rb"].each { |sd| require sd }
