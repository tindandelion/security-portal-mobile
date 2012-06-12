require "sinatra"
require "json"
require "pathname"

require_relative "account_management"
require_relative 'sencha_framework'

class BackendServer < Sinatra::Base
  extend AccountManagement
  include SenchaFramework 
  
  set :public_folder, Pathname(__FILE__).dirname.parent + "client"
  
  get '/' do 
    redirect "/index.html"
  end
  
  get '/sencha-touch.js' do 
    content_type 'application/javascript'
    load_sencha_framework
  end
    
  
  post "/validate" do 
    credentials = JSON.parse(request.body.read)
    self.class.last_validated_user = credentials
    
    company = self.class.company_for_login(credentials["login"], credentials["password"])
    unauthorized_user unless company
    
    { 
      :company_name => company.name,
      :summary => company.summary 
    }.to_json
  end
  
  def unauthorized_user 
    halt 401
  end
end

