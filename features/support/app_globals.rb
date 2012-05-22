module PortalApplication
  class PortalBridge 
    def initialize(browser)
      @browser = browser
    end
    
    def current_user
      @browser.execute_script('return Portal.current_user')
    end
    
  end
  
  def app
    PortalBridge.new(browser)
  end
end

World(PortalApplication)