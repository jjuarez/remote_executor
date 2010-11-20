require 'test/unit/testsuite'
require 'test/unit/ui/console/testrunner'
require 'tc_config'
require 'tc_system_config'
require 'tc_system'
require 'tc_cli'


class TS_RemoteExecutorTests
  
  def self.suite
    suite = Test::Unit::TestSuite.new

    suite << TC_Config.suite
    suite << TC_SystemConfig.suite
    suite << TC_System.suite
    suite << TC_Cli.suite

    return suite
  end
end


Test::Unit::UI::Console::TestRunner.run( TS_RemoteExecutorTests )