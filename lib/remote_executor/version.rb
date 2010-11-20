module RemoteExecutor  
  module Version

    MAJOR  = 0 
    MINOR  = 6 
    PATCH  = 0
    
    STRING = "#{MAJOR}.#{MINOR}.#{PATCH}"
  end 

  NAME          = 'remote_executor'
  VERSION       = Version::STRING
  COMPLETE_NAME = "#{NAME}-#{VERSION}"
end