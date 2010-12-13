$:.unshift File.join( File.dirname( __FILE__ ), %w[.. .. lib remote_executor] )

require 'test/unit'
require 'fileutils'
require 'version'
require 'basic_config'
require 'application_config'


class TC_ApplicationConfig < Test::Unit::TestCase

  USER_HOME = "#{ENV['HOME']}"
  APP_NAME  = "remote_executor"
  RC_FILE   = "#{USER_HOME}/.#{APP_NAME}rc"
  
  def setup
    
    @fixtures_settings = File.join( File.dirname( __FILE__ ), %w[.. fixtures settings.yml] )
    @test_settings     = '/tmp/settings.yml'
    
    @fixtures_rcfile   = File.join( File.dirname( __FILE__ ), %w[.. fixtures .fooapprc] )
    
    FileUtils.copy( @fixtures_settings, @test_settings )
    FileUtils.copy( @fixtures_rcfile, RC_FILE )
  end
  
  def teardown
    
    FileUtils.remove( @test_settings )
    FileUtils.remove( RC_FILE )
  end
  
  def test_build_user_config_file
    
    assert_equal( RC_FILE, RemoteExecutor::ApplicationConfig.build_user_config_file( APP_NAME ) )
    assert_not_equal( "#{ENV['HOME']}/foo", RemoteExecutor::ApplicationConfig.build_user_config_file( APP_NAME ) )
    assert_not_equal( "#{ENV['HOME']}/.foo", RemoteExecutor::ApplicationConfig.build_user_config_file( APP_NAME ) )
  end
    
  def test_initialize

    assert_instance_of( RemoteExecutor::ApplicationConfig, RemoteExecutor::ApplicationConfig.new( @test_file ) )
    assert_instance_of( RemoteExecutor::ApplicationConfig, RemoteExecutor::ApplicationConfig.new( 'foobar.yml' ) )
  end  
end