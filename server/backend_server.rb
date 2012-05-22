require "sinatra"
require "json"
require "pathname"

require_relative "account_management"

class BackendServer < Sinatra::Base
  extend AccountManagement 
  
  set :public_folder, Pathname(__FILE__).dirname.parent + "client"
  
  get '/' do 
    redirect "/index.html"
  end
  
  post "/validate" do 
    credentials = JSON.parse(request.body.read)
    self.class.last_validated_user = credentials
    
    company = self.class.company_for_login(credentials["login"], credentials["password"])
    unauthorized_user unless company
    
    { :company => company.name }.to_json
  end
  
  def unauthorized_user 
    halt 401
  end
end

