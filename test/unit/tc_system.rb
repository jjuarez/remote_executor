$:.unshift File.join( File.dirname( __FILE__ ), %w[.. .. lib remote_executor] )

require 'test/unit'
require 'system'


class TC_System < Test::Unit::TestCase

  TEST_SYSTEM_NAME  = 'wi.pro'
  TEST_SYSTEM_USER  = 'root'
  TEST_SYSTEM_HOSTS = [ 'lr1.wi.pro', 'lr2.wi.pro', 'alf1.wi.pro', 'alf2.wi.pro' ]
  TEST_PARAMS       = { 
    :name=>TEST_SYSTEM_NAME, 
    :user=>TEST_SYSTEM_USER, 
    :hosts=>TEST_SYSTEM_HOSTS 
  }
  
  def setup
  end

  def teardown
  end
  
  def test_initialize
    assert_raise( RuntimeError) { RemoteExecutor::System.new( "foo" ) }
    
    test_system = RemoteExecutor::System.new( TEST_PARAMS )
    
    assert_instance_of( RemoteExecutor::System, test_system )
    assert_equal( TEST_SYSTEM_NAME,  test_system.name)
    assert_equal( TEST_SYSTEM_USER,  test_system.user )
    assert_equal( TEST_SYSTEM_HOSTS, test_system.hosts )
  end
  
end