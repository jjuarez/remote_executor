require 'test/unit/testsuite'
require 'test/unit/ui/console/testrunner'
require 'tc_application_config'
require 'tc_basic_config'
require 'tc_choice_config'
require 'tc_system_config'
require 'tc_system'


class TS_RemoteExecutorTests
  
  def self.suite
    
    suite = Test::Unit::TestSuite.new
    
    suite << TC_BasicConfig.suite
    suite << TC_ChoiceConfig.suite
    suite << TC_ApplicationConfig.suite
    suite << TC_System.suite
    suite << TC_SystemConfig.suite
    
    return suite
  end
end


Test::Unit::UI::Console::TestRunner.run( TS_RemoteExecutorTests )