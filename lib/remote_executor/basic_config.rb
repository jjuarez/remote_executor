require 'yaml'


module RemoteExecutor
  class YAMLFileNotFound < Exception; end

  class BasicConfig

    def self.load_config( config_file )
      YAML.load_file( config_file )
    rescue Exception => e
      raise YAMLFileNotFound.new( e.message )
    end
  end
end