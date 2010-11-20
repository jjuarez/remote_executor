module RemoteExecutor
  
  class YAMLFileNotFound < Exception
  end
  
  class Config
    
    ##
    # Get the default configuration over Choice, environment and user default settings
    def self.get_config_file( config_key )
      
      if( Choice.choices[:config] )
        return Choice.choices[:config] 
      end
      
      if( environment_var = ENV["#{config_key.upcase}"] )
        return environment_var
      end
      
      if( user_config_file = File.join( "#{ENV['HOME']}", ".#{config_key.downcase}rc" ) )
        
        return user_config_file if File.exist?( user_config_file )
      end
      
      raise YAMLFileNotFound.new( "Configuration not found" )
    end
    
    def initialize()
      @config = YAML.load_file( Config.get_config_file( CLIApplication::NAME ) )
    rescue Exception => e
      raise YAMLFileNotFound.new( e.message )
    end    
  end
end