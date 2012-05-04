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
    home_screen = browser.div(:id => 'home-screen')
    not home_screen.class_name.include?('x-item-hidden')
  end
  
  def login_as(credentials)
    browser.text_field(:name => "login-username").set credentials[:username]
    browser.text_field(:name => "login-password").set credentials[:password]
    browser.div(:id => "login-action").click
  end
end

World(PsbMobileSupport)

