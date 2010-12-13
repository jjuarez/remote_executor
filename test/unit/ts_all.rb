require 'test/unit/testsuite'
require 'test/unit/ui/console/testrunner'
require 'tc_yaml_loader'
require 'tc_systems'
require 'tc_system'


class TS_RemoteExecutorTests
  
  def self.suite
    
    suite = Test::Unit::TestSuite.new
    
    suite << TC_YAMLLoader.suite
    suite << TC_Systems.suite
    suite << TC_System.suite
    
    return suite
  end
end


Test::Unit::UI::Console::TestRunner.run( TS_RemoteExecutorTests )