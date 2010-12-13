module Version
  module Info
  
    MAJOR  = 0 
    MINOR  = 7 
    PATCH  = 0
  end

  INFO     = "#{Info::MAJOR}.#{Info::MINOR}.#{Info::PATCH}"
  NAME     = 'remote_executor'

  COMPLETE = "#{NAME}-#{INFO}"
end
