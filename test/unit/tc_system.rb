$:.unshift File.join( File.dirname( __FILE__ ), %w[.. .. lib] )

require 'test/unit'
require 'remote_executor/system'


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
    
    @test_system = RemoteExecutor::System.new( TEST_PARAMS )
    @foo_system  = RemoteExecutor::System.new( "foo" )
  end
  
  def test_validate
    
    assert_nil( RemoteExecutor::System.validate( { } ) )

    assert( RemoteExecutor::System.validate( {:name=>'name', :user=>'user', :hosts=>[ 'host1', 'host2' ]} ) )

    assert_nil( RemoteExecutor::System.validate( {:name=>'name', :user=>'user'} ) )
    assert_nil( RemoteExecutor::System.validate( {:name=>'name' } ) )
    assert_nil( RemoteExecutor::System.validate( {:user=>'user', :hosts=>[ 'host1', 'host2' ]} ) )
  end
  
  def test_initialize
    
    assert_instance_of( RemoteExecutor::System, @foo_system )
    assert( @foo_system.name.nil? && @foo_system.user.nil? && @foo_system.hosts.nil? )
    
    assert_instance_of( RemoteExecutor::System, @test_system )
    assert( @test_system.name && @test_system.user && @test_system.hosts )

    assert_equal( TEST_SYSTEM_NAME,  @test_system.name )
    assert_equal( TEST_SYSTEM_USER,  @test_system.user )
    assert_equal( TEST_SYSTEM_HOSTS, @test_system.hosts )
  end
end