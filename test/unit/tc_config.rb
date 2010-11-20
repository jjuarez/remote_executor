$:.unshift File.join( File.dirname( __FILE__ ), %w[.. .. lib remote_executor] )

require 'test/unit'
require 'fileutils'
require 'config'


class TC_Config < Test::Unit::TestCase

  def setup
    @fixtures_file = '../fixtures/settings.yml'
    @test_file     = '/tmp/settings.yml'
    @rc_file       = "#{ENV['HOME']}/.#{RemoteExecutor::CLIApplication::NAME.downcase}rc"
  end
  
  def teardown
  end
  
  def test_initialize()
    assert_raises( RemoteExecutor::YAMLFileNotFound ) { RemoteExecutor::Config.new( "AppFoo" ) }
  end
  
  def test_initialize_environment
    
    FileUtils.cp( @fixtures_file, @test_file )
    ENV[RemoteExecutor::CLIApplication::NAME.upcase] = @test_file 

    assert_instance_of( RemoteExecutor::Config, RemoteExecutor::Config.new )

    ENV[RemoteExecutor::CLIApplication::NAME.upcase] = "" 
    FileUtils.rm( @test_file )
  end
  
  def test_initialize_rcfile
    # File not found
    assert_raises( RemoteExecutor::ConfigurationNotLoaded ) { RemoteExecutor::Config.new }
    
    FileUtils.cp( @fixtures_file, @rc_file )
    
    assert_instance_of( RemoteExecutor::Config, RemoteExecutor::Config.new )
    
    FileUtils.remove( @rc_file )
  end  
end