require 'rubygems'
require 'choice'
require 'basic_config'


module RemoteExecutor
  class ChoiceConfig < BasicConfig
    
    def initialize  
      @config = BasicConfig.load_config( Choice.choices[:config] )
    end
  end
end