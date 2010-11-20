module RemoteExecutor
  
  class ConfigurationError < Exception
  end
  
  class SystemConfig < Config
    include Singleton

    def find_system( system_name )
      
      @config.each { |s| return s if( s[:name] == system_name) }
      
      raise ConfigurationError.new( "System #{system_name} not found" )
    end
    
    def find_environment( system_name )
      @config.each { |s| return s[:environment].to_sym if( s[:name] == system_name) }

      raise ConfigurationError.new( "The system #{system_name} do not have declared environment" )
    end
    
    def find_hosts( system_name )
      @config.each { |s| return s[:hosts] if( s[:name] == system_name) }

      raise ConfigurationError.new( "The system #{system_name} do not have host lists, WTF!!!" )
    end      
  end
end