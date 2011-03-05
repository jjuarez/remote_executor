$:.unshift( File.join( File.dirname( __FILE__ ), %w[.. .. lib] ) )


require 'rubygems'
require 'fileutils'
require 'shoulda'
require 'remote_executor/system'
require 'remote_executor/systems'


class SystemsTest < Test::Unit::TestCase
   
  context "Systems" do

    TEST_SYSTEM_NAME  = 'server.environment'
    TEST_SYSTEM_USER  = 'user'
    TEST_SYSTEM_HOSTS = [ 
      'server1.system.environment', 
      'server2.system.environment', 
      'server3.system.environment', 
      'server4.system.environment' 
    ]
    TEST_PARAMS = { 
      :name  =>TEST_SYSTEM_NAME, 
      :user  =>TEST_SYSTEM_USER, 
      :hosts =>TEST_SYSTEM_HOSTS
    }

    setup do   

      @fake_systems_file = "fakeSystemsFile.yml"
      @systems_file = File.join( File.dirname( __FILE__ ), %w[fixtures systems.yml] )
      @systems      = RemoteExecutor::Systems.new( @systems_file )
    end

    should "the systems file do not exist" do
      assert_raises( RemoteExecutor::SystemsFileError ) { RemoteExecutor::Systems.new( @fake_systems_file ) }
    end
    
    should "load systems from file"  do
      assert( File.exist?( @systems_file ) )
      assert( @systems )
    end
    
    should "find some system by name" do    
      assert_instance_of( RemoteExecutor::System, @systems.find_by_name( TEST_SYSTEM_NAME ) )
    end
    
    should "find system by name equals name" do
      assert_equal( TEST_SYSTEM_NAME,  @systems.find_by_name( TEST_SYSTEM_NAME ).name )
    end
    
    should "find system by name equals user" do
      assert_equal( TEST_SYSTEM_USER,  @systems.find_by_name( TEST_SYSTEM_NAME ).user )
    end
    
    should "find system by name equals hosts" do
      assert_equal( TEST_SYSTEM_HOSTS, @systems.find_by_name( TEST_SYSTEM_NAME ).hosts )
    end
    
    should "find system by name raises exception" do
      assert_raises( RemoteExecutor::SystemNotFound ) { @systems.find_by_name( 'thisSystemDoNotExist' ) }  
    end
  end
end