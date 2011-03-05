module RemoteExecutor  
  
  ##
  # System represents a set of hosts that implement a service
  class System
    
    PARAMETERS = [:name, :user, :hosts]
    
    attr_reader :name, :user, :hosts
        
    private
    def self.validate_parameters( parameters )

      raise ArgumentError.new( "Parameters must be a Hash" ) unless parameters.instance_of?( Hash )
      raise ArgumentError.new( "Some parameters are not present" ) unless( parameters[:name] && parameters[:user] && parameters[:hosts] )
    end

    public
    def initialize( parameters )
      
      System.validate_parameters( parameters )
      
      @name  = parameters[:name]
      @user  = parameters[:user]
      @hosts = parameters[:hosts]      
    end
    
    def to_s
      "#{@user}\@#{@name}:#{@hosts.inspect}"
    end
  end
end