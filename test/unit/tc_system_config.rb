$:.unshift File.join( File.dirname( __FILE__ ), %w[.. .. lib remote_executor] )

require 'rubygems'
require 'test/unit'
require 'system_config'
require 'fileutils'


class TC_SystemConfig < Test::Unit::TestCase
 
  TEST_GOOD_SYSTEM_ID = 'wi.pro'
  TEST_SYSTEM_USER    = 'root'
  TEST_SYSTEM_HOSTS   = [ 'lr1.wi.pro', 'lr2.wi.pro', 'alf1.wi.pro', 'alf2.wi.pro' ]
  
  def setup   
     
    @fixtures_file = File.join( File.dirname( __FILE__ ), %w[.. fixtures settings.yml] )
    @test_file     = "/tmp/settings.yml"

    FileUtils.copy( @fixtures_file, @test_file )    

    Choice.options do
      option :config do
        short   '-c'
        long    '--config=settings.yml'
        desc    'The YAML config file'
        default '/tmp/settings.yml'
      end
    end
     
    @system_config = RemoteExecutor::SystemConfig.instance( @fixtures_file )
  end
  
  def teardown

    FileUtils.remove( @test_file )
  end

  def test_find_system
    
    assert_instance_of( Hash, @system_config.find_by_name( TEST_GOOD_SYSTEM_ID ))  
    assert_equal( TEST_GOOD_SYSTEM_ID, @system_config.find_by_name( TEST_GOOD_SYSTEM_ID )[:name] )
    assert_equal( TEST_SYSTEM_USER,    @system_config.find_by_name( TEST_GOOD_SYSTEM_ID )[:user] )
    assert_equal( TEST_SYSTEM_HOSTS,   @system_config.find_by_name( TEST_GOOD_SYSTEM_ID )[:hosts] )
    assert_raise( Exception ) { @system_config.find_by_name( 'fooSystem' ) }  
  end
end