$:.unshift( File.join( File.dirname( __FILE__ ), %w[.. lib] ) )


require 'rubygems'
require 'shoulda'
require 'remote_executor/command_set'


class CommandSetTest < Test::Unit::TestCase
  
  context "CommandSet" do
    
    COMMANDSET_TEST_DATA = "command1; command2; command3"

    setup do
      @command_set = RemoteExecutor::CommandSet.new( COMMANDSET_TEST_DATA )
    end 
  
    should "parse a command set" do
      assert_equal( @command_set.commands, [ "command1", "command2", "command3" ] )
      assert_equal( @command_set.length,   [ "command1", "command2", "command3" ].length )
    end
    
    should "enumerate a command set" do
      assert_equal( @command_set.length, 3 )
    end
  end
end