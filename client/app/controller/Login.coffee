Ext.define 'Portal.controller.Login', 
  extend: 'Ext.app.Controller'
  config: 
    refs: 
      viewport: 'viewport'
      homeScreen: '#home-screen'
      loginScreen: '#login-screen'
    control: 
      loginScreen: 
        loginrequest: 'onLoginRequest'
          
  launch: -> 
    @showLoginScreen()
    
  onLoginRequest: (login, password) -> 
    Ext.Ajax.request
      url: "/validate"
      method: 'POST'
      jsonData: {login, password}
      success: (response) =>
        context = Ext.decode(response.responseText) 
        @showHomeScreen(context)
      failure: => @showLoginError()
    
  showHomeScreen: (context) -> 
    screen = @getHomeScreen()
    screen.setContext(context)
    @getViewport().setActiveItem(screen)
    
  showLoginScreen: -> 
    @getViewport().setActiveItem(@getLoginScreen())
  
  showLoginError: -> 
    Ext.Msg.alert('Login error', 'Invalid user name or password')
