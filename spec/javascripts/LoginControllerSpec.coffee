Ext.require ['Portal.controller.Login', 'Ext.MessageBox']

describe "Login Controller", -> 
  beforeEach ->
    app = jasmine.createSpyObj('application', ['getRouter', 'control', 'getName'])
    @controller = Ext.create 'Portal.controller.Login',
      application: app
      
  it 'calls login request handler', ->
    @controller.showLoginError = jasmine.createSpy()
    @controller.onLoginRequest('user', 'password')  
    
    
    