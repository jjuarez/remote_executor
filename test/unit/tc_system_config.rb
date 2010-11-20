$:.unshift File.join( File.dirname( __FILE__ ), %w[.. .. lib remote_executor] )

require 'test/unit'
require 'system_config'
require 'fileutils'


class TC_SystemConfig < Test::Unit::TestCase
 
  TEST_GOOD_SYSTEM_ID = 'wi.pro'
  TEST_SYSTEM_USER    = 'root'
  TEST_SYSTEM_HOSTS   = [ 'lr1.wi.pro', 'lr2.wi.pro', 'alf1.wi.pro', 'alf2.wi.pro' ]
  
  def setup    
    @fixtures_file = "../fixtures/settings.yml"
    @test_file     = "/tmp/settings.yml"
     
    FileUtils.copy( @fixtures_file, @test_file )    
    ENV[RemoteExecutor::CLIApplication::NAME.upcase] = @test_file 
    @system_config = RemoteExecutor::SystemConfig.instance( @test_file )
  end
  
  def teardown
    FileUtils.remove( @test_file )
  end

  def test_find_system
    
    assert_instance_of( Hash, @system_config.find_system( TEST_GOOD_SYSTEM_ID ))  
    assert_equal( TEST_GOOD_SYSTEM_ID, @system_config.find_system( TEST_GOOD_SYSTEM_ID )[:name] )
    assert_equal( TEST_SYSTEM_USER,    @system_config.find_system( TEST_GOOD_SYSTEM_ID )[:user] )
    assert_equal( TEST_SYSTEM_HOSTS,   @system_config.find_system( TEST_GOOD_SYSTEM_ID )[:hosts] )
    assert_raise( RemoteExecutor::ConfigurationError ) { @system_config.find_system( 'fooSystem' ) }  
  end
end