require 'rexecutor/yaml_loader'
require 'rexecutor/system'


module RemoteExecutor
  
  ##
  # Utility exception
  class SystemNotFound < Exception
  end
  
  ##
  # A collection of System
  class Systems

    def self.load( system_file )
      YAMLLoader.load_config( system_file )
    end
    
    def find_by_name( name )
      
      @systems.each do |system| 
        return System.new( system ) if( system[:name] == name ) 
      end
      
      raise SystemNotFound.new( "System: '#{name}' not found" )
    end
    
    def initialize( system_file )
      @systems = Systems.load( system_file )
    end
  end
end