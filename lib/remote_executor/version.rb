module RemoteExecutor  
  module Version

    MAJOR = 0 
    MINOR = 4 
    PATCH = 0

    STRING = [MAJOR, MINOR, PATCH ].compact.join( '.' )
  end 

  NAME    = 'remote_executor'
  VERSION = Version::STRING
end