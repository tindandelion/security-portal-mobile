require "watir-webdriver"

module PsbMobileSupport
  def start_application
    browser.goto(app_url)
  end

  def app_url
    ENV['APP_URL'] or raise "APP_URL is not set"
  end

  def browser
    @browser ||= Watir::Browser.new(:chrome)
  end
  
  def on_home_screen?
    home_screen = browser.div(:id =>'home-screen')
    not home_screen.class_name.include?('x-item-hidden')
  end
  
  def current_user
    home_screen = browser.div(:id =>'home-screen')
    home_screen.div(:id => 'current-user').text
  end
  
  def login_as(credentials)
    login_screen = browser.form(:id => 'login-screen')
    login_screen.text_field(:name => "username").set credentials[:username]
    login_screen.text_field(:name => "password").set credentials[:password]
    login_screen.div(:id => "action").click
  end
end

World(PsbMobileSupport)

After do |scenario|
  browser.close unless scenario.failed? 
end


