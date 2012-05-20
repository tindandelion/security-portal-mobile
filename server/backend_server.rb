require "sinatra"
require "json"
require "pathname"

require_relative "user_validation"

class BackendServer < Sinatra::Base
  extend UserValidation 
  
  set :public_folder, Pathname(__FILE__).parent.parent + "client"
  
  get '/' do 
    redirect "/index.html"
  end
  
  post "/validate" do 
    credentials = JSON.parse(request.body.read)
    self.class.last_validated_user = credentials
    
    if self.class.valid_credentials?(credentials)
      status 200
    else
      status 401
    end
  end
end

