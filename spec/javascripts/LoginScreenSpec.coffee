Ext.require ['Portal.view.Login']
    
describe 'LoginScreen', ->
  beforeEach ->
    @addMatchers(SenchaEventMatchers)
    
    @loginScreen = Ext.create('Portal.view.Login')
    @driver = new LoginScreenDriver(@loginScreen)
  
  afterEach -> 
    @loginScreen.destroy()
  
  it 'fires the login request event when clicking on login button', -> 
    loginHandler = jasmine.createSpy('login-handler')
    @loginScreen.on 'loginrequest', loginHandler
    
    @driver.setCredentials('user-login', 'user-password')
    @driver.clickLogin()
    
    expect(loginHandler).toBeFiredWith('user-login', 'user-password')
