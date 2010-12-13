require 'yaml'


module RemoteExecutor
  ##
  # Specific exception
  class YAMLFileNotFound < Exception
  end

  ##
  # Load data from YAML file
  class YAMLLoader

    def self.load_config( file )
      YAML.load_file( file )
    rescue Exception => file_not_found
      raise YAMLFileNotFound.new( file_not_found.message )
    end
  end
end