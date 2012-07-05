require "watir-webdriver"

module WatirSupport
  def start_application
    browser.goto(app_url)
  end
  
  def leave_application
    browser.goto("about:blank")
  end

  def app_url
    ENV['APP_URL'] or raise "APP_URL is not set"
  end

  def browser
    @browser ||= Watir::Browser.new(:chrome, :switches => ['--disable-web-security'])
  end
end

World(WatirSupport)

After do |scenario|
  browser.close unless scenario.failed? 
end
