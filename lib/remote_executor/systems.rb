require 'rubygems'
require 'remote_executor/system'


module RemoteExecutor
  
  ##
  # Utility exception
  class SystemNotFound < StandardError
  end
  
  class SystemsFileError < StandardError
  end
  
  ##
  # A collection of System
  class Systems
    
    def self.create( system_entry )
      
      return System.new( system_entry )
    end

    def find_by_name( name )
      
      @systems.each do |entry|
        
        return Systems.create( entry ) if( name == entry[:name] ) 
      end
      
      raise SystemNotFound.new( "System: '#{name}' not found" )
    end
    
    def initialize( system_file )
    
      @systems = YAML::load_file( system_file )
    rescue Exception => e
      raise SystemsFileError.new( e.message )
    else
      self
    end
  end
end