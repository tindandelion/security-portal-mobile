Ext.Loader.setPath('Portal', 'public/Portal')
Ext.require ['Portal.ui.LoginScreen']

describe 'LoginScreen', ->
  
  beforeEach ->
    @loginScreen = Ext.create('Portal.ui.LoginScreen')
  
  afterEach -> 
    @loginScreen.destroy()
  
  it 'initializes', ->
    expect(@loginScreen).toBeDefined()
    
  it 'fires the login event when clicking on login button', -> 
    eventFired = false
    @loginScreen.on 'login', ->
      eventFired = true
      
    @loginScreen.fireEvent('login')
    expect(eventFired).toBeTruthy()