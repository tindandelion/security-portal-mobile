require "safariwatir"

module PsbMobileSupport
  def start_application
    browser.goto(app_url)
  end

  def app_url
    ENV['APP_URL'] or raise "APP_URL is not set"
  end

  def browser
    @browser ||= Watir::Safari.new
  end
  
  def login_as(credentials)
    browser.text_field(:id, "login-username").set credentials[:username]
    browser.text_field(:id, "login-password").set credentials[:password]
    browser.button(:id, "login-action").click
  end
end

World(PsbMobileSupport)

