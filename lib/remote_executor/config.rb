require 'rubygems'
require 'choice'
require 'yaml'
require 'app'


module RemoteExecutor
  
  class YAMLFileNotFound < Exception
  end

  class ConfigurationNotLoaded < Exception
  end

  class ConfigurationError < Exception
  end
  
  class Config
  
    def load_config( config_file )
      
      @config = YAML.load_file( config_file )
    rescue Exception => e
      raise YAMLFileNotFound.new( e.message )
    end 
      
    public  
    def initialize
      
      cli_cfn = Choice.choices[:config]
      if( cli_cfn )

        load_config( cli_cfn )
      else
        environment_cfn = ENV[CLIApplication::NAME.upcase]
        
        if( environment_cfn && '' != environment_cfn )
          
          load_config( environment_cfn )
        else
          user_cfn = "#{ENV['HOME']}/.#{CLIApplication::NAME.downcase}rc"
          
          if( user_cfn && '' != user_cfn && File.exist?( user_cfn ) )
            
            load_config( user_cfn )
          else
            raise ConfigurationNotLoaded.new( "Configuration not loaded" )           
          end
        end
      end
    end
  end
end