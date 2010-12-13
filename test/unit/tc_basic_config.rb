$:.unshift File.join( File.dirname( __FILE__ ), %w[.. .. lib] )

require 'test/unit'
require 'fileutils'
require 'remote_executor/basic_config'


class TC_BasicConfig < Test::Unit::TestCase

  def setup
    
    @fixtures_file = File.join( File.dirname( __FILE__ ), %w[.. fixtures settings.yml] )
    @test_file     = '/tmp/settings.yml'
    
    FileUtils.copy( @fixtures_file, @test_file )
  end
  
  def teardown
    
    FileUtils.remove( @test_file )
  end
  
  def test_load_file

    assert_raises( RemoteExecutor::YAMLFileNotFound ) { RemoteExecutor::BasicConfig.load_config( 'foobar.yml' ) }    
    assert_instance_of( Array, RemoteExecutor::BasicConfig.load_config( @test_file ) )
  end  
end