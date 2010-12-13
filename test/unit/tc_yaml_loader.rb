$:.unshift File.join( File.dirname( __FILE__ ), %w[.. .. lib rexecutor] )

require 'test/unit'
require 'fileutils'
require 'yaml_loader'


class TC_YAMLLoader < Test::Unit::TestCase

  def setup
    
    @fixtures_file = File.join( File.dirname( __FILE__ ), %w[.. fixtures settings.yml] )
    @test_file     = '/tmp/settings.yml'
    
    FileUtils.copy( @fixtures_file, @test_file )
  end
  
  def teardown
    
    FileUtils.remove( @test_file )
  end
  
  def test_load_file

    assert_raises( RemoteExecutor::YAMLFileNotFound ) { RemoteExecutor::YAMLLoader.load_config( 'foobar.yml' ) }    
    assert_instance_of( Array, RemoteExecutor::YAMLLoader.load_config( @test_file ) )
  end  
end