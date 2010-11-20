module RemoteExecutor  
  class System < Struct.new( :name, :user, :hosts )
    
    def initialize( params )
      
      unless params && params.class == Hash
        fail "Bad parameters"
      end
      
      if( params[:name] && params[:user] && params[:hosts] )
          
        super( params[:name], params[:user], params[:hosts] )         
        self
      end
    end
  end
end