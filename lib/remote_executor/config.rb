module RemoteExecutor
  class Config
    include Singleton
    
    def initialize()
      @config = YAML.load_file( Choice.choices[:config] )
    end
    
    def [](key)
      @config[key.to_sym] if @config
    end
  end
end