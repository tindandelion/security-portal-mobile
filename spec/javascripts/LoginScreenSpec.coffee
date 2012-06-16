Ext.require ['Portal.ui.LoginScreen']
    
describe 'LoginScreen', ->
  beforeEach ->
    @addMatchers(SenchaEventMatchers)
    
    @loginScreen = Ext.create('Portal.ui.LoginScreen')
    @driver = new LoginScreenDriver(@loginScreen)
  
  afterEach -> 
    @loginScreen.destroy()
  
  it 'fires the login request event when clicking on login button', -> 
    loginHandler = jasmine.createSpy('login-handler')
    @loginScreen.on 'loginRequest', loginHandler
    
    @driver.setCredentials('user-login', 'user-password')
    @driver.clickLogin()
    
    expect(loginHandler).toBeFiredWith('user-login', 'user-password')
