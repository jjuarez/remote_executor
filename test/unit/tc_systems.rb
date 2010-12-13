$:.unshift File.join( File.dirname( __FILE__ ), %w[.. .. lib rexecutor] )

require 'rubygems'
require 'fileutils'
require 'test/unit'
require 'system'
require 'systems'


class TC_Systems < Test::Unit::TestCase
 
  TEST_SYSTEM_NAME  = 'wi.pro'
  TEST_SYSTEM_USER  = 'root'
  TEST_SYSTEM_HOSTS = [ 'lr1.wi.pro', 'lr2.wi.pro', 'alf1.wi.pro', 'alf2.wi.pro' ]
  TEST_PARAMS       = { 
    :name=>TEST_SYSTEM_NAME, 
    :user=>TEST_SYSTEM_USER, 
    :hosts=>TEST_SYSTEM_HOSTS 
  }
  
  def setup   
    @systems = RemoteExecutor::Systems.new( File.join( File.dirname( __FILE__ ), %w[.. fixtures settings.yml] ) )
    @system  = RemoteExecutor::System.new( TEST_PARAMS )
  end
  
  def teardown
  end

  def test_find_by_name
    
    assert_instance_of( RemoteExecutor::System, @systems.find_by_name( TEST_SYSTEM_NAME ) )
    
    assert_equal( @system.name,  @systems.find_by_name( TEST_SYSTEM_NAME ).name )
    assert_equal( @system.user,  @systems.find_by_name( TEST_SYSTEM_NAME ).user )
    assert_equal( @system.hosts, @systems.find_by_name( TEST_SYSTEM_NAME ).hosts )
    
    assert_raise( RemoteExecutor::SystemNotFound ) { @systems.find_by_name( 'fooSystem' ) }  
  end
end