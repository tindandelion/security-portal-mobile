
module SecurityPortalUiSupport
  class Screen
    def initialize(element)
      @element = element
    end
    
    def visible? 
      not @element.class_name.include?('x-item-hidden')
    end
  end
  
  class LoginScreen < Screen
    def fill_credentials(login, password)
      @element.text_field(:name => "username").set login
      @element.text_field(:name => "password").set password
    end
    
    def login!
      @element.div(:id => "action").click
    end
  end
  
  class HomeScreen < Screen
    def company_name 
      @element.div(:id => 'company-name').text
    end
    
    def summary
      summary = @element.div(:id => 'summary-panel').
        text.
        split.
        collect {|ea| ea.downcase }
      summary.each_slice(2).to_a
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
  
  
  def login_as(login, password)
    screen = login_screen
    screen.fill_credentials(login, password)
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

World(SecurityPortalUiSupport)
