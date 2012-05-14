require "watir-webdriver"

module SecurityPortalSupport
  class Screen
    def initialize(element)
      @element = element
    end
    
    def visible? 
      not @element.class_name.include?('x-item-hidden')
    end
  end
  
  class LoginScreen < Screen
    def credentials=(values)
      @element.text_field(:name => "username").set values[:username]
      @element.text_field(:name => "password").set values[:password]
    end
    
    def login!
      @element.div(:id => "action").click
    end
  end
  
  class HomeScreen < Screen
    def current_user 
      @element.div(:id => 'current-user').text
    end
  end
  
  class MessageBox
    def self.find(browser)
      new(browser.div(:class => 'x-msgbox'))
    end
    
    def initialize(element)
      @element = element
    end
    
    def title
      @element.div(:class => 'x-title').text
    end
    
    def text
      @element.div(:class => 'x-body').text
    end
  end
  
  def start_application
    browser.goto(app_url)
  end

  def app_url
    ENV['APP_URL'] or raise "APP_URL is not set"
  end

  def browser
    @browser ||= Watir::Browser.new(:chrome, :switches => ['--disable-web-security'])
  end
  
  def login_as(credentials)
    screen = login_screen
    screen.credentials = credentials
    screen.login!
  end
  
  def login_screen 
    LoginScreen.new(browser.form(:id => 'login-screen'))
  end
  
  def home_screen 
    HomeScreen.new(browser.div(:id =>'home-screen'))
  end
  
  def has_shown_error?(params)
    box = MessageBox.find(browser)
    box.title.should == params[:title]
    box.text.should == params[:text]
  end
end

World(SecurityPortalSupport)

After do |scenario|
  browser.close unless scenario.failed? 
end


