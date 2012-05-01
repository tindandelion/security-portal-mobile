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
end

World(PsbMobileSupport)

