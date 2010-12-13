require 'version'
require 'basic_config'


module RemoteExecutor
  class ApplicationConfig < BasicConfig

    def self.build_user_config_file( application_name )
      "#{ENV['HOME']}/.#{application_name.downcase}rc"
    end
    
    def initialize( config_file )
      
      @config = BasicConfig.load_config( config_file ) if config_file
    rescue YAMLFileNotFound
      @config = BasicConfig.load_config( ApplicationConfig.build_user_config_file( Version::NAME ) )
    end
  end
end