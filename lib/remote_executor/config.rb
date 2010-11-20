module RemoteExecutor
  
  class YAMLFileNotFound < Exception
  end
  
  class Config
    
    ##
    # Get the default configuration over Choice, environment and user default settings
    def self.get_config_file( config_key )
      
      return Choice.choices[:config] if Choice.choices[:config]
      
      environment_var = ENV["#{config_key.upcase}"]
      return environment_var if environment_var
      
      default_user_config_file = "#{ENV['HOME']}/.#{config_key.downcase}rc"
      return default_user_config_file if File.exist?( default_user_config_file )
      
      raise YAMLFileNotFound.new( "Configuration file not found" )
    end
    
    def initialize()
      @config = YAML.load_file( Config.get_config_file( CLIApplication::NAME ) )
    rescue Exception => e
      raise YAMLFileNotFound.new( e.message )
    end    
  end
end