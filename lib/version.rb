module Version
  module Info
  
    MAJOR  = 0 
    MINOR  = 7 
    PATCH  = 0
    
    INFO   = "#{MAJOR}.#{MINOR}.#{PATCH}"
  end

  NAME     = 'remote_executor'
  COMPLETE = "#{NAME}-#{Info::INFO}"
end
