module RemoteExecutor
  
  class System < Struct.new( :name, :environment, :user, :hosts )
    
    public
    def initialize( params )
      
      unless params && params.class == Hash
        fail "Bad parameters"
      end
      
      if( params[:name]  &&
          params[:environment]  &&
          params[:user] &&
          params[:hosts]  )
          
        super( params[:name], params[:environment], params[:user], params[:hosts] )         
        self
      end
    end
  end
end