$:.unshift File.join( File.dirname( __FILE__ ), %w[.. .. lib remote_executor] )

require 'rubygems'
require 'test/unit'
require 'choice_config'
require 'fileutils'


class TC_ChoiceConfig < Test::Unit::TestCase
 
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
  end
  
  def teardown

    FileUtils.remove( @test_file )
  end

  def test_initialize

    assert_instance_of( RemoteExecutor::ChoiceConfig, RemoteExecutor::ChoiceConfig.new )
  end
end